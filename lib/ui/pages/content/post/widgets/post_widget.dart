import 'package:crypto_link/data/models/post.dart';
import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/domain/controller/post_controller.dart';

import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:crypto_link/ui/pages/content/content_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPostCard extends StatelessWidget {
  final String picUrl;

  const NewPostCard({Key? key, required this.picUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostController controllerPost = Get.find();
    UserController controllerUser = Get.find();
    AuthController controllerAuth = Get.find();
    final post = TextEditingController();
    return Column(
      children: [
        SizedBox(
          height: 100.0,
          width: 100.0,
          child: Center(
            child: CircleAvatar(
              minRadius: 50.0,
              maxRadius: 50.0,
              backgroundImage: NetworkImage(picUrl),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 15.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Write your post',
            ),
            controller: post,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            minLines: 2,
            maxLines: null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 120,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: () {
                  Post newPost = Post(
                      name: controllerUser.data[0].name,
                      message: post.text,
                      picUrl: controllerUser.data[0].profilePic,
                      date: DateTime.now().toString());
                  controllerPost.uploadPost(controllerAuth.getUid(), newPost);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContentPage()),
                      (route) => false);
                },
                child: Text('Add Post',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),
          ),
        )
      ],
    );
  }
}
