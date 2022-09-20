import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_test/models/post_model.dart';

import '../core/utils/app_router.dart';

class PostProvider extends ChangeNotifier {
  File? image;

  List<Postmodel> posts = [];
  void addPost(String title, String description, File? image, DateTime date,
      BuildContext context) {
    if (image == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed To Pick Image")));
    } else {
      posts.add(
          Postmodel(name: title, desc: description, images: image, date: date));
      Navigator.of(context).pushReplacementNamed(AppRouter.homePost);
    }
    notifyListeners();
  }

  void deletePost(Postmodel post) {
    posts.remove(post);
    notifyListeners();
  }

  void changeLikePost(Postmodel postmodel) {
    postmodel.isLiked = !postmodel.isLiked;
    notifyListeners();
  }

  void likePost(Postmodel postmodel) {
    postmodel.isLiked = !postmodel.isLiked;
  }

  Future upLoadImage(BuildContext context) async {
    try {
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      image = File(pickedImage.path);
      notifyListeners();
    } on PlatformException {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed To Pick Image")));
    }
  }
}
