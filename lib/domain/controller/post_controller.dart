import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/data/models/post.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final RxList<Post> _postController = <Post>[].obs;
  final _refPosts = FirebaseFirestore.instance.collection('post/');

  RxList<Post> get posts {
    return _postController;
  }

  Stream<QuerySnapshot> snapshotPosts() {
    return _refPosts.orderBy('date', descending: true).snapshots();
  }

  Future uploadPost(String uid, Post newPost) async {
    await _refPosts.add(newPost.toJson());
  }

  Future deletePost(String idPost) async {
    await _refPosts
        .doc(idPost)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
