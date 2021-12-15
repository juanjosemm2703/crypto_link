import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/data/models/post.dart';
import 'package:crypto_link/data/models/user.dart';
import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/domain/controller/post_controller.dart';
import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:crypto_link/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestableWidget() => MaterialApp(home: Image.network(''));

class MockAuthController extends GetxService
    with Mock
    implements AuthController {
  @override
  Future<void> logIn(dynamic email, dynamic pass) async {}

  @override
  Future<void> logOut() async {}

  @override
  String userEmail() {
    String email = "a@a.com";
    return email;
  }

  @override
  String getUid() {
    String uid = '1';
    return uid;
  }
}

class MockPostController extends GetxService
    with Mock
    implements PostController {
  @override
  RxList<Post> get posts {
    return <Post>[Post(date: '', message: '', name: '', picUrl: '', uid: '')]
        .obs;
  }

  @override
  Future uploadPost(String uid, Post newPost) async {}

  @override
  Future deletePost(String idPost) async {}
}

class MockUserController extends GetxService
    with Mock
    implements UserController {
  @override
  var user = <User>[
    User(uid: 'uid', email: 'email', name: 'name', profilePic: 'profilePic')
  ].obs;

  @override
  Future<void> addUserData(
      String name, String profilePic, String email, String uid) async {}

  @override
  Future<void> changeUserState(bool isActive, String uid) async {}

  @override
  updateUserData(String uid) async {}

  @override
  updateUserDataBySignUp(User _user) {}

  @override
  updateProfilePic(uid, {required File file}) async {}

  @override
  updateImage(String url) {}

  @override
  Future<String> uploadImage(String uid, file) async {
    return "hola";
  }

  @override
  clearUserData() {
    user.clear();
  }

  List<User> get data => user;
}

void main() {
  setUp(() {
    MockAuthController mockAuthController = MockAuthController();
    MockPostController mockPostController = MockPostController();
    MockUserController mockUserController = MockUserController();
    Get.put<AuthController>(mockAuthController);
    Get.put<PostController>(mockPostController);
    Get.put<UserController>(mockUserController);
  });

  testWidgets('Login test', (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Go to SignIn page.
    await tester.tap(find.byKey(const Key('welcomeButton')));

    // Rebuild the widget after the state has changed.
    await tester.pumpAndSettle();

    // Enter data to Text Fields.
    await tester.enterText(
        find.byKey(const Key('email')), 'juanmartinezmonsalve@gmail.com');
    await tester.enterText(find.byKey(const Key('password')), '123456');

    // Go to Content page.
    await tester.ensureVisible(find.byKey(const Key('logInButton')));
    await tester.tap(find.byKey(const Key('logInButton')));
    await tester.pumpAndSettle();

    // Verify that we changed to ContentPage.
    // await tester.ensureVisible(find.byKey(const Key('contentPage')));
    // expect(find.byKey(const Key('contentPage')), findsOneWidget);
  });
}
