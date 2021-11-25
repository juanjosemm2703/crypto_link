import 'package:crypto_link/ui/pages/auth/auth_page.dart';
import 'package:crypto_link/ui/pages/content/content_page.dart';
import 'package:crypto_link/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Link',
      theme: MyTheme.ligthTheme,
      // Establecemos el tema oscuro
      darkTheme: MyTheme.darkTheme,
      // Por defecto tomara la seleccion del sistema
      themeMode: ThemeMode.system,
      home: const AuthPage(),
      routes: {
        '/auth': (context) => const AuthPage(),
        '/content': (context) => const ContentPage(),
      },
    );
  }
}
