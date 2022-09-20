import 'package:flutter/material.dart';
import 'package:post_test/core/utils/app_colors.dart';
import 'package:post_test/core/utils/assets_manager.dart';
import 'package:post_test/models/post_provider.dart';
import 'package:post_test/widgets/custom_text_form.dart';
import 'package:post_test/widgets/image_widget.dart';
import 'package:provider/provider.dart';

import '../core/utils/app_strings.dart';

class CreatePostBody extends StatelessWidget {
  const CreatePostBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () =>
                    Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                AppStrings.createPost,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Consumer<PostProvider>(
              builder: (context, provider, child) => Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          provider.image != null
                              ? ProfileWidget(
                                  onClicked: () =>
                                      provider.upLoadImage(context),
                                  image: FileImage(provider.image!))
                              : ProfileWidget(
                                  onClicked: () =>
                                      provider.upLoadImage(context),
                                  image: AssetImage(AssetsManager.logo)),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(maxLine: 1,
                              controller: titleController,
                              icon: Icons.playlist_play,
                              labelText: "Name"),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(maxLine: 3,
                              controller: descriptionController,
                              icon: Icons.description,
                              labelText: "Description"),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              provider.addPost(titleController.text,
                                  descriptionController.text, provider.image,DateTime.now(),context);
                           
                            },
                            icon: const Icon(Icons.save),
                            label: const Text("Add Post"),
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.scaffoldBG,
                                primary: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ))
        ],
      ),
    );
  }
}
