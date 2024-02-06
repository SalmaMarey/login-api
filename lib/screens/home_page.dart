// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:login_api/screens/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  retrieveToken() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedToken = prefs.getString('token');
      print('Retrieved token: $savedToken');

      // loginResponse = LoginResponse(
      //   id: loginResponse.id,
      //   username: loginResponse.username,
      //   email: loginResponse.email,
      //   firstName: loginResponse.firstName,
      //   lastName: loginResponse.lastName,
      //   gender: loginResponse.gender,
      //   image: loginResponse.image,
      //   token: savedToken,
      // );
    } catch (e) {
      print('Error retrieving token: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: retrieveToken, icon: const Icon(Icons.save)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfilePage(loginResponse: loginResponse),
                    ),
                  );
                },
                icon: const Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
