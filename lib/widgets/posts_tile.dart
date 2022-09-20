// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import 'package:post_test/models/post_model.dart';
import 'package:post_test/models/post_provider.dart';

class PostsTile extends StatelessWidget {
  final Postmodel post;

  const PostsTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                  backgroundImage: FileImage(post.images), radius: 30),
              title: Text(
                post.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                DateFormat.yMEd().format(post.date),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
            Text(post.desc,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 3),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(post.images), fit: BoxFit.contain)),
            ),
            Consumer<PostProvider>(
              builder: (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        value.changeLikePost(post);
                      },
                      icon: Icon(
                        post.isLiked
                            ? Icons.thumb_up
                            : Icons.thumb_up_alt_outlined,
                        size: 20,
                        color: Colors.blue,
                      )),
                  IconButton(
                      onPressed: () {
                        value.deletePost(post);
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.redAccent,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
