import 'package:flutter/material.dart';

class NewPostCard extends StatelessWidget {
  final String picUrl;

  const NewPostCard({Key? key, required this.picUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
