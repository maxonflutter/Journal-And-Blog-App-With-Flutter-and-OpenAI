import 'package:flutter/material.dart';
import 'package:journal_and_blog_app/screens/blog_post_screen.dart';
import 'package:models/models.dart';

import 'screens/home_screen.dart';
import 'shared/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal & Blog App',
      theme: const AppTheme().themeData,
      routes: {
        '/': (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        // Handle '/blog-post' route
        if (settings.name == '/blog-post') {
          return MaterialPageRoute(
            builder: (context) {
              return BlogPostScreen(blogPostId: settings.arguments as String);
            },
          );
        }
      },
    );
  }
}
