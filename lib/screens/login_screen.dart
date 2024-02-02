import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    bool isPasswordHidden = true;
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    String email = "";
    String password = "";
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/3442/3442357.png',
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
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const Text(
                  'Enter your account here',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 97, 97, 97)),
                ),
                const SizedBox(
                  height: 25,
                ),
                Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 56, 56, 56)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color:
                                      formKey.currentState?.validate() == false
                                          ? Colors.red
                                          : Colors.grey,
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
                                  onChanged: (value) {
                                    email = value;
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
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 56, 56, 56)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: formKey.currentState?.validate() ==
                                              false
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
                                            isPasswordHidden =
                                                !isPasswordHidden;
                                            setState(() {});
                                          },
                                          icon: Icon(isPasswordHidden
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                        ),
                                        hintText: 'Password',
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                      validator: (value) {
                                        if (value!.length < 5 ||
                                            value.isEmpty) {
                                          return "Invalid Password";
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        password = value;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ])),
                const Padding(
                  padding: EdgeInsets.only(left: 250),
                  child: Text(
                    'Forget password?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 28, 46, 122),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {});
                        try {
                          SnackBar snackBar = const SnackBar(
                            content: Text('Welcome to the app'),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } catch (e) {
                          SnackBar snackBar = const SnackBar(
                            content: Text('Error happend'),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {}
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
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or Sign in With',
                        style: TextStyle(
                            color: Color.fromARGB(255, 56, 56, 56),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/281/281764.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/5968/5968764.png',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
