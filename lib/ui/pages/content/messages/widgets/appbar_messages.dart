import 'package:flutter/material.dart';

class CustomAppBarMessages extends AppBar {
  final BuildContext context;
  final String picUrl, name;
  final bool isActive;

  // Creating a custom AppBar that extends from Appbar with super();
  CustomAppBarMessages({
    Key? key,
    required this.context,
    required this.picUrl,
    required this.name,
    required this.isActive,
  }) : super(
            key: key,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                const BackButton(),
                CircleAvatar(
                  backgroundImage: NetworkImage(picUrl),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: Theme.of(context).textTheme.headline1),
                    if (isActive)
                      Row(
                        children: [
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("Online",
                              style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                  ],
                ),
              ],
            ));
}
