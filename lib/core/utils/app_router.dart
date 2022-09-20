import 'package:flutter/material.dart';
import 'package:post_test/screens/create_posts.dart';
import 'package:post_test/screens/home_page.dart';

class AppRouter {
  static const homePost = "/";
  static const createPost = '/create';
 
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePost:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case createPost:
        return MaterialPageRoute(
          builder: (context) => const CreatePosts(),
        );
    
    }
    return null;
  }
}
