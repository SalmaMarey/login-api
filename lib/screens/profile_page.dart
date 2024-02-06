import 'package:flutter/material.dart';
import 'package:login_api/screens/home_page.dart';

import '../models/login_response.dart';

class ProfilePage extends StatelessWidget {
  final LoginResponse loginResponse;
  const ProfilePage({super.key, required this.loginResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 220,
            child: Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: const Color.fromARGB(255, 28, 46, 122),
                ),
                Positioned(
                  left: 20,
                  top: 180,
                  child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(loginResponse.image.toString())),
                ),
                Positioned(
                  left: 330,
                  top: 40,
                  child: IconButton(
                    icon: const Icon(Icons.login),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loginResponse.firstName.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'username',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.heart_broken),
                        Text('data'),
                        Text('7')
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.heart_broken),
                        Text('data'),
                        Text('7')
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.heart_broken),
                        Text('data'),
                        Text('7')
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.category),
                            SizedBox(
                              width: 10,
                            ),
                            Text('data'),
                            SizedBox(
                              width: 270,
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.category),
                            SizedBox(
                              width: 10,
                            ),
                            Text('data'),
                            SizedBox(
                              width: 270,
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.category),
                            SizedBox(
                              width: 10,
                            ),
                            Text('data'),
                            SizedBox(
                              width: 270,
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
