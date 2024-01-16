class BlogPost {
  final String id;
  final String title;
  final String author;
  final String authorImageUrl;
  final String readTime;
  final String category;
  final String thumbnailUrl;
  final List<String> tags;
  final List<String> paragraphs;
  final int viewsCount;
  final int likesCount;
  final bool isFeatured;
  final DateTime publishedDate;
  final DateTime? lastUpdatedDate;

  const BlogPost({
    required this.id,
    required this.title,
    required this.author,
    required this.authorImageUrl,
    required this.readTime,
    required this.category,
    required this.tags,
    required this.paragraphs,
    required this.thumbnailUrl,
    this.viewsCount = 0,
    this.likesCount = 0,
    this.isFeatured = false,
    required this.publishedDate,
    this.lastUpdatedDate,
  });

  String get publishedDateFormatted {
    return '${publishedDate.month}/${publishedDate.day}/${publishedDate.year}';
  }

  String get authorInitials {
    return author.split(' ').map((e) => e[0]).join();
  }

  static final blogPosts = [
    BlogPost(
      id: '001',
      title: 'Exploring the Flutter Ecosystem',
      author: 'Jane Doe',
      authorImageUrl:
          'https://images.unsplash.com/photo-1704551291212-332cad801af3?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      readTime: '5 min',
      category: 'Technology',
      tags: ['Flutter', 'Mobile Development', 'UI/UX'],
      paragraphs: [
        'Flutter, developed by Google, has significantly transformed the way mobile applications are developed, offering a unique approach to UI design and functionality. This innovative framework allows developers to write code once and deploy it on both iOS and Android platforms, significantly reducing development time and effort. Its hot reload feature further enhances productivity, enabling developers to see the results of their changes almost instantly, without losing the current application state.',
        'Let’s dive deep into the Flutter ecosystem and explore its benefits in detail. Its rich set of pre-designed widgets provides a way to create visually appealing and highly responsive user interfaces. These widgets are customizable, allowing developers to create a unique look and feel for their apps. Moreover, its layered architecture ensures that the rendering process is fast and efficient, which is crucial for creating smooth animations and transitions. The ecosystem is also supported by a robust package library, offering reusable code for a wide range of functionalities, from network requests to image processing.',
        'From widgets to state management, Flutter provides a comprehensive toolkit for building modern mobile applications. State management in Flutter, an essential aspect of app development, can be handled in various ways, catering to different project needs. Whether using Provider, Riverpod, Bloc, or any other approach, Flutter offers flexibility and choice to developers. This adaptability extends to various other aspects of development, such as integrating with backend services, handling user input, and managing app state across multiple screens. With its growing community and continuous updates, Flutter is rapidly becoming the go-to framework for many developers looking to build high-quality, cross-platform mobile applications.'
      ],
      thumbnailUrl:
          'https://images.unsplash.com/photo-1545486332-9e0999c535b2?q=80&w=3687&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      viewsCount: 15,
      likesCount: 120,
      isFeatured: true,
      publishedDate: DateTime(2024, 1, 8),
      lastUpdatedDate: DateTime(2024, 1, 10),
    ),
    BlogPost(
      id: '002',
      title: 'The Art of Baking Bread',
      author: 'John Smith',
      authorImageUrl:
          'https://images.unsplash.com/photo-1704031456784-1bf65f7c9466?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      readTime: '3 min',
      category: 'Food',
      tags: ['Baking', 'Cooking', 'Healthy Eating'],
      paragraphs: [
        'Baking bread at home can be a rewarding experience.',
        'We will cover the basics of bread making, from kneading to baking.',
        'Discover the joy of homemade bread with these simple tips.'
      ],
      thumbnailUrl:
          'https://images.unsplash.com/photo-1575722290270-626b0208df99?q=80&w=2432&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      viewsCount: 30,
      likesCount: 85,
      isFeatured: false,
      publishedDate: DateTime(2024, 1, 5),
    ),
    BlogPost(
      id: '003',
      title: 'Mastering Landscape Photography',
      author: 'Alice Johnson',
      authorImageUrl:
          'https://images.unsplash.com/photo-1698365039593-5180c517bb96?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      readTime: '7 min',
      category: 'Photography',
      tags: ['Photography', 'Landscapes', 'Nature'],
      paragraphs: [
        'Landscape photography is a fascinating endeavor that captures the beauty of nature.',
        'This guide will help you master the art of capturing stunning landscapes.',
        'Learn about the best camera settings, timing, and locations for landscape photography.'
      ],
      thumbnailUrl:
          'https://images.unsplash.com/photo-1513569771920-c9e1d31714af?q=80&w=3648&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      viewsCount: 20,
      likesCount: 150,
      isFeatured: true,
      publishedDate: DateTime(2024, 1, 2),
      lastUpdatedDate: DateTime(2024, 1, 4),
    )
  ];
}
