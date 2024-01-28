import 'package:flutter/material.dart';
import 'package:sign_in_test/navigation/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontSize: 17,
                color: Color(0xFF4F4F4F),
                fontWeight: FontWeight.w600)),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color.fromARGB(255, 255, 179, 0),
              secondary: Colors.grey[300],
            ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent))),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 15, color: Color(0xFF4F4F4F))),
      ),
      routes: MainNavigation().routes,
      initialRoute: MainNavigationRouteNames.phoneInput,
    );
  }
}
