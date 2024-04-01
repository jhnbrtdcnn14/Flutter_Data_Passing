import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_bloc.dart';
import '../bloc/register_state.dart';
import '/src/colors.dart';
import '/src/textfield.dart';
import '/src/text.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(),
        child: Scaffold(
          backgroundColor: AppColors.darkgrey,
          body: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is NavigateToLoginState)
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Center(
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 50),
                          //logo
                          Container(
                            width: 500, // Replace with desired width
                            height: 200, // Replace with desired height
                            child: Image.asset('assets/logo.png'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // login or sign up
                          const AppText(
                            text: 'Login or Sign up with Renew',
                            size: 20,
                            color: AppColors.white,
                            isBold: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const AppText(
                            text:
                                'Use your email or another service to continue',
                            size: 14,
                            color: AppColors.offwhite,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // username
                          ImageWithTextField(
                            imagePath:
                                'assets/google.png', // Replace with actual image path
                            text: 'Continue with Google',
                            onChanged: (value) {
                              // Add your onChanged logic here
                            },
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          // password
                          ImageWithTextField(
                            imagePath:
                                'assets/fb.png', // Replace with actual image path
                            text: 'Continue with Facebook',
                            onChanged: (value) {
                              // Add your onChanged logic here
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //Login button
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      print('Continue with Email clicked');
                                      BlocProvider.of<RegisterBloc>(context)
                                          .add(NavigateToLoginEvent());
                                    }, // Placeholder: add your onPressed action
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // Set the border radius here
                                      ),
                                      backgroundColor: AppColors
                                          .lightgreen, // Button background color
                                      foregroundColor:
                                          AppColors.darkgrey, // Text color
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 20),
                                      elevation:
                                          5.0, // Optional: Add a slight elevation
                                    ),
                                    child: const Text(
                                      'Continue with Email',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: AppText(
                                    text:
                                        'By continuing you agree to Renew\'s Terms of Use. Read our Privacy Policy',
                                    size: 14,
                                    color: AppColors.lightgreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
