import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/domain/controller/post_controller.dart';
import 'package:crypto_link/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:mockito/mockito.dart';

Widget makeTestableWidget() => MaterialApp(home: Image.network(''));

class MockAuthController extends GetxService
    with Mock
    implements AuthController {
  @override
  Future<void> signUp(dynamic _email, dynamic _passw, dynamic username) async {}

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

  testWidgets('Signup', (WidgetTester tester) async {
    Get.put(PostController());
    // Working with Network Images.
    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Go to SignUp page.
    await tester.tap(find.byKey(const Key('welcomeButton')));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Enter data to Text Fields.
    await tester.enterText(find.byKey(const Key('name')), 'Juan Jose Martinez');
    await tester.enterText(find.byKey(const Key('email')), 'juan@gmail.com');
    await tester.enterText(find.byKey(const Key('password')), 'password123');
    await tester.enterText(
        find.byKey(const Key('confirmPassword')), 'password123');

    // Go to Content page.
    await tester.ensureVisible(find.byKey(const Key('registerButton')));
    await tester.tap(find.byKey(const Key('registerButton')));
    await tester.pumpAndSettle();

    // Verify that we changed to ContentPage.
    expect(find.byKey(const Key('contentPage')), findsOneWidget);
  });
}
