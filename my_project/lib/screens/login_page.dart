import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import 'mainscreen.dart';

import '/src/colors.dart';
import '/src/textfield.dart';
import '/src/text.dart';

import 'register_page.dart';

class LoginPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('LoginPage');
    return BlocProvider(
        create: (context) => LoginBloc(),
        child: Center(
          child: Scaffold(
            backgroundColor: AppColors.darkgrey,
            body: BlocListener<LoginBloc, LoginState>(
              // Use BlocListener
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => MainScreen(
                              username: _usernameController.text,
                            )),
                  );
                } else if (state is NavigateToRegister) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                } else if (state is NavigateToLogin) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 50),
                            //logo
                            Container(
                              width: 500, // Replace with desired width
                              height: 200, // Replace with desired height
                              child: Image.asset(
                                  'assets/logo.png'), // Replace with desired image
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
                            // username
                            CustomTextField(
                                hintText: 'Username',
                                controller: _usernameController),
                            const SizedBox(
                              height: 20,
                            ),
                            // password
                            CustomTextField(
                                hintText: 'Password',
                                controller: _passwordController),
                            const SizedBox(height: 20),
                            if (state is LoginLoading)
                              const CircularProgressIndicator(
                                color: AppColors.lightgreen,
                              )
                            else if (state is LoginFailure)
                              Text(
                                state.error,
                                style: const TextStyle(color: AppColors.red),
                              ),
                            const SizedBox(height: 20),
                            //Login button
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        BlocProvider.of<LoginBloc>(context).add(
                                          LoginButtonPressed(
                                              username:
                                                  _usernameController.text,
                                              password:
                                                  _passwordController.text,
                                              context:
                                                  context // Pass context here
                                              ),
                                        );
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
                                        'Login',
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
                            TextButton(
                              onPressed: () {
                                BlocProvider.of<LoginBloc>(context)
                                    .add(LoginNavigateToRegister());
                              },
                              child: AppText(
                                text: 'Continue another way',
                                size: 20,
                                color: AppColors.lightgreen,
                                isBold: true,
                              ),
                            ),
                            SizedBox(height: 30),
                            // don't have an account
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppText(
                                            text: 'Don\'t have an account?',
                                            size: 12,
                                            color: AppColors.offwhite),
                                        // SizedBox(width: 3),
                                        TextButton(
                                            onPressed: () {
                                              BlocProvider.of<LoginBloc>(
                                                      context)
                                                  .add(
                                                      LoginNavigateToRegister());
                                            },
                                            child: AppText(
                                              text: 'Sign up',
                                              size: 14,
                                              color: AppColors.lightgreen,
                                              isBold: true,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AppText(
                                            text: 'Forgot password?',
                                            size: 12,
                                            color: AppColors.offwhite)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
