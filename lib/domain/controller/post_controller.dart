import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/data/models/post.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final RxList<Post> _postController = <Post>[].obs;
  RxList<Post> get posts {
    return _postController;
  }

  Future uploadPost(String uid, Post newPost) async {
    final _refPosts =
        FirebaseFirestore.instance.collection('post/$uid/messages');
    await _refPosts.add(newPost.toJson());

    final _refUser = FirebaseFirestore.instance.collection('user');
    await _refUser.doc(uid).update({'lastMessagetTime': DateTime.now()});
  }
}
