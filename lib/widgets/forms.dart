// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_api/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_response.dart';
import '../screens/forget_password.dart';

class FormsWidgets extends StatefulWidget {
  const FormsWidgets({super.key});

  @override
  State<FormsWidgets> createState() => _FormsWidgetsState();
}

class _FormsWidgetsState extends State<FormsWidgets> {
  bool isPasswordHidden = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse('https://dummyjson.com/auth/login'),
          body: {
            'username': usernameController.text,
            'password': passwordController.text,
          },
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> responseBody = json.decode(response.body);
          final loginResponse = LoginResponse.fromJson(responseBody);

          print('Token: ${loginResponse.token}');
          print('Username: ${loginResponse.username}');
        } else {
          print('Loginfailed');
          print(response.body);
          print('Username: ${usernameController.text}');
          print('Password: ${passwordController.text}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  savedToken(String token) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      print('savedToken: $token');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Username',
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 56, 56, 56)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: formKey.currentState?.validate() == false
                          ? Colors.red
                          : Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.grey,
                        ),
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.length < 5 || value.isEmpty
                            // || !value.contains('@')

                            ) {
                          return "Invalid Username";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 56, 56, 56)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: formKey.currentState?.validate() == false
                              ? Colors.red
                              : Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Center(
                        child: TextFormField(
                          obscureText: isPasswordHidden,
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock_outlined,
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                isPasswordHidden = !isPasswordHidden;
                                setState(() {});
                              },
                              icon: Icon(isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.length < 5 || value.isEmpty) {
                              return "Invalid Password";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ])),
        Padding(
          padding: const EdgeInsets.only(left: 230),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const PasswordPage())));
            },
            child: const Text(
              'Forget password?',
              style: TextStyle(
                  color: Color.fromARGB(255, 28, 46, 122),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              signIn;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              fixedSize: MaterialStateProperty.all(
                const Size(400, 50),
              ),
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 28, 46, 122),
              ),
            ),
            child: const Text(
              'SIGN IN',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
