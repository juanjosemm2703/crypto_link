import 'package:crypto_link/ui/pages/auth/auth_page.dart';
import 'package:crypto_link/ui/pages/content/content_page.dart';

import 'package:crypto_link/ui/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode mode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    setTheme();
  }

  void setTheme() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? lightMode = preferences.getBool('isLight');
    if (lightMode != null) {
      if (lightMode == true) {
        setState(() {
          mode = ThemeMode.light;
        });
      } else {
        setState(() {
          mode = ThemeMode.dark;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Link',
      theme: MyTheme.ligthTheme,
      // Establecemos el tema oscuro
      darkTheme: MyTheme.darkTheme,
      // Por defecto tomara la seleccion del sistema
      themeMode: mode,
      home: const AuthPage(),

      routes: {
        '/auth': (context) => const AuthPage(),
        '/content': (context) => const ContentPage(),
      },
    );
  }
}
