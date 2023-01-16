import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';

import '../components/custom_text_field.dart';
import '../constants.dart';
import '../models/cart_model.dart';
import '../models/favorites_model.dart';
import '../models/tab_model.dart';
import '../root_page.dart';
import 'forgot_password_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/signin.png",
                height: 300,
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                icon: Icons.email,
                hintText: 'Enter Your E-mail Address',
                obscureText: false,
              ),
              CustomTextField(
                icon: Icons.lock_outlined,
                hintText: 'Enter Your Password',
                obscureText: true,
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: MultiProvider(
                            providers: [
                              ChangeNotifierProvider(create: (context) => TabModel()),
                              ChangeNotifierProvider(create: (context) => CartModel()),
                              ChangeNotifierProvider(create: (context) => FavoritesModel()),
                            ],
                            child: const RootPage(),
                          ),
                          type: PageTransitionType.bottomToTop));
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color:
                    Constants.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: ForgotPassword(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Forgot Password?",
                      style: TextStyle(color: Constants.blackColor),
                    ),
                    TextSpan(
                      text: " Reset Now!",
                      style: TextStyle(color: Constants.primaryColor),
                    ),
                  ])),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Image.asset('assets/images/google.png'),
                    ),
                    Text(
                      'Sign In with Google',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: SignUp(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "New Here?",
                      style: TextStyle(color: Constants.blackColor),
                    ),
                    TextSpan(
                      text: " Register",
                      style: TextStyle(color: Constants.primaryColor),
                    ),
                  ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
