import 'package:flutter/material.dart';
import 'package:post_test/core/utils/app_router.dart';

import '../widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.createPost);
        },
        child: const Icon(
          Icons.add,
          size: 22,
          color: Colors.white,
        ),
      ),
      body: const HomeBody(),
    );
  }
}

