import 'package:flutter/material.dart';
import 'package:log_in/Screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // SharedPreferences? logindata;
  String? username;
  // @override
  // void initState() {
  //   super.initState();
  //   initial();
  // }

  // initial() async {
  //   logindata = await SharedPreferences.getInstance();

  //   setState(() {
  //     username = logindata?.getString('email');
  //     print(username);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
          child: Center(
              child: Text(
        "Welcome $username  ",
        style: const TextStyle(fontSize: 20),
      ))),
    );
  }

  signout(BuildContext ctx) async {
    final _sharepref = await SharedPreferences.getInstance();
    await _sharepref.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => const LoginPage()),
        (route) => false);
  }

  getdata() async {
    final _sharepref = await SharedPreferences.getInstance();

    username = _sharepref.getString('email');
  }
}
