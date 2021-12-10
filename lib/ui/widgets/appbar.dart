import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends AppBar {
  final BuildContext context;
  final String picUrl;
  final Widget titulo;
  final VoidCallback onSignOff, onProfile, setTheme;

  // Creating a custom AppBar that extends from Appbar with super();
  CustomAppBar(
      {Key? key,
      required this.context,
      required this.picUrl,
      required this.titulo,
      required this.onSignOff,
      required this.onProfile,
      required this.setTheme})
      : super(
          key: key,
          centerTitle: true,
          leading: Center(
            child: InkWell(
              onTap: onProfile,
              child: CircleAvatar(
                minRadius: 18.0,
                maxRadius: 18.0,
                backgroundImage: NetworkImage(picUrl),
              ),
            ),
          ),
          title: titulo,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.brightness_4_rounded,
              ),
              onPressed: setTheme,
              // () {
              //   Get.changeThemeMode(
              //       Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
              // },
            ),
            IconButton(
              icon: const Icon(
                Icons.logout,
              ),
              onPressed: onSignOff,
            )
          ],
        );
}
