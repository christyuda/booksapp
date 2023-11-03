import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:bookapps/provider/auth_view_model.dart';
import 'package:bookapps/screens/login_page.dart';

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    // Build our LoginPage widget and wrap it with necessary providers.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ],
        child: MaterialApp(
          home: const LoginPage(),
        ),
      ),
    );

    // Pump the widget to allow it to build.
    await tester.pumpAndSettle();

    // Verify that the UI elements are displayed on the screen.
    expect(find.text('Haloo Sobat Buku'), findsOneWidget);
    expect(find.text('Selamat datang kembali yaa'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
    expect(find.text('Belum Punya Akun?'), findsOneWidget);
    expect(find.text('Silahkan Daftar'), findsOneWidget);

    // Perform additional UI tests as needed.

    // Example: Simulate entering text into the email field.
    await tester.enterText(
        find.byType(TextFormField).first, 'test@example.com');

    // Example: Simulate entering text into the password field.
    await tester.enterText(find.byType(TextFormField).last, 'password123');

    // Example: Tap the login button.
    await tester.tap(find.widgetWithText(ElevatedButton, 'Masuk'));

    // Pump the widget again after interactions.
    await tester.pumpAndSettle();

    // Verify the result of your interactions.

    // Clean up after the test.
  });
}
