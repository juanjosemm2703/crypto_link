import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/domain/controller/post_controller.dart';
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
}

void main() {
  setUp(() {
    MockAuthController mockAuthController = MockAuthController();
    Get.put<AuthController>(mockAuthController);
  });

  testWidgets('Login test', (WidgetTester tester) async {
    Get.put(PostController());
    // Working with Network Images.
    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Go to SignUp page.
    await tester.tap(find.byKey(const Key('welcomeButton')));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Go to SignIn page.
    // Go to Content page.
    await tester.ensureVisible(find.byKey(const Key('switchLogIn')));
    await tester.tap(find.byKey(const Key('switchLogIn')));
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
    expect(find.byKey(const Key('contentPage')), findsOneWidget);
  });
}
