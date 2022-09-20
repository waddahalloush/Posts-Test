import 'package:flutter/material.dart';
import 'package:post_test/models/post_provider.dart';
import 'package:post_test/widgets/posts_tile.dart';
import 'package:provider/provider.dart';
import '../core/utils/app_strings.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(
                Icons.playlist_add_check,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                AppStrings.appName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Consumer<PostProvider>(
            builder: (context, provider, child) => Text(
              "${provider.posts.length} Posts",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Consumer<PostProvider>(
            builder: (context, provider, child) => ListView.builder(
                itemCount: provider.posts.length,
                itemBuilder: (context, int i) => PostsTile(
                      post: provider.posts[i],
                    )),
          ))
        ],
      ),
    );
  }
}
