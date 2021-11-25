import 'package:crypto_link/ui/pages/content/post/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: NewPostCard(
            picUrl:
                'https://dq1eylutsoz4u.cloudfront.net/2016/08/24175451/how-to-get-a-good-profile-photo.jpg'));
  }
}
