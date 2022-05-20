import 'package:flutter/material.dart';
import 'package:log_in/Screens/onBoarding_page.dart';

// const SAVE_KEY_NAME = "UserLoggedIn";
// SharedPreferences? sp;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Devops Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Testing());
  }
}
