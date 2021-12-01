import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:crypto_link/ui/pages/content/online/onlinechat_screen.dart';
import 'package:crypto_link/ui/pages/content/post/new_post.dart';
import 'package:crypto_link/ui/pages/content/profile/profile_page.dart';
import 'package:crypto_link/ui/pages/content/search/search_screen.dart';
import 'package:crypto_link/ui/pages/content/states/states_scren.dart';
import 'package:crypto_link/ui/widgets/appbar.dart';
import 'package:crypto_link/ui/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat/chat_pages.dart';
import 'notifications/notifications_page.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ContentPage> {
  int _selectedIndex = 0;
  Widget _content = const StatesScreen();
  Icon _floattingIcon = const Icon(Icons.add, color: Colors.white);
  int floattingSwitch = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 1:
          _content = const SearchScreen();
          _floattingIcon = const Icon(Icons.add, color: Colors.white);
          floattingSwitch = 1;
          break;
        case 2:
          _content = const ChatScreen();
          _floattingIcon =
              const Icon(Icons.person_add_alt_1, color: Colors.white);
          floattingSwitch = 2;
          break;
        case 3:
          _content = const NotificationScreen();
          _floattingIcon = const Icon(Icons.add, color: Colors.white);
          floattingSwitch = 1;
          break;
        default:
          _content = const StatesScreen();
          _floattingIcon = const Icon(Icons.add, color: Colors.white);
          floattingSwitch = 1;
      }
    });
  }

  void _onFlottingTapped(int index) {
    setState(() {
      switch (index) {
        case 1:
          _content = const NewPost();
          _floattingIcon = const Icon(Icons.add, color: Colors.white);
          break;
        case 2:
          _content = const OnlinePeopleScreen();
          _floattingIcon =
              const Icon(Icons.person_add_alt_1, color: Colors.white);
          break;
        case 3:
          _content = const ProfileScreen();
          _floattingIcon = const Icon(Icons.add, color: Colors.white);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    AuthController controllerAuth = Get.find();

    return Stack(
        key: const Key('contentPage'),
        fit: StackFit.expand,
        children: <Widget>[
          CustomPaint(
              painter: BackgroundPainter(
                  fondo: Theme.of(context).colorScheme.background,
                  blur: Theme.of(context).colorScheme.primary)),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
                picUrl:
                    'https://dq1eylutsoz4u.cloudfront.net/2016/08/24175451/how-to-get-a-good-profile-photo.jpg',
                titulo: Text("Crypto Link",
                    style: Theme.of(context).textTheme.headline1),
                context: context,
                onSignOff: () {
                  controllerAuth.logOut();
                  Get.offNamed('/auth');
                  // print(controllerAuth.authController);
                },
                onProfile: () {
                  _onFlottingTapped(3);
                }),

            body: SafeArea(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: _content,
              ),
            ),

            // Content screen navbar
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'States',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_outlined),
                  label: 'Notifications',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),

            floatingActionButton: FloatingActionButton(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: _floattingIcon,
              ),
              onPressed: () {
                _onFlottingTapped(floattingSwitch);
              },
            ),
          ),
        ]);
  }
}
