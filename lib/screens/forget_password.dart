import 'package:flutter/material.dart';
import 'package:login_api/screens/login_screen.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 40,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const LogInPage())));
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130, top: 50),
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/10484/10484590.png',
                height: 100,
                width: 100,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Center(
              child: Column(
                children: [
                  Text(
                    'Forget Password?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Enter the email associated with your account and we'll send an email to reset your passsword",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 97, 97, 97)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
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
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.grey,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.length < 5 ||
                              value.isEmpty ||
                              !value.contains('@')) {
                            return "Invalid email";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
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
                      'SEND EMAIL',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ]),
    );
  }
}
