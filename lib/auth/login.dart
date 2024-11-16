import 'package:first_test/comp/buttons.dart';
import 'package:first_test/comp/logo.dart';
import 'package:first_test/comp/textformfield.dart';
import 'package:first_test/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var button2 = Button(
                title: "Login",
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('homepage');
                });
    return Scaffold(
      body: Container(
        color: const Color(0xffFFFFFF),
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const logo(),
            const SizedBox(height: 20),
            const Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "LogIn To Continue using the app",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text("Email", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 5),
            CustomTextformfield(
              hintText: "  Enter Your Email",
              mycontroller: email,
            ),
            const SizedBox(height: 10),
            const Text("Password", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 5),
            CustomTextformfield(
              hintText: "  Enter Your Password",
              mycontroller: password,
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {},
              child: const Text(
                "Forgot Password ?",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 5),
            Button(title: "Login" ,onPressed: (){
              Navigator.of(context).pushReplacementNamed("homepage");
            },),
            const SizedBox(height: 5),
            const Text(
              "Or Login",
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.facebook, color: Colors.blue, size: 50),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.apple_outlined, size: 50),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.tiktok_outlined,
                      color: Colors.red, size: 50),
                ),
              ],
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("signup");
              },
              child: const Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "Don't Have An Account ? "),
                  TextSpan(
                    text: "SignUp",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
