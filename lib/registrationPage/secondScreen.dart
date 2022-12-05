import 'package:flutter/material.dart';
import 'package:signarabiclanguagee/registrationPage/widgets/registration.dart';

enum AuthType { login, register }

class LogIn extends StatelessWidget {
  final AuthType authType;

  const LogIn({Key key, this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.888,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 36, 62, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
                Column(
                  children: [
                    authType == AuthType.login
                        ? const SizedBox(height: 38) // start mr7bn
                        : const SizedBox(height: 40),// start insha2 7saab
                    authType == AuthType.login
                        ? const Text(
                            'مرحبا',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            'انشاء حساب',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    AuthForm(authType: authType),
                    authType == AuthType.login
                        ? Image.asset('assets/img.png', height: 250)
                        : const SizedBox(height: 30),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
