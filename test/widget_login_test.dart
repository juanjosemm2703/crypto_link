import 'package:crypto_link/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestableWidget() => MaterialApp(home: Image.network(''));

void main() {
  testWidgets('Login', (WidgetTester tester) async {
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
    await tester.enterText(find.byKey(const Key('email')), 'juan@gmail.com');
    await tester.enterText(find.byKey(const Key('password')), 'password123');

    // Go to Content page.
    await tester.ensureVisible(find.byKey(const Key('logInButton')));
    await tester.tap(find.byKey(const Key('logInButton')));
    await tester.pumpAndSettle();

    // Verify that we changed to ContentPage.
    expect(find.byKey(const Key('contentPage')), findsOneWidget);
  });
}
