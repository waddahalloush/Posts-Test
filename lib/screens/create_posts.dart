import 'package:flutter/material.dart';
import 'package:post_test/widgets/create_posts_body.dart';

class CreatePosts extends StatelessWidget {
  const CreatePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreatePostBody(),
    );
  }
}
