import 'package:crypto_link/domain/controller/post_controller.dart';
import 'package:crypto_link/ui/pages/content/content_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/state_card.dart';

class StatesScreen extends StatefulWidget {
  const StatesScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<StatesScreen> {
  final items = List<String>.generate(20, (i) => "Item $i");
  PostController controllerPost = Get.find();
  @override
  Widget build(BuildContext context) {
    final posts = controllerPost.posts;
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return StateCard(
            title: posts[index].name,
            content: posts[index].content,
            picUrl: posts[index].picUrl,
            onDelete: () {
              controllerPost.deletePost(index);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const ContentPage()),
                  (route) => false);
            },
            date: posts[index].date);
      },
    );
  }
}
