import 'package:crypto_link/data/models/web_data.dart';
import 'package:crypto_link/services/api_services.dart';
import 'package:crypto_link/ui/pages/content/search/widgets/principle_new.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'widgets/search_cards.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: FutureBuilder(
        future: client.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.hasData) {
            final datos = snapshot.data as List<Data>;

            return Column(
              children: <Widget>[
                PrincipleNew(post: datos[0]),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: datos.length,
                    itemBuilder: (context, index) {
                      return SearchCard(
                          date: datos[index].publishedAt,
                          url: datos[index].url,
                          picUrl: datos[index].urlToImage,
                          title: datos[index].title);
                    })
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
