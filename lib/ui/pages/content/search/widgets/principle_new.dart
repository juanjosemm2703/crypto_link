import 'package:flutter/material.dart';

class PrincipleNew extends StatelessWidget {
  final post;
  const PrincipleNew({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          ClipRRect(
            child: Image.network(post.urlToImage, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              post.title,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
            ),
          ),
        ]);
  }
}
