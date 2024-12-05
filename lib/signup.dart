import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_test/comp/buttons.dart';
import 'package:first_test/comp/logo.dart';
import 'package:first_test/comp/textformfield.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> fs = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffFFFFFF),
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const logo(),
            const SizedBox(height: 20),
            Form(
              key: fs,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "SignUp",
                    style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "SignUp To Continue using the app",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  const Text("username", style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 5),
                  CustomTextformfield(
                    hintText: "  Enter Your Username",
                    mycontroller: username,
                    validator: (val) {
                      if (val == "") {
                        return "Can't to empthy";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text("Email", style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 5),
                  CustomTextformfield(
                    hintText: "  Enter Your Email",
                    mycontroller: email,
                    validator: (val) {
                      if (val == "") {
                        return "Can't to empthy";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text("Password", style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 5),
                  CustomTextformfield(
                    hintText: "  Enter Your Password",
                    mycontroller: password,
                    validator: (val) {
                      if (val == "") {
                        return "Can't to empthy";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Button(
                        title: "SignUp",
                        onPressed: () async {
                          if (fs.currentState!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );
                              FirebaseAuth.instance.currentUser!.sendEmailVerification();
                              Navigator.of(context).pushReplacementNamed("login");
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Error',
                                  desc: 'The password provided is too weak.',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                              } else if (e.code == 'email-already-in-use') {
                                print('The account already exists for that email.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  title: 'Warnning',
                                  desc: 'The account already exists for that email.',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                        }),
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("login");
                    },
                    child: const Center(
                      child: Text.rich(TextSpan(children: [
                        TextSpan(text: " Do You Have An Account ? "),
                        TextSpan(
                          text: "Login",
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
          ],
        ),
      ),
    );
  }
}
