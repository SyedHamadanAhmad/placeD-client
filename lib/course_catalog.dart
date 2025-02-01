import 'dart:convert';

import 'package:placed_client/models/courses.dart';
import 'package:placed_client/models/chapter.dart';




String response1='''[

    {
        "topic_name": "Introduction to Data Structures and Algorithms",
        "paragraphs": [
            "Welcome to the world of Data Structures and Algorithms (DSA)! This is the foundation for writing efficient and effective code. Think of data structures as ways to organize and store data, while algorithms are the step-by-step instructions to solve a problem. For example, imagine having a large collection of books; a data structure would be how you organize them on shelves (by genre, author, etc.), and an algorithm would be the method you use to find a specific book.",
            "Why is DSA so important? In software engineering, everything from managing user data to optimizing search engines relies on DSA. Efficient algorithms and data structures directly impact the speed and resource consumption of programs. Without it, your programs may be slower and you might run out of memory. It teaches us how to think about problems systematically and how to select the appropriate tools for optimal solutions.",
            "Learning DSA also develops problem-solving skills. It trains your mind to break down complex tasks into smaller, manageable parts, and it helps you reason about the trade-offs involved in choosing different approaches. This is useful even outside the realm of software engineering. Through studying DSA, you will learn to think more logically and carefully analyze the task at hand which will help you in every walk of life."
        ],
        "links": [
            "https://www.geeksforgeeks.org/introduction-to-data-structures/",
            "https://www.tutorialspoint.com/data_structures_algorithms/index.htm",
            "https://www.javatpoint.com/data-structure-tutorial"
        ],
        "yt_links": [
            {
                "title": "The Best Book To Learn Algorithms From For Computer Science",
                "video_url": "https://www.youtube.com/watch?v=NgoXCJk_o7I"
            },
            {
                "title": "Introduction to Data Structures &amp; Algorithms",
                "video_url": "https://www.youtube.com/watch?v=5_5oE5lgrhw"
            },
            {
                "title": "How to read an Algorithms Textbook!",
                "video_url": "https://www.youtube.com/watch?v=Fo6EOtVunm0"
            },
            {
                "title": "Introduction to Data Structure &amp; Algorithms | Learn Coding",
                "video_url": "https://www.youtube.com/watch?v=-D5u5HJbISc"
            },
            {
                "title": "👍 Finally, my review of Grokking Algorithms 📖",
                "video_url": "https://www.youtube.com/watch?v=BBjOIUvQk70"
            }
        ]
    },
    {
        "topic_name": "Arrays and Strings",
        "paragraphs": [
            "Arrays are one of the simplest and most fundamental data structures. Think of an array as a list where each element is stored at a specific index (position). Arrays store elements of the same data type contiguously in memory, making access to them very fast. For example, an array of integers might store test scores, or an array of strings might store names.",
            "Strings, on the other hand, are sequences of characters, and often treated as arrays of characters. While they share some properties with arrays, the way they are treated might differ depending on the programming language. Strings can represent names, sentences, or any textual data. Arrays and strings are used extensively in programming for handling lists of data, processing text, and much more.",
            "Understanding how to manipulate and process arrays and strings is critical for any programmer. Common tasks include searching for a particular value, sorting array elements, reversing strings, finding patterns, and more. This fundamental knowledge builds the foundation for more advanced data structures and algorithms and forms a crucial skill for any developer."
        ],
        "links": [
            "https://www.geeksforgeeks.org/array-data-structure/",
            "https://www.geeksforgeeks.org/string-data-structure/",
            "https://www.tutorialspoint.com/data_structures_algorithms/array_data_structure.htm"
        ],
        "yt_links": [
            {
                "title": "What is Array in C Language ? | C Language Free Course | by Rahul Sir",
                "video_url": "https://www.youtube.com/watch?v=fu04NXbIeGo"
            },
            {
                "title": "Array of Strings",
                "video_url": "https://www.youtube.com/watch?v=AefKSoNpZtQ"
            },
            {
                "title": "Strings &amp; Character Arrays in C++  -  Part 1 | DSA Placement Series",
                "video_url": "https://www.youtube.com/watch?v=MOSjYaVymcU"
            },
            {
                "title": "C array of strings🧵",
                "video_url": "https://www.youtube.com/watch?v=IqcJSGh1AWs"
            },
            {
                "title": "C_46 Arrays in C - part 1 | Introduction to Arrays",
                "video_url": "https://www.youtube.com/watch?v=08LWytp6PNI"
            }
        ]
    },
    {
        "topic_name": "Basic Sorting Algorithms (Bubble, Insertion, Selection Sort)",
        "paragraphs": [
            "Sorting is a fundamental operation in computer science. It is the process of arranging elements of a collection (like an array) in a specific order (ascending or descending). Understanding sorting is important because it has many real-world applications. For instance, sorting makes data easier to search through, and many algorithms use sorting as a pre-processing step.",
            "Bubble sort is the simplest sorting algorithm where we repeatedly swap adjacent elements that are in the wrong order. It's easy to understand but not very efficient for larger datasets. Insertion sort works by building a sorted list one element at a time by picking the next element and inserting it in the right place in the sorted part. Selection sort repeatedly finds the minimum element from the unsorted part and places it at the beginning.",
            "Although these basic algorithms are not the most performant in terms of time complexity, understanding them will help you grasp fundamental concepts of algorithmic design like time complexity, and best/worst/average case scenarios. They demonstrate how simple algorithms can solve complex problems, and form a necessary foundation for learning more advanced sorting techniques."
        ],
        "links": [
            "https://www.geeksforgeeks.org/bubble-sort/",
            "https://www.geeksforgeeks.org/insertion-sort/",
            "https://www.geeksforgeeks.org/selection-sort/"
        ],
        "yt_links": [
            {
                "title": "insertion sort, selection sort, bubble sort, algorithm and examples |  pps | c language",
                "video_url": "https://www.youtube.com/watch?v=m8QrJ8LDIHE"
            },
            {
                "title": "Sorting Algorithms | Bubble Sort, Selection Sort &amp; Insertion Sort | DSA Series by Shradha Ma&#39;am",
                "video_url": "https://www.youtube.com/watch?v=1jCFUv-Xlqo"
            },
            {
                "title": "Insertion Sort | Simply Explained",
                "video_url": "https://www.youtube.com/watch?v=8OatrdaqjVM"
            },
            {
                "title": "Sorting - Part 1 | Selection Sort, Bubble Sort, Insertion Sort | Strivers A2Z DSA Course",
                "video_url": "https://www.youtube.com/watch?v=HGk_ypEuS24"
            },
            {
                "title": "10 Sorting Algorithms Easily Explained",
                "video_url": "https://www.youtube.com/watch?v=rbbTd-gkajw"
            }
        ]
    },
    {
        "topic_name": "Searching Algorithms (Linear and Binary Search)",
        "paragraphs": [
            "Searching refers to locating a specific element within a dataset. Knowing how to search efficiently is a crucial skill for any programmer, as search operations are one of the most frequently performed tasks. For instance, searching is performed when you use the search feature on any website, or when you are searching through a database.",
            "Linear search is a straightforward approach that simply checks every element in the dataset sequentially until the target element is found. This is easy to implement but can be inefficient for large datasets. Binary search is more efficient, but it requires the dataset to be sorted first. It repeatedly divides the search interval in half, quickly eliminating a large number of elements with each step. This significantly improves performance when searching through sorted datasets.",
            "Choosing the right search algorithm depends on factors like whether the data is sorted or the size of the data. Understanding both algorithms will help you analyze the time complexities, and performance differences of algorithms, which helps in the long run with problem solving. It is not enough to be able to solve the problem, it is also important to be able to solve the problem efficiently, which becomes apparent once we study search algorithms."
        ],
        "links": [
            "https://www.geeksforgeeks.org/linear-search-algorithm/",
            "https://www.geeksforgeeks.org/binary-search/",
            "https://www.tutorialspoint.com/data_structures_algorithms/linear_search_algorithm.htm"
        ],
        "yt_links": [
            {
                "title": "Linear search vs Binary search",
                "video_url": "https://www.youtube.com/watch?v=sSYQ1H9-Vks"
            },
            {
                "title": "Data Structure Searching (Linear &amp; Binary) | Learn Coding",
                "video_url": "https://www.youtube.com/watch?v=goqe7OZrJt4"
            },
            {
                "title": "Linear Vs Binary Search + Code in C Language (With Notes)",
                "video_url": "https://www.youtube.com/watch?v=ZHCP9vFOJiU"
            },
            {
                "title": "Binary Search Algorithm - Simply Explained",
                "video_url": "https://www.youtube.com/watch?v=uTyxscVC_-U"
            },
            {
                "title": "7.1 Linear Search Algorithm | Linear Search in C | Data Structures Tutorials",
                "video_url": "https://www.youtube.com/watch?v=C46QfTjVCNU"
            }
        ]
    },
    {
        "topic_name": "Introduction to Linked Lists",
        "paragraphs": [
            "Linked lists are a dynamic data structure, which means the size of linked list is not fixed and can change at runtime. Think of a linked list as a sequence of nodes, each containing a data element and a reference (or pointer) to the next node in the sequence. Unlike arrays where elements are stored contiguously, the nodes of a linked list are not necessarily stored adjacent to each other in memory, providing more flexibility and dynamic behaviour.",
            "Linked lists are used when you do not know how many elements to store at compile time, or when frequent insertions and deletions are needed (as linked lists are more efficient at these tasks than arrays). Understanding their structure is essential for working with more complex data structures like graphs and trees. There are also a few variations of linked list such as double linked list which can be further explored to have a deeper understanding of linked lists.",
            "Learning about linked lists is crucial for understanding dynamic data management and provides an alternate option for many problems where arrays are not optimal. It will help you learn how to manage memory dynamically and think about the trade-offs between different data structures and to pick the appropriate one for the task at hand."
        ],
        "links": [
            "https://www.geeksforgeeks.org/linked-list-data-structure/",
            "https://www.tutorialspoint.com/data_structures_algorithms/linked_list_data_structure.htm",
            "https://www.javatpoint.com/linked-list-data-structure"
        ],
        "yt_links": [
            {
                "title": "Introduction to Linked List",
                "video_url": "https://www.youtube.com/watch?v=R9PTBwOzceo"
            },
            {
                "title": "2.1 Introduction to Linked List | Need of Linked List | DSA Tutorials",
                "video_url": "https://www.youtube.com/watch?v=dmb1i4oN5oE"
            },
            {
                "title": "Introduction to Linked List data structure easy explain",
                "video_url": "https://www.youtube.com/watch?v=nG8Z_rEs12A"
            },
            {
                "title": "Introduction to Linked List in Data Structures (With Notes)",
                "video_url": "https://www.youtube.com/watch?v=TWMCMvfEAv4"
            },
            {
                "title": "Introduction to linked list",
                "video_url": "https://www.youtube.com/watch?v=NobHlGUjV3g"
            }
        ]
    },
    {
        "topic_name": "Stacks and Queues",
        "paragraphs": [
            "Stacks and queues are two abstract data types that are used for storing data. A stack operates on the principle of “Last In, First Out” (LIFO). Imagine a stack of plates; the last plate you put on is the first one you take off. Stacks are used when we need to keep track of items which need to be accessed in reverse order, like during a function call in programming, or in implementing undo features.",
            "A queue operates on the principle of “First In, First Out” (FIFO), similar to a queue of people waiting in line. The first one in line gets served first. Queues are used to manage tasks in the order they arrive, such as print queues, or processing requests in a web server. Both stacks and queues are relatively simple to implement but have wide-ranging applications.",
            "Understanding how stacks and queues work helps in creating elegant solutions to various computing problems. It also helps develop a deeper understanding of computer architecture. They are foundational in computer science for task management and data processing and crucial for building larger systems."
        ],
        "links": [
            "https://www.geeksforgeeks.org/stack-data-structure/",
            "https://www.geeksforgeeks.org/queue-data-structure/",
            "https://www.tutorialspoint.com/data_structures_algorithms/stack_data_structure.htm"
        ],
        "yt_links": [
            {
                "title": "Stacks And Queues In Data Structure | Data Structures And Algorithms Tutorial | Simplilearn",
                "video_url": "https://www.youtube.com/watch?v=lno6Ft0tOZI"
            },
            {
                "title": "Introduction to Stacks and Queues (Data Structures &amp; Algorithms #12)",
                "video_url": "https://www.youtube.com/watch?v=A3ZUpyrnCbM"
            },
            {
                "title": "Data Structures: Stacks and Queues",
                "video_url": "https://www.youtube.com/watch?v=wjI1WNcIntg"
            },
            {
                "title": "Difference between stack and queue | what  is stack and queue | Data structure",
                "video_url": "https://www.youtube.com/watch?v=A-6WgqH7bQ4"
            },
            {
                "title": "Stack in Data Structure | Learn Coding",
                "video_url": "https://www.youtube.com/watch?v=h4HpJMSxcF8"
            }
        ]
    },
    {
        "topic_name": "Introduction to Hash Tables",
        "paragraphs": [
            "Hash tables, also known as hash maps or dictionaries, are a powerful and efficient data structure used to store data in key-value pairs. Imagine a real dictionary; you look up a word (key) and you get its definition (value). Hash tables use a hashing function to map the key to a specific index in an array (or a bucket) where the corresponding value is stored.",
            "The main advantage of using hash tables is their speed. When implemented well, insert, search, and delete operations can be completed in almost constant time, regardless of the number of data items stored. Hash tables are used everywhere, for example in databases, caches, and in programming language dictionaries. They offer a very fast way to look up information by key.",
            "Understanding the concept of hash tables helps you build applications that require very fast lookups and insertions. It is a skill that is useful for solving complex real world problems. Learning hash tables improves your understanding of algorithmic complexity and how to build highly efficient programs. "
        ],
        "links": [
            "https://www.geeksforgeeks.org/hashing-data-structure/",
            "https://www.tutorialspoint.com/data_structures_algorithms/hash_data_structure.htm",
            "https://www.javatpoint.com/data-structure-hash-table"
        ],
        "yt_links": [
            {
                "title": "Hash tables in 4 minutes",
                "video_url": "https://www.youtube.com/watch?v=knV86FlSXJ8"
            },
            {
                "title": "L-6.1: What is hashing with example | Hashing in data structure",
                "video_url": "https://www.youtube.com/watch?v=W5q0xgxmRd8"
            },
            {
                "title": "What is a HashTable Data Structure - Introduction to Hash Tables , Part 0",
                "video_url": "https://www.youtube.com/watch?v=MfhjkfocRR0"
            },
            {
                "title": "Introduction to Hash Tables and Dictionaries (Data Structures &amp; Algorithms #13)",
                "video_url": "https://www.youtube.com/watch?v=sfWyugl4JWA"
            },
            {
                "title": "Learn Hash Tables in 13 minutes #️⃣",
                "video_url": "https://www.youtube.com/watch?v=FsfRsGFHuv4"
            }
        ]
    },
    {
        "topic_name": "Introduction to Trees",
        "paragraphs": [
            "Trees are hierarchical data structures used to organize data in the form of a tree-like structure with parent-child relationships. In computer science, they are very important for organizing data in a way that’s easy to search, sort, and process. A tree is made of nodes and edges; with a single root node as the starting point. Each node can have child nodes which in turn can also have child nodes.",
            "Trees are used in many applications like representing file systems, database indexing and binary search trees. Binary search trees are particularly important since they provide efficient ways to search data. They can be used to implement sets and maps. They also form the base of more complex data structures like heaps and graphs.",
            "Understanding trees and how to work with them is an essential skill for any software engineer. This knowledge is useful not just for problem solving but also for building larger and more complex systems. Understanding tree data structures can significantly improve your skill for problem solving."
        ],
        "links": [
            "https://www.geeksforgeeks.org/tree-data-structure/",
            "https://www.tutorialspoint.com/data_structures_algorithms/tree_data_structure.htm",
            "https://www.javatpoint.com/tree-data-structure"
        ],
        "yt_links": [
            {
                "title": "5.1 Tree in Data Structure | Introduction to Trees | Data Structures Tutorials",
                "video_url": "https://www.youtube.com/watch?v=YAdLFsTG70w"
            },
            {
                "title": "Introduction to Trees",
                "video_url": "https://www.youtube.com/watch?v=oI0QhFzBSRo"
            },
            {
                "title": "Data structures: Introduction to Trees",
                "video_url": "https://www.youtube.com/watch?v=qH6yxkw0u78"
            },
            {
                "title": "L-3.7: Introduction to Trees (Binary Tree, Almost Complete Binary Tree, Full BT, Complete BT, BST)",
                "video_url": "https://www.youtube.com/watch?v=I_JuQ5ayPmc"
            },
            {
                "title": "DSA 1.31 Part 1: Introduction of Tree Data Structure | Trees Terminologies With Examples.",
                "video_url": "https://www.youtube.com/watch?v=eCxKrqJgsOQ"
            }
        ]
    },
    {
        "topic_name": "Basic Graph Concepts",
        "paragraphs": [
            "Graphs are a versatile data structure used to represent relationships between objects or entities. They consist of nodes (or vertices) and edges connecting these nodes, representing the relationships between them. Graphs can model various real-world scenarios like social networks, roads in a map, or connections in a network. They're a very good way of modelling real life relationships between entities.",
            "Graphs can be directed, where edges have a specific direction (e.g., a one-way street) or undirected, where edges don't have a specific direction (e.g., a friendship relation). They're used in algorithms for route finding, network analysis and recommendation systems, and are crucial for solving a lot of practical problems. Understanding the basics of graphs is a must to understand these advanced applications of graphs.",
            "Understanding graphs will enhance your problem-solving skills and allow you to explore the world of network analysis. A thorough understanding of graphs opens up opportunities for solving various real world problems in an optimized fashion. It is a core building block for more complex algorithms."
        ],
        "links": [
            "https://www.geeksforgeeks.org/graph-data-structure-and-algorithms/",
            "https://www.tutorialspoint.com/data_structures_algorithms/graph_data_structure.htm",
            "https://www.javatpoint.com/graph-data-structure"
        ],
        "yt_links": [
            {
                "title": "Introduction to Graph Theory: A Computer Science Perspective",
                "video_url": "https://www.youtube.com/watch?v=LFKZLXVO-Dg"
            },
            {
                "title": "Intro to Graph Theory | Definitions &amp; Ex: 7 Bridges of Konigsberg",
                "video_url": "https://www.youtube.com/watch?v=C7YrMRdLkqo"
            },
            {
                "title": "Graph Terminologies ||Basic concepts of Graphs || Discrete Mathematics || DMS || MFCS | DS",
                "video_url": "https://www.youtube.com/watch?v=U_V715lstgY"
            },
            {
                "title": "Introduction to Graph Theory | Basics of Graph Theory | Imp for GATE and UGC NET",
                "video_url": "https://www.youtube.com/watch?v=5eKDQmTzX2A"
            },
            {
                "title": "Graph in Data Structure | BFS &amp; DFS Algorithms | Learn Coding",
                "video_url": "https://www.youtube.com/watch?v=lg48ZZe7YUA"
            }
        ]
    },
    {
        "topic_name": "Problem Solving Strategies",
        "paragraphs": [
            "Problem solving is an essential skill in software engineering. It involves breaking down a complex problem into smaller, more manageable parts, identifying and implementing a solution. This is not only essential for writing code, but it also teaches us how to think logically and carefully about the task at hand. Understanding how to approach a problem is more important than knowing the answer immediately.",
            "Strategies include using algorithms you've learned, choosing appropriate data structures, and using logical and careful problem decomposition. Working through problems with pen and paper can help to visualize the solution and test it with various edge cases. One of the most effective problem solving methods is to break the problem down into sub problems.",
            "Learning to solve problems systematically and efficiently is key to building a strong foundation in software engineering. This is a skill that can be learnt through constant practice and exposure to problems. The journey to learning problem solving can be greatly simplified by learning the various data structures and algorithms we've covered in this course, which in turn helps to solve problems in more effective ways."
        ],
        "links": [
            "https://www.geeksforgeeks.org/how-to-improve-problem-solving-skills/",
            "https://www.tutorialspoint.com/data_structures_algorithms/algorithm_design_techniques.htm",
            "https://www.javatpoint.com/problem-solving-techniques"
        ],
        "yt_links": [
            {
                "title": "5 Step Formula to Solve Any Problem | Brian Tracy",
                "video_url": "https://www.youtube.com/watch?v=CdVCNjX6pc0"
            },
            {
                "title": "15 Strategies to Improve Your Problem Solving Skills",
                "video_url": "https://www.youtube.com/watch?v=kRtdcBfvixE"
            },
            {
                "title": "Every Problem-Solving Strategy Explained In 10 Minutes",
                "video_url": "https://www.youtube.com/watch?v=yhc-EPLcIaI"
            },
            {
                "title": "4 Steps in Solving Problems",
                "video_url": "https://www.youtube.com/watch?v=kn8frIzQupA"
            },
            {
                "title": "Problem Solving - Steps, Strategies, Implementation, Algorithm, Heuristics, Trail &amp; Error, Insight",
                "video_url": "https://www.youtube.com/watch?v=iwdNNJGlU1c"
            }
        ]
    }
]
''';


List<dynamic> responseData1=jsonDecode(response1);
List<Chapter> chapters1 = responseData1.map((json) => Chapter.fromJson(json)).toList();


Courses course1=Courses(courseId: "001", courseName: "DSA for Software Interviews (Beginner Level)", courseImg: "https://miro.medium.com/v2/resize:fit:1400/format:webp/0*Rhu1FRkUGZFAeGIy", content: chapters1);



String response2=''' [
    {
        "topic_name": "Introduction to Product Management",
        "paragraphs": [
            "Product Management is like being the captain of a ship. You're not building the ship, but you're deciding where it should go, who it's for, and how it should work. It's about understanding what people need and guiding a team to create a product that meets those needs. It involves identifying a problem, figuring out the best solution, and making sure it gets built and launched successfully. This means you are the advocate for the customer, the business and the technology.",
            "In the real world, product managers work closely with engineers, designers, and marketers. They are the glue between these teams, making sure everyone is on the same page. For example, if a company wants to create a new app, the product manager would be responsible for figuring out what the app should do, who will use it, and how it will stand out from other apps. They would decide on the features, pricing, and marketing plan. If you are working on a social media platform, you might be defining the features of a new 'Groups' feature or if it is an e-commerce platform, you might be defining a feature like 'wishlist'.",
            "Understanding product management basics is very helpful as it allows you to think about problems from the user's perspective, brainstorm innovative solutions, and communicate effectively with technical teams. This skill set also comes handy when you have to understand the market and create products accordingly. It is a mix of understanding the market, the users and the product, and then translating that into business value."
        ],
        "links": [
            "https://www.productplan.com/glossary/product-management/",
            "https://www.aha.io/roadmapping/guide/product-management/what-is-product-management"
        ],
        "yt_links": [
            {
                "title": "What Is Product Management? | Introduction to Product Management | Product Management | Simplilearn",
                "video_url": "https://www.youtube.com/watch?v=XD45n_agC3g"
            },
            {
                "title": "Introduction to Product Management | What is Product Management ? | Great Learning",
                "video_url": "https://www.youtube.com/watch?v=ravLfnYuqmA"
            },
            {
                "title": "What is product management? - Agile Coach",
                "video_url": "https://www.youtube.com/watch?v=kzMBIyzq9Ag"
            },
            {
                "title": "An Introduction to Product Management",
                "video_url": "https://www.youtube.com/watch?v=N5ymzOgxfrc"
            },
            {
                "title": "Product Management: An Overview - Key Responsibilities",
                "video_url": "https://www.youtube.com/watch?v=88ZfjnDOmp4"
            }
        ]
    },
    {
        "topic_name": "Understanding the Product Development Life Cycle",
        "paragraphs": [
            "The Product Development Life Cycle (PDLC) is like a recipe for making a product. It's a series of steps that a product goes through from when it's just an idea to when it's being used by people. It generally includes steps like Idea Generation, planning, designing, building, testing and launching a product.",
            "Let's consider a mobile app again. First, the team comes up with an idea (Idea Generation). Then they plan what the app will do and how it will work(Planning). Next, they make the app visually appealing and easy to use (Design). They code the app and make sure it works smoothly (Build). Before letting everyone use the app, they test it to find any issues (Testing). Finally, the app is released to everyone (Launch) and finally the performance is analyzed, enhancements are made, and so on(Iteration).",
            "Understanding the PDLC is important because it helps teams stay organized and make sure every step of product development is covered. It helps to track progress, solve problems early, and make sure the final product meets people's needs. Knowing the PDLC makes sure that the team is able to identify errors early, keep track of the budget and make sure that the final product is a success. When working in companies, the PDLC might vary slightly depending on the organization. "
        ],
        "links": [
            "https://www.productplan.com/glossary/product-development-process/",
            "https://airfocus.com/blog/product-development-process/"
        ],
        "yt_links": [
            {
                "title": "What is Product development? | New Product development",
                "video_url": "https://www.youtube.com/watch?v=oE6VD23Kr0I"
            },
            {
                "title": "What is the Product Development Lifecycle? Ideation to launch 💡 ➡️ 🚀 | DOWNLOADABLE guide",
                "video_url": "https://www.youtube.com/watch?v=kPqzHSMPSDU"
            },
            {
                "title": "Product Life Cycle, Product life cycle in hindi, Product Life Cycle in marketing management,  PLC,",
                "video_url": "https://www.youtube.com/watch?v=eijE5H2VatM"
            },
            {
                "title": "7 STAGES OF PRODUCT DEVELOPMENT PROCESS",
                "video_url": "https://www.youtube.com/watch?v=k9qOo09KG_I"
            },
            {
                "title": "new product development process | Marketing Management | New Product Policy |new product development",
                "video_url": "https://www.youtube.com/watch?v=GL2UxjDlUb0"
            }
        ]
    },
    {
        "topic_name": "Market Research and Analysis Fundamentals",
        "paragraphs": [
            "Market research is like being a detective, trying to understand a market and what users want. It involves collecting and analyzing information about your industry, customers, and competitors to see what products or services could be successful. The two main kinds of market research include Primary research and secondary research. Primary research is data you collect yourself, like doing surveys or interviews. Secondary research is data that already exists, such as reports and studies done by other organizations.",
            "For instance, if a company wants to open a new coffee shop, market research would involve finding out things like: Who are the customers in the area? What kind of coffee do they like? How much are they willing to pay? Which coffee shops are already there and what are they doing differently? Based on such information, the best decision can be made. Companies often use surveys, focus groups, and online analytics to collect data.",
            "Understanding market research is vital for product managers to make decisions based on facts, not guesses. It helps to avoid the risk of building products that no one wants, and it guides them to find opportunities and create products that will succeed in the market. It helps to build a stronger product as it is backed by user data and also helps to understand the competitive landscape."
        ],
        "links": [
            "https://www.smartsheet.com/content/market-research-analysis",
            "https://www.geeksforgeeks.org/market-research-analysis/"
        ],
        "yt_links": [
            {
                "title": "How To Do Market Research (Market Research 101)",
                "video_url": "https://www.youtube.com/watch?v=kFM72UJhW8s"
            },
            {
                "title": "How to Do Market Research!",
                "video_url": "https://www.youtube.com/watch?v=b-hDg7699S0"
            },
            {
                "title": "Fundamental Analysis Complete Course | How to Select Best Stocks for Investment in Share Market",
                "video_url": "https://www.youtube.com/watch?v=sx8sBN2prAE"
            },
            {
                "title": "Market Research | The Secret Ingredient for Business Success",
                "video_url": "https://www.youtube.com/watch?v=CqaFYgRGDmo"
            },
            {
                "title": "Fundamental Analysis to Find Intrinsic Value of a Stock",
                "video_url": "https://www.youtube.com/watch?v=AqgaqBY4up4"
            }
        ]
    },
    {
        "topic_name": "User Research and Personas",
        "paragraphs": [
            "User research is all about understanding the people who will use your product, and this is done by talking to users. You collect data through interviews, surveys, or observing them. You can understand their needs, wants, and pain points, which ultimately improves the quality of the product that you will be building.",
            "A 'persona' is like a character profile of your ideal customer. It's a fictional representation of a user, created using the data collected from user research. For example, if you are designing a social media app, one persona might be 'Sarah, a 22-year-old college student' who uses the app to connect with friends and explore new content. Another persona can be 'John, a 45 year old entrepreneur' who uses the same app for professional networking and expanding his business.",
            "User research and personas are super important because they put the user at the center of the product development process. Instead of building something that you *think* users want, you build something that you *know* they want. It helps to identify gaps in the market or even improve upon existing products. It also guides the team to make sure the user's needs are met and also helps with marketing as you know who you are targeting."
        ],
        "links": [
            "https://www.usability.gov/what-and-why/user-research.html",
            "https://careerfoundry.com/en/blog/ux-design/how-to-create-user-personas/"
        ],
        "yt_links": [
            {
                "title": "How To Create A User Persona (Video Guide)",
                "video_url": "https://www.youtube.com/watch?v=DvV7ZcRVQ4g"
            },
            {
                "title": "Creating Personas for User Experience Research",
                "video_url": "https://www.youtube.com/watch?v=u44pBnAn7cM"
            },
            {
                "title": "Why Do You Need a User Persona in Your User Research?",
                "video_url": "https://www.youtube.com/watch?v=gjiXCffHMgA"
            },
            {
                "title": "What is UX Research? | Google UX Design Certificate",
                "video_url": "https://www.youtube.com/watch?v=kQ_6faxhyIw"
            },
            {
                "title": "User Persona for UX - اردو / हिंदी [Eng Sub]",
                "video_url": "https://www.youtube.com/watch?v=UnAuwhu2C9Q"
            }
        ]
    },
    {
        "topic_name": "Product Ideation and Brainstorming Techniques",
        "paragraphs": [
            "Product Ideation is the process of coming up with new ideas for products or features. This involves creative thinking to find solutions to user problems or market needs. A great way to do this is by Brainstorming, which is when a group of people get together to share ideas. There are different techniques for brainstorming, such as Mind Mapping where you start with a central idea and branch out into related topics, or SCAMPER where you ask a set of questions to help you come up with ideas.",
            "Let's imagine you're working on an app for students. A good idea would be a study group finder feature. A feature which would allow users to connect with others studying for the same subject or exam. This can be achieved by brainstorming through mind maps or using the SCAMPER approach.",
            "Product Ideation and brainstorming are important to come up with new ideas and innovate. They help teams think outside the box and come up with creative solutions that are useful to the market, this can also help discover areas of opportunity."
        ],
        "links": [
            "https://www.interaction-design.org/literature/article/ideation-how-to-brainstorm-the-best-ideas",
            "https://www.mindtools.com/au7l03b/brainstorming"
        ],
        "yt_links": [
            {
                "title": "Brainstorming Techniques: How to Innovate in Groups",
                "video_url": "https://www.youtube.com/watch?v=YXZamW4-Ysk"
            },
            {
                "title": "Group Brainstorming Techniques [Types of Brainstorming that Work]",
                "video_url": "https://www.youtube.com/watch?v=FkvCBUvH6Zc"
            },
            {
                "title": "How I Run Brainstorming Sessions (UX Framework)",
                "video_url": "https://www.youtube.com/watch?v=9mOIgNml-eg"
            },
            {
                "title": "Ideation Techniques for a One-Person UX Team",
                "video_url": "https://www.youtube.com/watch?v=xh87YChFkEo"
            },
            {
                "title": "IDEO: Brainstorming and Other Ideation Techniques",
                "video_url": "https://www.youtube.com/watch?v=xXsHI_VlhmY"
            }
        ]
    },
    {
        "topic_name": "Prioritization Frameworks (e.g., MoSCoW, RICE)",
        "paragraphs": [
            "Prioritization frameworks are like tools that help product managers decide which ideas and features to work on first. It helps to organize the ideas and helps in choosing what will bring the most value and which ideas should be focused on first. Two popular frameworks are MoSCoW and RICE.",
            "MoSCoW stands for Must have, Should have, Could have, and Won't have. This framework helps categorize features based on how critical they are. 'Must haves' are essential for the product to function, 'Should haves' are important but not critical, 'Could haves' are nice to have and 'Won't haves' are those that are not necessary for now.",
            "RICE stands for Reach, Impact, Confidence, and Effort. This helps in prioritizing features by giving each a score based on these factors. Reach is how many people will be impacted, Impact is how much the feature will help, Confidence is how sure you are, and Effort is how much work it will take.",
            "Using frameworks like MoSCoW and RICE helps product managers make informed decisions. They make it clear which features should be prioritized and ensure the product is built in an efficient way. It helps teams to stay focused on the most important items, rather than doing everything at once."
        ],
        "links": [
            "https://www.productplan.com/glossary/moscow-prioritization/",
            "https://www.productplan.com/glossary/rice-scoring-model/"
        ],
        "yt_links": [
            {
                "title": "What is the RICE Scoring Model?",
                "video_url": "https://www.youtube.com/watch?v=pzyRafZJ-0M"
            },
            {
                "title": "RICE prioritization framework | Product Management",
                "video_url": "https://www.youtube.com/watch?v=0jWRryfQ1Qk"
            },
            {
                "title": "The RICE Scoring Framework - Overview, Example, and Explanation",
                "video_url": "https://www.youtube.com/watch?v=miI6KvwFHLI"
            },
            {
                "title": "The RICE Scoring Framework: An Overview",
                "video_url": "https://www.youtube.com/watch?v=XGI7ztUqmng"
            },
            {
                "title": "Rice Prioritization Framework: Explanation with Examples",
                "video_url": "https://www.youtube.com/watch?v=NLdzE2Qw37A"
            }
        ]
    },
    {
        "topic_name": "Creating a Product Roadmap",
        "paragraphs": [
            "A product roadmap is a high-level plan that outlines the direction of a product. It's like a map that shows where you are, where you want to go, and the path you will take to get there. It is generally a visual representation of the product's goals over time. It usually includes key product milestones and time frames.",
            "For example, the roadmap for an app might include the following: Phase 1, which could be the initial launch with core features, Phase 2 which might include a new feature, like messaging or payment options and Phase 3 might include the international expansion of the app. The roadmap is a constantly evolving document that is reviewed and updated based on how the product is performing, and how the market is changing.",
            "A product roadmap is vital because it helps product managers communicate the overall plan to the stakeholders. It is also very helpful for teams to have a common understanding of the product goals, this makes sure that everyone is working towards the same goals and keeps the product development process aligned with business goals. It also helps prioritize tasks based on the roadmap."
        ],
        "links": [
            "https://www.productplan.com/learn/product-roadmaps/",
            "https://www.atlassian.com/agile/product-management/roadmaps"
        ],
        "yt_links": [
            {
                "title": "How to Build a Product Roadmap in 6½ Simple Steps",
                "video_url": "https://www.youtube.com/watch?v=b4YVHTqQPk8"
            },
            {
                "title": "How To Build A Product Roadmap",
                "video_url": "https://www.youtube.com/watch?v=cZEV9CLUd2Q"
            },
            {
                "title": "What Is A Product Roadmap? | How To Build A Product Roadmap? | Product Roadmap 2024| Simplilearn",
                "video_url": "https://www.youtube.com/watch?v=eABA3djZrmI"
            },
            {
                "title": "What is a Product Roadmap? | Examples and Overview",
                "video_url": "https://www.youtube.com/watch?v=KPwRprJNt8E"
            },
            {
                "title": "CREATE A 2021 PRODUCT ROADMAP | Free downloadable template",
                "video_url": "https://www.youtube.com/watch?v=AzeoB7AdDxQ"
            }
        ]
    },
    {
        "topic_name": "Writing User Stories and Defining Requirements",
        "paragraphs": [
            "User stories are short descriptions of a feature from the user's point of view. They're written in a simple way to show what the user wants and why. A typical user story format is: 'As a [user], I want [goal] so that [benefit].' This simple format captures the who, what, and why of a feature.",
            "For example, a user story for an online bookstore app can be: 'As a reader, I want to be able to search for books by author so that I can easily find what I want.' The user story also helps with defining the requirements which are much more detailed than user stories. Requirements are all the details the development team needs to implement a particular user story. For the above example, it can include things like search functionality, UI elements, how search is handled in the backend, etc.",
            "User stories are important because they make sure the product focuses on the user's needs. They help make sure that the development team understands what needs to be done. The user stories are a very good bridge between user needs and the technical details and requirements. They also facilitate conversations and discussions between different teams."
        ],
        "links": [
            "https://www.atlassian.com/agile/project-management/user-stories",
            "https://www.mountaingoatsoftware.com/agile/user-stories"
        ],
        "yt_links": [
            {
                "title": "Requirement Specification vs User Stories",
                "video_url": "https://www.youtube.com/watch?v=KP0U3I-f9-Y"
            },
            {
                "title": "Writing User Stories | Understand EPICS | Acceptance Criteria | Definition of Ready (DoR)",
                "video_url": "https://www.youtube.com/watch?v=ETkpWhlc5pU"
            },
            {
                "title": "How to Define User Story ?",
                "video_url": "https://www.youtube.com/watch?v=Mte3bgcntW0"
            },
            {
                "title": "The Troubles of Writing User Requirements",
                "video_url": "https://www.youtube.com/watch?v=i6r8NSNZPN8"
            },
            {
                "title": "FluxPrompt AI Flows for Product Managers - Defining Requirements and Writing User Stories",
                "video_url": "https://www.youtube.com/watch?v=-2UpOan6WFQ"
            }
        ]
    },
    {
        "topic_name": "Basics of Agile and Scrum",
        "paragraphs": [
            "Agile is a way of working that is flexible and allows for changes to be made quickly. It's about collaborating and responding to feedback to constantly improve the product. It is more focused on doing things quickly and in small iterations and incorporates continuous feedback in the product development process. It focuses on collaboration, transparency, and iterative development.",
            "Scrum is a specific Agile framework that uses short development cycles called sprints. In a scrum team, there are typically 3 roles : The product owner who defines the product vision, the development team which builds the product, and the scrum master who ensures everything goes smoothly and removes any bottlenecks. A scrum team generally has short daily meetings called daily scrums, to discuss progress and address issues.",
            "Agile and scrum are very helpful for product development because they allow teams to be flexible and adapt to changes. This is helpful because in the real world the needs of the user might evolve as you develop the product. Agile encourages teams to deliver in shorter cycles so the product gets out to the user quicker and you can gather feedback sooner. They also provide a structure to make sure the team stays on track."
        ],
        "links": [
            "https://www.atlassian.com/agile",
            "https://www.scrum.org/resources/what-is-scrum"
        ],
        "yt_links": [
            {
                "title": "What Is Agile Methodology? | Introduction to Agile Methodology in Six Minutes | Simplilearn",
                "video_url": "https://www.youtube.com/watch?v=8eVXTyIZ1Hs"
            },
            {
                "title": "What is Scrum? | Scrum under 3 minutes",
                "video_url": "https://www.youtube.com/watch?v=iJ_sl6J8PRg"
            },
            {
                "title": "What is Scrum? | Agile",
                "video_url": "https://www.youtube.com/watch?v=oTZd2vo3FQU"
            },
            {
                "title": "Scrum Essentials in Under 10 Minutes",
                "video_url": "https://www.youtube.com/watch?v=RtQ3tpq-RuE"
            },
            {
                "title": "What&#39;s the difference between Agile and Scrum?",
                "video_url": "https://www.youtube.com/watch?v=tKFs2xQRRIE"
            }
        ]
    },
    {
        "topic_name": "Product Metrics and KPIs",
        "paragraphs": [
            "Product metrics are the measurements of how a product is performing. They give you an idea about the user engagement, how many people are using it, how often, and if they are finding value from it. They include quantitative data such as user count, page views or qualitative data like user satisfaction.",
            "Key Performance Indicators (KPIs) are a set of the most important metrics used to track the success of the product. They need to be specific, measurable, achievable, relevant, and time-bound. For a social media app, some important KPIs might include daily active users, time spent on the app, or number of new users.",
            "Product metrics and KPIs are important because they show you if the product is succeeding and if the users are finding value in it. Based on these metrics, the product manager can make decisions about what needs to be improved and what's working well. They help understand product engagement, user experience, and ultimately help guide product development. Metrics help validate if all the work that has been put in the product is yielding results."
        ],
        "links": [
            "https://www.productplan.com/glossary/product-metrics/",
            "https://www.aha.io/roadmapping/guide/product-metrics/what-are-product-metrics"
        ],
        "yt_links": [
            {
                "title": "Product Manager KPIs And Metrics | Introduction To KPI | Product Management Tutorial |Simplilearn",
                "video_url": "https://www.youtube.com/watch?v=iN_jeOAzoso"
            },
            {
                "title": "PM School - Defining Success Metrics for a product | Solving Metrics Questions in PM interviews",
                "video_url": "https://www.youtube.com/watch?v=WBG0Ggmhu2M"
            },
            {
                "title": "The difference between Metrics, KPIs &amp; Key Results",
                "video_url": "https://www.youtube.com/watch?v=lLKyuUqtwuA"
            },
            {
                "title": "Analytics for Product Managers Masterclass | Metrics - KPIs - Events - Mixpanel | HelloPM",
                "video_url": "https://www.youtube.com/watch?v=N-Igkw7__z0"
            },
            {
                "title": "Product Metrics: How to measure product success",
                "video_url": "https://www.youtube.com/watch?v=wtDFgx41Rho"
            }
        ]
    }
]''';

List<dynamic> responseData2=jsonDecode(response2);
List<Chapter> chapters2 = responseData2.map((json) => Chapter.fromJson(json)).toList();

Courses course2=Courses(courseId: "002", courseImg: "https://m.media-amazon.com/images/I/61ENCK31WdL._AC_UF1000,1000_QL80_.jpg", courseName: "Product Management Essentials for Placements", content:chapters2);



String response3='''[
    {
        "topic_name": "Introduction to Consulting and Analyst Roles",
        "paragraphs": [
            "Consulting is a field where professionals provide expert advice to organizations to help them solve problems or improve their performance. As an analyst in a consulting firm, you'll play a crucial role in gathering data, performing analyses, and drawing insights that drive strategic decisions. This involves understanding business problems, using data to uncover the root causes, and recommending actionable solutions.",
            "Analysts are involved in various stages of consulting projects. They often start with data collection and cleaning, which involves gathering data from different sources and ensuring its quality. They then perform data analysis using tools like SQL, PowerBI, and Python to identify patterns and trends. Finally, analysts work with consultants to communicate their findings and recommendations to clients. A strong understanding of analytical tools will allow you to solve client issues using data and will ultimately lead to you becoming an effective consultant",
            "Understanding consulting and analyst roles will help you gain a better understanding of the type of projects that you will work on in the consulting field. You will be able to apply the other tools to real business problems after learning this initial topic. It's important to have a basic understanding of these concepts to succeed in your future role as an analyst."
        ],
        "links": [
            "https://www.investopedia.com/terms/m/managementconsulting.asp",
            "https://www.mckinsey.com/careers/life-at-mckinsey/a-day-in-the-life"
        ],
        "yt_links": [
            {
                "title": "Business Analyst ROADMAP 2024 | ZERO Coding | Skills | Interview | Hrithik Mehlawat | BAT 01 | India",
                "video_url": "https://www.youtube.com/watch?v=XGxx6WFGZYk"
            },
            {
                "title": "From Student to Business Analyst: Your Step-by-Step Guide to Join Consulting Companies",
                "video_url": "https://www.youtube.com/watch?v=pnnYbjPCZ1c"
            },
            {
                "title": "Top 3 skills required to be a Business Analyst",
                "video_url": "https://www.youtube.com/watch?v=5dGoit6D1Lo"
            },
            {
                "title": "How much does a LEAD ANALYST make?",
                "video_url": "https://www.youtube.com/watch?v=gRByc8vW2Nw"
            },
            {
                "title": "What even is Management Consulting and what do I actually do",
                "video_url": "https://www.youtube.com/watch?v=4avS00vBDI8"
            }
        ]
    },
    {
        "topic_name": "Overview of Data Analysis Tools",
        "paragraphs": [
            "Data analysis tools are software applications used to process, analyze, and visualize data to gain meaningful insights.  SQL is primarily used for data manipulation and retrieval from relational databases. It's the language of data and allows analysts to query and extract specific data needed for analysis.",
            "PowerBI is a business intelligence tool that focuses on data visualization and reporting. It helps create interactive dashboards and reports to present data insights in a way that is easy to understand. Python, a powerful programming language, offers a multitude of libraries that enable all sorts of data analysis tasks from cleaning to statistical modeling. ",
            "Understanding all these tools is important because you will need to use them in your role to answer questions and provide valuable insights to your stakeholders. Each has its purpose and using all of them together will lead to better analysis.  You will need to master all of these topics in order to succeed as an analyst and this topic introduces you to each of them."
        ],
        "links": [
            "https://www.simplilearn.com/tutorials/data-science-tutorial/data-analysis-tools",
            "https://www.guru99.com/data-analysis-tools.html"
        ],
        "yt_links": [
            {
                "title": "Data Analytics - The 9 Essential Tools! (2024)",
                "video_url": "https://www.youtube.com/watch?v=jgXp1EE4Wms"
            },
            {
                "title": "What Is Data Analytics? - An Introduction (Full Guide)",
                "video_url": "https://www.youtube.com/watch?v=yZvFH7B6gKI"
            },
            {
                "title": "I started my data analyst career taking these beginner courses",
                "video_url": "https://www.youtube.com/watch?v=SfE3aO3LWi0"
            },
            {
                "title": "A Beginners Guide To The Data Analysis Process",
                "video_url": "https://www.youtube.com/watch?v=lgCNTuLBMK4"
            },
            {
                "title": "What is Data Analytics | Data Analytics in 5 Minutes | Intellipaat",
                "video_url": "https://www.youtube.com/watch?v=37x5dKW-X5U"
            }
        ]
    },
    {
        "topic_name": "Introduction to Relational Databases and SQL",
        "paragraphs": [
            "Relational databases organize data into tables with rows and columns, where relationships are established between tables. This structure helps manage data efficiently, and it is one of the most popular database architectures in the world. SQL, which stands for Structured Query Language, is the standard language for interacting with these types of databases.",
            "When you learn SQL, you will be able to interact with databases and retrieve the data you need. Without SQL, data in a database would be very hard to get out. SQL allows you to easily extract specific information from tables and is integral to being able to query and analyze data. This topic is crucial for any analyst as it is the foundation of most analytical workflows.",
            "You will learn the basics of relational databases in this chapter, such as tables, keys, and relationships. This fundamental knowledge is required to be able to query the databases that you will encounter as an analyst."
        ],
        "links": [
            "https://www.geeksforgeeks.org/introduction-to-relational-database/",
            "https://www.w3schools.com/sql/sql_intro.asp"
        ],
        "yt_links": [
            {
                "title": "Introduction to Relational Databases",
                "video_url": "https://www.youtube.com/watch?v=WI9dE8-TFAc"
            },
            {
                "title": "What is a Relational Database?",
                "video_url": "https://www.youtube.com/watch?v=OqjJjpjDRLc"
            },
            {
                "title": "SQL Explained in 100 Seconds",
                "video_url": "https://www.youtube.com/watch?v=zsjvFFKOm3c"
            },
            {
                "title": "Introduction to Relational Data Model",
                "video_url": "https://www.youtube.com/watch?v=Q45sr5p_NmQ"
            },
            {
                "title": "Lec-44: Introduction to Relational Algebra | Database Management System",
                "video_url": "https://www.youtube.com/watch?v=4YilEjkNPrQ"
            }
        ]
    },
    {
        "topic_name": "Basic SQL Queries: SELECT, FROM, WHERE",
        "paragraphs": [
            "The `SELECT` statement is used to choose the columns you want to see. It's how you specify what data you need from the database. The `FROM` statement specifies which table you will be getting data from.",
            "The `WHERE` clause filters the data based on certain conditions.  It's how you narrow down the data to show only the rows that meet your criteria. When you put the three clauses together you can extract very specific data out of your tables, which is necessary for data analysis. ",
            "Together these statements allow you to perform basic SQL operations like selecting specific columns from specific tables and applying filters to the rows to extract relevant data. Mastering these core statements is essential for any SQL user, and it is the foundation of any SQL knowledge that an analyst will have."
        ],
        "links": [
            "https://www.w3schools.com/sql/sql_select.asp",
            "https://www.geeksforgeeks.org/sql-select-clause/"
        ],
        "yt_links": [
            {
                "title": "5 Basic SELECT Statement Queries in SQL",
                "video_url": "https://www.youtube.com/watch?v=5tEApCGgpEQ"
            },
            {
                "title": "SELECT Statement &amp; WHERE Clause with Example | Operators in SQL | SQL Tutorial in Hindi 5",
                "video_url": "https://www.youtube.com/watch?v=eiLqDeDp7Oc"
            },
            {
                "title": "How to Write Basic SQL Statements (SELECT, FROM)",
                "video_url": "https://www.youtube.com/watch?v=YfTDBA45PHk"
            },
            {
                "title": "SELECT query in SQL - Retrieval of records from a table",
                "video_url": "https://www.youtube.com/watch?v=NoA_HFWxy0s"
            },
            {
                "title": "Learn Basic SQL in 15 Minutes | Business Intelligence For Beginners | SQL Tutorial For Beginners 1/3",
                "video_url": "https://www.youtube.com/watch?v=kbKty5ZVKMY"
            }
        ]
    },
    {
        "topic_name": "Filtering and Sorting Data",
        "paragraphs": [
            "Filtering data using the `WHERE` clause allows you to extract only those rows that meet specific conditions. Common operators like `=`, `>`, `<`, `!=`, `LIKE`, `IN`, `BETWEEN`, `AND` and `OR` help create filters.  Using these operators, you can set a variety of constraints on the data you want to extract.  ",
            "Sorting data using the `ORDER BY` clause helps organize the results in ascending or descending order based on a specific column. This can allow you to sort data by any variable you want and is often useful when presenting results to non-technical users.  When combined with filters you are able to extract relevant and understandable data from your database.",
            "Learning how to filter and sort data is a core skill that all analysts should possess. These capabilities allow you to perform preliminary steps in data cleaning, data exploration, and data preparation for the rest of your analyses."
        ],
        "links": [
            "https://www.w3schools.com/sql/sql_where.asp",
            "https://www.geeksforgeeks.org/sql-order-by-clause/"
        ],
        "yt_links": [
            {
                "title": "Data Sorting &amp; Filtering in Excel (Basic + Advanced) | FREE Excel Course",
                "video_url": "https://www.youtube.com/watch?v=yzH01AawU-4"
            },
            {
                "title": "Excel Sorting and Filtering Data",
                "video_url": "https://www.youtube.com/watch?v=O28-xL5YGkE"
            },
            {
                "title": "Sort &amp; Filter [EXCEL] || Express Large data in Small View || Excel Series in Hindi",
                "video_url": "https://www.youtube.com/watch?v=NDWMwGOFRso"
            },
            {
                "title": "How to apply FILTER function in Excel? | Sort data easily with Filter Function #shorts #excel",
                "video_url": "https://www.youtube.com/watch?v=OniRlaFGr8Y"
            },
            {
                "title": "Sort &amp; filter data in Google Sheets",
                "video_url": "https://www.youtube.com/watch?v=VcRBHXBMKBU"
            }
        ]
    },
    {
        "topic_name": "SQL Aggregate Functions and Grouping",
        "paragraphs": [
            "Aggregate functions perform calculations on a set of values and return a single result. Examples of these functions include `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`. These allow you to compute descriptive statistics for your data.",
            "The `GROUP BY` clause is used to group rows that have the same values in a specified column. This is often used with aggregate functions to calculate summary statistics for each group. For example, you can use a `GROUP BY` clause with a `COUNT` aggregate function to count the number of occurrences of unique values in a column.",
            "Learning how to group and aggregate data is important for summarizing and extracting insights from large datasets. You can get summary statistics of your datasets at different group levels using these functions which are required for any data analysis. This topic forms the basis of many data analysis workflows."
        ],
        "links": [
            "https://www.w3schools.com/sql/sql_groupby.asp",
            "https://www.geeksforgeeks.org/sql-aggregate-functions/"
        ],
        "yt_links": [
            {
                "title": "Advanced Aggregate Functions in SQL (GROUP BY, HAVING vs. WHERE)",
                "video_url": "https://www.youtube.com/watch?v=nNrgRVIzeHg"
            },
            {
                "title": "Lec-67: SQL Aggregate Functions - SUM, AVG(n), COUNT, MIN, MAX Functions | DBMS",
                "video_url": "https://www.youtube.com/watch?v=Yr4pHPZCshA"
            },
            {
                "title": "Aggregate Functions, Group by Clause and Having Keyword in SQL ? | SQL Server Interview Questions",
                "video_url": "https://www.youtube.com/watch?v=K2mFsfhLckw"
            },
            {
                "title": "Lec-61: SQL Queries and Subqueries (part-3) | Group By clause  | Database Management System",
                "video_url": "https://www.youtube.com/watch?v=apNmMWgFFRg"
            },
            {
                "title": "Basic Aggregate Functions in SQL (COUNT, SUM, AVG, MAX, and MIN)",
                "video_url": "https://www.youtube.com/watch?v=jcoJuc5e3RE"
            }
        ]
    },
    {
        "topic_name": "Joining Tables in SQL",
        "paragraphs": [
            "Joining tables is a fundamental operation in SQL that allows you to combine rows from two or more tables based on a related column between them.  There are different types of joins like INNER JOIN, LEFT JOIN, RIGHT JOIN and FULL OUTER JOIN each with different use cases.",
            " An inner join will only return the rows that have matching values in both tables, while a left join will return all rows from the left table and matching rows from the right table, a right join will return all rows from the right table and matching rows from the left table, and a full outer join will return all rows from both tables. These joins are required to be able to use multiple tables at the same time.",
            "Learning how to join tables enables you to get information from multiple sources into one combined data set and is required to perform more complex analysis. This is required because in the real world, data that you require will often be split into multiple different tables."
        ],
        "links": [
            "https://www.w3schools.com/sql/sql_join.asp",
            "https://www.geeksforgeeks.org/sql-join/"
        ],
        "yt_links": [
            {
                "title": "HOW TO JOIN 3 OR MORE TABLES IN SQL | TWO WAYS",
                "video_url": "https://www.youtube.com/watch?v=wdz4MRlzOyE"
            },
            {
                "title": "MySQL: JOINS are easy (INNER, LEFT, RIGHT)",
                "video_url": "https://www.youtube.com/watch?v=G3lJAxg1cy8"
            },
            {
                "title": "How to Join two or more than two Tables using multiple columns | How to Join Multiple Tables #Joins",
                "video_url": "https://www.youtube.com/watch?v=5OpBjU-OWh8"
            },
            {
                "title": "6 SQL Joins you MUST know! (Animated + Practice)",
                "video_url": "https://www.youtube.com/watch?v=Yh4CrPHVBdE"
            },
            {
                "title": "Joins in MySQL | Intermediate MySQL",
                "video_url": "https://www.youtube.com/watch?v=lXQzD09BOH0"
            }
        ]
    },
    {
        "topic_name": "Introduction to PowerBI",
        "paragraphs": [
            "PowerBI is a business intelligence and data visualization tool that allows you to connect to various data sources, create interactive reports, and share your findings. It is a popular tool because of the ease of use and a large number of visualizations.",
            "In PowerBI you can import data from various sources like Excel, SQL databases, and cloud services.  After importing your data you can create visualizations such as charts, tables, and maps using the drag and drop interface.  You can also create interactive dashboards that allow users to explore the data.",
            "Learning PowerBI is essential for analysts to create visually appealing reports and present data insights to stakeholders who are non technical. This topic will introduce you to the core concepts in PowerBI that you will need to master in order to use the tool efficiently."
        ],
        "links": [
            "https://powerbi.microsoft.com/en-us/what-is-power-bi/",
            "https://www.simplilearn.com/tutorials/power-bi-tutorial/what-is-power-bi"
        ],
        "yt_links": [
            {
                "title": "1.1 Power BI Tutorial for Beginners (Introduction to Power BI )",
                "video_url": "https://www.youtube.com/watch?v=H84UJn1CiWo"
            },
            {
                "title": "What Is Power BI? | Introduction To Power BI | Power BI Tutorial For Beginners | Simplilearn",
                "video_url": "https://www.youtube.com/watch?v=-_DJPRrFQXI"
            },
            {
                "title": "What is PowerBI and why use it?",
                "video_url": "https://www.youtube.com/watch?v=z_F-j3PVRA8"
            },
            {
                "title": "Power BI Tutorial for Beginners",
                "video_url": "https://www.youtube.com/watch?v=NNSHu0rkew8"
            },
            {
                "title": "What is Power BI?",
                "video_url": "https://www.youtube.com/watch?v=yKTSLffVGbk"
            }
        ]
    },
    {
        "topic_name": "Connecting to Data Sources in PowerBI",
        "paragraphs": [
            "Connecting to data sources in PowerBI is the first step in your data analysis process. PowerBI can connect to a wide variety of data sources, including excel files, SQL databases, CSV files, cloud based sources and many more.",
            "The connection process involves selecting the appropriate data connector, providing the necessary connection details like file path, database server, username, and password and then the data is imported into the PowerBI data model.  PowerBI will also try to infer data types automatically so that data types are converted correctly. This process is fundamental to be able to work with data in PowerBI.",
            "Understanding the various ways to connect to data will allow you to analyze diverse datasets and create dashboards with data from many different sources. Knowing these connection mechanisms are a prerequisite to learning how to analyze and visualize data."
        ],
        "links": [
            "https://learn.microsoft.com/en-us/power-bi/connect-data/power-bi-data-sources",
            "https://www.tutorialspoint.com/power_bi/power_bi_connecting_to_data_sources.htm"
        ],
        "yt_links": [
            {
                "title": "Power BI Tutorial (6/50) - How to connect various Data Sources",
                "video_url": "https://www.youtube.com/watch?v=8rOiqzmdaOc"
            },
            {
                "title": "How To Connect Data Sources In Power BI? | Power BI Tutorial For Beginners | Power BI | Simplilearn",
                "video_url": "https://www.youtube.com/watch?v=ZDuQvyZ8stM"
            },
            {
                "title": "Data Sources in power bi | types of data sources | how to connect web| Part 4",
                "video_url": "https://www.youtube.com/watch?v=2I4PAjRb2qc"
            },
            {
                "title": "Power BI Get Data: Import vs. DirectQuery vs. Live (2021)",
                "video_url": "https://www.youtube.com/watch?v=-ip7mKUdwRg"
            },
            {
                "title": "MicroNugget: How to Connect Power BI to Server Data Sources",
                "video_url": "https://www.youtube.com/watch?v=16Xg1u3GEZI"
            }
        ]
    },
    {
        "topic_name": "Creating Basic Visualizations",
        "paragraphs": [
            "PowerBI offers a wide range of visualizations like bar charts, line charts, pie charts, scatter plots, tables, maps, and many more.  Choosing the appropriate visualization depends on the type of data you have and the insights you want to communicate.",
            "Creating visualizations is done by dragging and dropping the fields into the canvas in the visualization pane and then configuring the chart to your liking.  You can select the field for the axes, color, tool tips, etc and there are a variety of options for customization.  It is also possible to add titles, labels and legends to the visualization to improve clarity and readability.",
            "Learning how to create visualizations is crucial for being able to display your analysis and insights to non-technical stakeholders. A good visualization can communicate important data insights and convey key findings and learning how to create them is important for every analyst."
        ],
        "links": [
            "https://learn.microsoft.com/en-us/power-bi/visuals/power-bi-report-add-visualizations",
            "https://www.tutorialspoint.com/power_bi/power_bi_creating_visualizations.htm"
        ],
        "yt_links": [
            {
                "title": "How to Create Visualizations in Tableau | Tableau Tutorials for Beginners",
                "video_url": "https://www.youtube.com/watch?v=ebjDwX8sUMk"
            },
            {
                "title": "How to Install Tableau and Create First Visualization | Tableau Tutorials for Beginners",
                "video_url": "https://www.youtube.com/watch?v=6xv1KvCMF1Q"
            },
            {
                "title": "Creating your first visualization with Kibana Lens",
                "video_url": "https://www.youtube.com/watch?v=DzGwmr8nKPg"
            },
            {
                "title": "Data Visualization Tutorial For Beginners | Big Data Analytics Tutorial | Simplilearn",
                "video_url": "https://www.youtube.com/watch?v=MiiANxRHSv4"
            },
            {
                "title": "Data Visualization in 2024 | The Ultimate Guide",
                "video_url": "https://www.youtube.com/watch?v=loYuxWSsLNc"
            }
        ]
    },
    {
        "topic_name": "Working with Filters and Slicers",
        "paragraphs": [
            "Filters allow you to narrow down the data displayed in the visualization or the entire report. You can filter data based on a variety of criteria, such as specific values or date ranges.  You can create filters for one specific visualization or apply the filter to the entire page.",
            "Slicers are interactive filters that allow users to quickly select data they want to see on the report.  Slicers are placed on the report page and users can use them to filter data.  This allows the user to explore the data on their own and is a powerful tool for dashboard building.",
            "Mastering the use of filters and slicers enables you to build interactive and user friendly reports. These features enable the user to be able to drill down into the data and explore the data at different group levels and is a fundamental skill required for report development."
        ],
        "links": [
            "https://learn.microsoft.com/en-us/power-bi/visuals/power-bi-report-filters-and-highlighting",
            "https://www.tutorialspoint.com/power_bi/power_bi_using_filters_and_slicers.htm"
        ],
        "yt_links": [
            {
                "title": "Using Excel Slicers to Filter Data",
                "video_url": "https://www.youtube.com/watch?v=7K_KqD1S2M0"
            },
            {
                "title": "Filters vs Slicers in Power BI Tutorial (39/50)",
                "video_url": "https://www.youtube.com/watch?v=d2Z0qIky-Cw"
            },
            {
                "title": "Using Slicers in Excel to Filter",
                "video_url": "https://www.youtube.com/watch?v=PUhhYKaWB24"
            },
            {
                "title": "How to use Power BI Slicers | @PavanLalwani",
                "video_url": "https://www.youtube.com/watch?v=9w-lcfOB8bY"
            },
            {
                "title": "Excel Slicers - The Cool Way to Filter Data!",
                "video_url": "https://www.youtube.com/watch?v=KBCd6Gvt2uI"
            }
        ]
    },
    {
        "topic_name": "Data Modeling in PowerBI",
        "paragraphs": [
            "Data modeling is the process of defining relationships between tables in your PowerBI data model. When importing data, PowerBI tries to automatically detect relationships between tables but sometimes manual intervention is required.",
            "These relationships allow PowerBI to create visualizations based on data across different tables. This is an important function because often you will need to combine data from different sources to get the answers you are looking for. This topic introduces you to modeling the relationship between tables in your data.",
            "Learning how to model your data is essential to be able to combine your data from multiple sources.  Without proper data modeling, PowerBI reports may be inaccurate and not give the required information. This is a core skill for PowerBI development and data analysis."
        ],
        "links": [
            "https://learn.microsoft.com/en-us/power-bi/fundamentals/desktop-data-model",
            "https://www.sqlbi.com/data-modeling/"
        ],
        "yt_links": [
            {
                "title": "Master Data Modeling in Power BI - Beginner to Pro Full Course",
                "video_url": "https://www.youtube.com/watch?v=air7T8wCYkU"
            },
            {
                "title": "Data Modeling in Power BI | Power BI Tutorial | Data Modeling | #powerbi #datamodeling",
                "video_url": "https://www.youtube.com/watch?v=JQ9wX1d7dGE"
            },
            {
                "title": "Data Modeling for Power BI [Full Course] 📊",
                "video_url": "https://www.youtube.com/watch?v=MrLnibFTtbA"
            },
            {
                "title": "Data Modelling In Power BI | Types Of Data Modelling In Power BI | Power BI | Simplilearn",
                "video_url": "https://www.youtube.com/watch?v=1Z_f6jkjprM"
            },
            {
                "title": "Data Modeling in Power BI Full Tutorial for Beginners | Learn Data Modeling with Practical 2024",
                "video_url": "https://www.youtube.com/watch?v=Z5VwDDMImic"
            }
        ]
    },
    {
        "topic_name": "Introduction to Python for Data Analysis",
        "paragraphs": [
            "Python is a versatile programming language widely used for data analysis, machine learning, and general-purpose programming. Its simplicity and extensive libraries make it a powerful tool for data manipulation and analysis. Python is also easy to learn and is a very popular programming language.",
            "Python has many different libraries like pandas, numpy, scipy, sklearn, and many more that allow you to perform data manipulation and machine learning.  It also has libraries to visualize data as well.  This flexibility makes it a powerful tool for any data analyst.",
            "Learning Python is essential for analysts as it allows them to do complex analysis, machine learning, and data engineering. It is a fundamental skill that can expand your analytical capabilities."
        ],
        "links": [
            "https://www.geeksforgeeks.org/introduction-to-python/",
            "https://www.python.org/about/gettingstarted/"
        ],
        "yt_links": [
            {
                "title": "How I&#39;d Learn PYTHON For DATA ANALYSIS | If I Had To Start Over Again",
                "video_url": "https://www.youtube.com/watch?v=mut8eTdoRxU"
            },
            {
                "title": "What is Data Analysis - Complete Introduction | Python Pandas Tutorial",
                "video_url": "https://www.youtube.com/watch?v=76H-8-mi1Cc"
            },
            {
                "title": "Data Analysis with Python - Full Course for Beginners (Numpy, Pandas, Matplotlib, Seaborn)",
                "video_url": "https://www.youtube.com/watch?v=r-uOLxNrNk8"
            },
            {
                "title": "Python for Data Analytics - Full Course for Beginners",
                "video_url": "https://www.youtube.com/watch?v=wUSDVGivd-8"
            },
            {
                "title": "How I&#39;d Learn PYTHON For DATA ANALYSIS | If I Had To Start Over Again #dataanalyst #dataanalytics",
                "video_url": "https://www.youtube.com/watch?v=QOXFKi9ss8o"
            }
        ]
    },
    {
        "topic_name": "Python Basics: Data Types, Variables, Operators",
        "paragraphs": [
            "Python has various data types, including integers, floats, strings, booleans, lists, and dictionaries. Understanding data types is necessary to perform calculations and manipulations correctly. Python is dynamically typed meaning you do not need to specify what the data type of the variable is when you create it.",
            "Variables are used to store data values. It is possible to give variables any name you want, and variables will store their values for later access and processing. Variables can be updated and their values can change as the program executes.",
            "Operators in Python are symbols that perform specific operations. Common operators include arithmetic operators (+, -, *, /), comparison operators (==, !=, >, <), and logical operators (and, or, not). Understanding how to use operators is necessary to perform calculations and comparisons.",
            "Mastering these basic concepts of Python will allow you to write small programs and perform simple data manipulations. These fundamental concepts are the foundation of Python programming and all future concepts in Python build on them."
        ],
        "links": [
            "https://www.geeksforgeeks.org/python-data-types/",
            "https://www.w3schools.com/python/python_variables.asp"
        ],
        "yt_links": [
            {
                "title": "Variables and Data Types | Python Tutorial - Day #6",
                "video_url": "https://www.youtube.com/watch?v=ORCuz7s5cCY"
            },
            {
                "title": "Python:- Datatypes and Variables | Learn Coding",
                "video_url": "https://www.youtube.com/watch?v=k0ZAkmYxVTQ"
            },
            {
                "title": "Python Full Course❤️ | Variables &amp; Data Types | Lecture 1",
                "video_url": "https://www.youtube.com/watch?v=t2_Q2BRzeEE"
            },
            {
                "title": "Python data types #python  #datatypes #pythondatatypes",
                "video_url": "https://www.youtube.com/watch?v=4-xNQQIgz50"
            },
            {
                "title": "Data Types Variables And Operators In Python | Python Fundamentals | Great Learning",
                "video_url": "https://www.youtube.com/watch?v=ZJ_dtEk5GP0"
            }
        ]
    },
    {
        "topic_name": "Control Flow and Functions in Python",
        "paragraphs": [
            "Control flow statements like if-else conditions allow you to execute different blocks of code based on whether a condition is true or false. Loops, such as for and while loops, allow you to repeat a block of code multiple times. These are used to manage how your program works.",
            "Functions are blocks of organized, reusable code that perform a specific task. They allow you to break your program down into smaller and more manageable sections. Functions take in inputs called arguments and return outputs. You can also use default arguments as well.",
            "Understanding control flow and functions allows you to write well-structured, modular, and reusable code. These are critical components of being able to program in Python and allows you to write more complex scripts. This topic is crucial to Python coding."
        ],
        "links": [
            "https://www.geeksforgeeks.org/control-flow-in-python/",
            "https://www.w3schools.com/python/python_functions.asp"
        ],
        "yt_links": [
            {
                "title": "Python Conditional Statements | if, if-else &amp; elif Statements",
                "video_url": "https://www.youtube.com/watch?v=5QlCw1_N6xk"
            },
            {
                "title": "Python Crash Course #5 - Control Flow",
                "video_url": "https://www.youtube.com/watch?v=Mg6B3RsMd54"
            },
            {
                "title": "Control Flow in Python - If Elif Else Statements",
                "video_url": "https://www.youtube.com/watch?v=Zp5MuPOtsSY"
            },
            {
                "title": "If Else Conditional Statements in Python | Python Tutorial - Day #14",
                "video_url": "https://www.youtube.com/watch?v=ceiuLR2ysas"
            },
            {
                "title": "Flow Control in Python | What is Flow Control in Programming | Python Flow Control | Intellipaat",
                "video_url": "https://www.youtube.com/watch?v=n9TQZIiFiQs"
            }
        ]
    },
    {
        "topic_name": "Working with Lists and Dictionaries",
        "paragraphs": [
            "Lists are ordered collections of items which can be of any data type. They are mutable, meaning you can add, remove, or modify elements after they are created. They are very important data structures for organizing data and looping through them.",
            "Dictionaries are unordered collections of key-value pairs. Keys must be unique and are immutable, and values can be of any type.  Dictionaries are used to store mappings between data.",
            "Learning how to use lists and dictionaries is essential for storing and managing data in Python. These data structures can help you organize and access information effectively and will form the basis of data manipulation."
        ],
        "links": [
            "https://www.geeksforgeeks.org/python-list/",
            "https://www.w3schools.com/python/python_dictionaries.asp"
        ],
        "yt_links": [
            {
                "title": "Working With Lists and Dictionaries - One Shot Revision | Class 11 Informatics Practices Chapter 4",
                "video_url": "https://www.youtube.com/watch?v=ABLlbKyC1DU"
            },
            {
                "title": "WORKING WITH LISTS AND DICTIONARIES | CLASS 11 IP CHAPTER 4 CBSE  | INTRODUCTION TO LISTS IN PYTHON",
                "video_url": "https://www.youtube.com/watch?v=fCoDOci7jrg"
            },
            {
                "title": "Working with Lists and Dictionaries in App Inventor",
                "video_url": "https://www.youtube.com/watch?v=8rhw7JIB9R0"
            },
            {
                "title": "Working With List and Dictionaries - Full Chapter Explanation | Class 11 Informatics Practices Ch 4",
                "video_url": "https://www.youtube.com/watch?v=3aX5JFxQZX8"
            },
            {
                "title": "Working With List &amp; Dictionaries  - Overview | Class 11 Informatics Practices Chapter 4 (Code 065)",
                "video_url": "https://www.youtube.com/watch?v=KN9MkUH2K7U"
            }
        ]
    },
    {
        "topic_name": "Introduction to Pandas Library",
        "paragraphs": [
            "Pandas is a popular Python library specifically designed for data manipulation and analysis. It provides data structures like DataFrames and Series that make it easy to work with tabular and time-series data. It is one of the most popular data science libraries.",
            "Pandas DataFrames are similar to tables in SQL databases or spreadsheets and have rows and columns.  Pandas offers a multitude of functions to clean, filter, sort, and transform your data. Learning pandas is a must for a data analyst.",
            "Learning Pandas is a must for any analyst using Python.  Data manipulation and exploration are core skills for analysts and pandas gives the tools necessary to perform these. Without pandas, it would be very difficult to do data analysis."
        ],
        "links": [
            "https://pandas.pydata.org/docs/",
            "https://www.geeksforgeeks.org/introduction-to-pandas-in-python/"
        ],
        "yt_links": [
            {
                "title": "INTRODUCTION TO PANDAS (SERIES,DATAFRAME,PANEL) - PYTHON PROGRAMMING",
                "video_url": "https://www.youtube.com/watch?v=fAxjxoNqU9o"
            },
            {
                "title": "LEARN PANDAS in about 10 minutes! A great python module for Data Science!",
                "video_url": "https://www.youtube.com/watch?v=iGFdh6_FePU"
            },
            {
                "title": "Python Pandas Tutorial in Hindi",
                "video_url": "https://www.youtube.com/watch?v=RhEjmHeDNoA"
            },
            {
                "title": "Introduction To Pandas Library | What is Pandas Library | Panda Library Part-1 [HINDI]",
                "video_url": "https://www.youtube.com/watch?v=A2X_Qa3pBlg"
            },
            {
                "title": "What is Pandas? Why and How to Use Pandas in Python",
                "video_url": "https://www.youtube.com/watch?v=dcqPhpY7tWk"
            }
        ]
    },
    {
        "topic_name": "Data Manipulation with Pandas",
        "paragraphs": [
            "Pandas provides a large number of functions to manipulate data in DataFrames, like selecting specific rows and columns, filtering, sorting, and adding new columns. You can perform a variety of these operations on your DataFrames using a variety of pandas functions. This data manipulation will be a key aspect of your workflow.",
            "Pandas also has a number of operations for data aggregation, grouping, and merging, like groupby, aggregate, and merge functions. These operations allow you to analyze and combine your data to get to the information you need.",
            "Learning how to manipulate data with Pandas is crucial for preparing and transforming your data for analysis.  This is a core skill for any analyst who works with Python and is a prerequisite for data analysis using Python."
        ],
        "links": [
            "https://pandas.pydata.org/docs/getting_started/index.html",
            "https://www.geeksforgeeks.org/python-pandas-data-manipulation/"
        ],
        "yt_links": [
            {
                "title": "Data Manipulation with Pandas (Python)",
                "video_url": "https://www.youtube.com/watch?v=3qdzsvlOlS4"
            },
            {
                "title": "Exploratory Data Analysis in Pandas | Python Pandas Tutorials",
                "video_url": "https://www.youtube.com/watch?v=Liv6eeb1VfE"
            },
            {
                "title": "Python Pandas Tutorial in Hindi",
                "video_url": "https://www.youtube.com/watch?v=RhEjmHeDNoA"
            },
            {
                "title": "Data Cleaning in Pandas | Python Pandas Tutorials",
                "video_url": "https://www.youtube.com/watch?v=bDhvCp3_lYw"
            },
            {
                "title": "Learn how to use PANDAS in Python in 15 minutes - with 10 real examples",
                "video_url": "https://www.youtube.com/watch?v=mkYBJwX_dMs"
            }
        ]
    }
] ''';

List<dynamic> responseData3=jsonDecode(response3);
List<Chapter> chapters3 = responseData2.map((json) => Chapter.fromJson(json)).toList();


Courses course3=Courses(courseId: "003", courseName: "Analyst Prep Course: SQL, PowerBI, Python", courseImg: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fsqlspreads.com%2Fblog%2Fconnect-power-bi-to-sql-server-step-by-step-guide%2F&psig=AOvVaw3lwDl33gSe1yWIiQiKkkZj&ust=1738511228760000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLi5nZTpoosDFQAAAAAdAAAAABAE", content: chapters3);