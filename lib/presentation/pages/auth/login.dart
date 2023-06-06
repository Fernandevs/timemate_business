import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:timemate_business/presentation/providers/auth.dart';

class Login extends ConsumerWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider);
    final TextEditingController email =
        TextEditingController(text: 'user@email.com');
    final TextEditingController password =
        TextEditingController(text: 'FlutterApp1234*');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    auth.login(email: email.text, password: password.text);

                    if (auth.user != null) {
                      context.goNamed('home');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
