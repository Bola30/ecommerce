import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_test/comp/buttons.dart';
import 'package:first_test/comp/logo.dart';
import 'package:first_test/comp/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> fs = GlobalKey<FormState>();

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamedAndRemoveUntil("homepage", (route) => false);
  }

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
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 1000,
                    child: InkWell(
                      onTap: () async {
                        if (email.text.isEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            title: 'Warning',
                            desc: 'Enter An Email First!',
                          ).show();
                          return;
                        }
                        try {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email.text);
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: 'Done',
                            desc:
                                'Your password reset has been sent to your email',
                          ).show();
                        } catch (e) {
                          if (e is FirebaseAuthException) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              title: 'Error',
                              desc: 'Something went wrong!',
                            ).show();
                          } else {
                            print('Unknown error: $e');
                          }
                        }
                      },
                      child: const Text(
                        "Forgot Password ?",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Button(
                      title: "Login",
                      onPressed: () async {
                        if (fs.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email.text, password: password.text);
                            if (credential.user!.emailVerified) {
                              Navigator.of(context)
                                  .pushReplacementNamed("homepage");
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'Please check Your email.',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == e.code) {
                              print('No user found for that email.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'No user found for that email.',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'Wrong password provided for that user.',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            }
                          }
                        } else {
                          print("Not Valid");
                        }
                      },
                    ),
                  ),
                  Center(
                    child: MaterialButton(
                      minWidth: 400,
                      color: Colors.red,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      onPressed: () {
                        signInWithGoogle();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Login With Google",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(width: 10),
                          Image.network(
                              height: 30,
                              width: 30,
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmZge2e2AYnFEbomhIBykGJZLCIIgSIiF3GA&s")
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          ();
                        },
                        icon: const Icon(Icons.facebook,
                            color: Colors.blue, size: 50),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.apple_outlined, size: 50),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed("signup");
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
          ],
        ),
      ),
    );
  }
}
