import 'package:flutter/material.dart';
import 'package:log_in/Screens/login_screen.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(children: [
        SizedBox(
          height: 300,
          width: 500,
          child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaDPq65gyAh9DqdoNiRo9qCYsAcY355GLOFA&usqp=CAU"),
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Devops School",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            icon: const Icon(Icons.arrow_circle_right))
      ])),
    );
  }
}
