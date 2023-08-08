import 'package:fingerprint_authentication/authenticationClass.dart';
import 'package:fingerprint_authentication/final.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                color: Colors.green,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Put Your Fingerprint Below',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Divider(
              color: Colors.green,
              thickness: 5,
            ),
            const SizedBox(
              height: 25.0,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                bool auth = await Authentication.authentication();
                print("Authenticate:$auth");
                if (auth) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FinalPage()));
                }
              },
              icon: const Icon(Icons.fingerprint),
              label: const Text('Authentication'),
            ),
          ],
        ),
      ),
    );
  }
}
