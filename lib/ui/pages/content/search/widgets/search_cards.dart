import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  final String title, picUrl, date;
  final VoidCallback onNews;

  // StateCard constructor
  const SearchCard(
      {Key? key,
      required this.title,
      required this.picUrl,
      required this.onNews,
      required this.date})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(
            top: 4.0, bottom: 10.0, left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
                      imageUrl: picUrl,
                      placeholder: (context, url) => const SizedBox(
                        child: CircularProgressIndicator(),
                        width: 10,
                        height: 10,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 6.0,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Text(
                  date,
                  style: Theme.of(context).textTheme.headline3,
                )),
          ],
        ),
      ),
    );
  }
}
