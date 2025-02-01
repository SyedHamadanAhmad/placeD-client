import 'package:flutter/material.dart';
import 'package:placed_client/services/latest_course_provider.dart';
import 'package:placed_client/templates_lib/main_template.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:placed_client/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:placed_client/models/courses.dart';
import 'package:placed_client/pages/course_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  // Updated method: Fetch the latest course details from Hive using the ID stored in the provider.
  void _goToLatestCourse() async {
    // Retrieve the latest course ID from the provider.
    final latestCourseId =
        Provider.of<LatestCourseProvider>(context, listen: false).latestCourse;

    if (latestCourseId != null) {
      // Open the Hive box for saved courses.
      final Box<Courses> coursesBox = await Hive.openBox<Courses>('courses');

      // Retrieve the course using its ID.
      final Courses? course = coursesBox.get(latestCourseId);

      if (course != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoursePage(
              courseId: course.courseId,
              saved: true,
              courseImage: course.courseImg,
              courseName: course.courseName,
              chapters: course.content,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Course not found for ID: $latestCourseId')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No latest course set.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = context.watch<UserProvider>().user;

    // Create a list of slides for the top carousel.
    final List<Widget> topCarouselItems = [
      // First slide: "Continue your progress" with the embedded button.
      Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            // Use a Stack so we can overlay the button inside this slide.
            child: Stack(
              children: [
                // The slide text.
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Continue your progress',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                // Positioned circular button.
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: GestureDetector(
                    onTap: _goToLatestCourse,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      // Second slide: "Second Item" without a button.
      Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Second Item',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ];

    return MainTemplate(
      title: 'PlaceD',
      currentIndex: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              // Top Carousel using the list created above.
              CarouselSlider(
                carouselController: _carouselController,
                items: topCarouselItems,
                options: CarouselOptions(
                  height: 150,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 20),
              // Floating container for adding new courses.
              Container(
                height: 75,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF479539),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add new courses',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Get ahead and be placement ready',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        if (currentUser != null) {
                          Navigator.pushNamed(context, '/createCourse');
                        } else {
                          Navigator.pushNamed(context, '/profile');
                        }
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Explore our catalog',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Pick from our recommended selection',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(136, 245, 83, 14),
                ),
              ),
              SizedBox(height: 16),
              // Bottom Carousel displaying catalog courses.
              ValueListenableBuilder(
                valueListenable: Hive.box('catalogCourses').listenable(),
                builder: (context, Box box, _) {
                  final courses = box.values.toList().cast<Courses>();

                  if (courses.isEmpty) {
                    return Center(
                      child: Text('No courses available'),
                    );
                  }

                  return CarouselSlider(
                    items: courses.map((course) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CoursePage(
                                    courseId: course.courseId,
                                    saved: true,
                                    courseImage: course.courseImg,
                                    courseName: course.courseName,
                                    chapters: course.content,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Image.network(
                                        course.courseImg,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            color: Colors.grey[300],
                                            child: Icon(
                                              Icons.broken_image,
                                              color: Colors.grey[500],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              course.courseName,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 320,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
