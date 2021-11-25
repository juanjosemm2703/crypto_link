import 'package:crypto_link/ui/pages/content/search/widgets/search_cards.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SearchScreen> {
  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return SearchCard(
            title:
                'Desde diciembre, se podría comprar casa con bitcoin en La Haus',
            picUrl:
                'https://www.fundeu.es/wp-content/uploads/2021/02/cripto.jpg',
            onNews: () => {},
            date: "21/11/2021");
      },
    );
  }
}
