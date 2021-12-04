import 'package:crypto_link/data/models/post.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class PostController extends GetxController {
  final RxList<Post> _postController = <Post>[].obs;

  RxList<Post> get posts {
    return _postController;
  }

  void newPost(name, content, picUrl, date) {
    Post post = Post(content: content, date: date, name: name, picUrl: picUrl);
    _postController.add(post);
  }

  void deletePost(index) {
    _postController.removeAt(index);
  }
}
