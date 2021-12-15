import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrincipleNew extends StatelessWidget {
  final post, url;
  const PrincipleNew({Key? key, required this.post, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launch(post.url);
      },
      child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            ClipRRect(
                child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: post.urlToImage,
              placeholder: (context, url) => const Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
            )
                // child: Image.network(post.urlToImage, fit: BoxFit.cover),
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
          ]),
    );
  }
}
