import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/root_page.dart';
import 'package:plant_app/ui/screens/forgot_password.dart';
import 'package:plant_app/ui/signup_page.dart';
import 'package:plant_app/ui/screens/widgets/custom_textfield.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/signin.png'),
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30),
            CustomTextfield(
              controller: _emailController,
              obscureText: false,
              hintText: 'Enter Email',
              icon: Icons.alternate_email,
            ),
            CustomTextfield(
              controller: _passwordController,
              obscureText: true,
              hintText: 'Enter Password',
              icon: Icons.lock,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                try {
                  final UserCredential user = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());

                  print('UID: ${user.user?.uid}');
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const RootPage(),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                } catch (e) {
                  print('ERROR: ${e}');
                }
                FirebaseFirestore.instance
                    .collection('users')
                    .get()
                    .then((QuerySnapshot querySnapshot) {
                  querySnapshot.docs.forEach((doc) {
                    print(doc["plantName"]);
                  });
                });
                // 0PmC5AUZDTVImCX7Uef3nmdt2gi2
              },
              child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: const Center(
                      child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ))),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const ForgotPassword(),
                        type: PageTransitionType.bottomToTop));
              },
              child: Center(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: 'Forgot Password?',
                        style: TextStyle(
                          color: Constants.blackColor,
                        )),
                    TextSpan(
                        text: 'Reset Here',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        )),
                  ]),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('OR'),
              ),
              Expanded(
                child: Divider(),
              ),
            ]),
            SizedBox(height: 20),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Constants.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 30,
                    child: Image.asset('assets/images/google.png'),
                  ),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const SignUpPage(),
                        type: PageTransitionType.bottomToTop));
              },
              child: Center(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: 'New Planty?',
                        style: TextStyle(
                          color: Constants.blackColor,
                        )),
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
