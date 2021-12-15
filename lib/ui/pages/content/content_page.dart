import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/domain/controller/location_controller.dart';
import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:crypto_link/ui/pages/content/online/onlinechat_screen.dart';
import 'package:crypto_link/ui/pages/content/post/new_post.dart';
import 'package:crypto_link/ui/pages/content/profile/profile_page.dart';
import 'package:crypto_link/ui/pages/content/search/search_screen.dart';
import 'package:crypto_link/ui/pages/content/states/states_scren.dart';
import 'package:crypto_link/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chat/chat_pages.dart';
import 'notifications/notifications_page.dart';
import 'package:crypto_link/data/models/location.dart';

class ContentPage extends StatefulWidget {
  final int? index;
  const ContentPage({Key? key, this.index}) : super(key: key);

  @override
  _State createState() => _State(index);
}

class _State extends State<ContentPage> {
  final int? index;
  int _selectedIndex = 0;

  Widget _content = const StatesScreen();
  Icon _floattingIcon = const Icon(Icons.add, color: Colors.white);
  int floattingSwitch = 1;

  _State(this.index);

  @override
  void initState() {
    LocationController controllerLocation = Get.find();
    if (index != null) {
      _selectedIndex = index!;
      _onItemTapped(_selectedIndex);
    }
    super.initState();
    controllerLocation.obtenerubicacion();
    location();
  }

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

  Future<void> setTheme() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    if (Get.isDarkMode) {
      preferences.setBool('isLight', true);
    } else {
      preferences.setBool('isLight', false);
    }
  }

  Future<void> location() async {
    LocationController controllerLocation = Get.find();
    AuthController controllerAuth = Get.find();
    LocationClass newLocation = controllerLocation.location;

    await controllerLocation.uploadLocation(
        controllerAuth.getUid(), newLocation);
  }

  @override
  Widget build(BuildContext context) {
    AuthController controllerAuth = Get.find();

    return GetX<UserController>(builder: (controller) {
      return Scaffold(
          key: const Key('contentPage'),
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: CustomAppBar(
            picUrl: controller.data[0].profilePic,
            titulo: Text("Crypto Link",
                style: Theme.of(context).textTheme.headline1),
            context: context,
            onSignOff: () async {
              await controller.changeUserState(false, controllerAuth.getUid());
              await controllerAuth.logOut();
              await Get.offNamed('/auth');
              controller.clearUserData();
            },
            onProfile: () {
              _onFlottingTapped(3);
            },
            setTheme: setTheme,
          ),
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
          ));
    });
  }
}
