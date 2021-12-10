import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:crypto_link/ui/pages/content/post/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    UserController controllerUser = Get.find();
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child:
          Center(child: NewPostCard(picUrl: controllerUser.user[0].profilePic)),
    );
  }
}
