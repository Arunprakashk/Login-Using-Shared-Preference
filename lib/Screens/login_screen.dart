import 'package:flutter/material.dart';
import 'package:log_in/Screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Container(
          child: LottieBuilder.network(
              "https://assets5.lottiefiles.com/private_files/lf30_iigy7rqn.json"),
        ),
        Form(
            key: _formKey,
            child: Column(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(6.0, 15.0, 0.0, 0.0),
                child: const Text('DevOps  ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Value is Empty";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 10),
                child: TextFormField(
                  controller: _pwdController,
                  decoration: const InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Value is Empty";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      checkLogin(context);
                    } else {
                      print("Data Empty");
                    }
                  },
                  child: const Text('Login')),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.white,
                              title: Column(children: [
                                Visibility(
                                  visible: _isVisible,
                                  child: const Text("Verification Process",
                                      style: TextStyle(color: Colors.blue)),
                                ),
                                const SizedBox(height: 10),
                                const TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter your email id',
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blueGrey))),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                  onPressed: showToast,
                                  child: const Text(
                                    "Confirm",
                                    // style: TextStyle(color: Colors.blue),
                                  ),
                                )
                              ]),
                            ));
                    shape:
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0));
                  },
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.grey),
                  ))
            ])),
      ],
    )));
  }

  void checkLogin(BuildContext ctx) async {
    final email = emailController.text;
    final _password = _pwdController.text;
    if (email == _password) {
      print("Matched");
      final _sharepref = await SharedPreferences.getInstance();

      await _sharepref.setString("email", email);
      await _sharepref.setString("password", _password);
      //SAVE_KEY_NAME.setStri("email", email);

      //goto welcomepage
      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const WelcomePage()));
    } else {
      print("Email pswd dosn't match");
    }
  }
}
