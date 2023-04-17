import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaadi_book/screens/auth_screens/custom_form_text_field/email_text_field.dart';
import 'package:shaadi_book/screens/auth_screens/custom_form_text_field/password_field.dart';
import 'package:shaadi_book/screens/auth_screens/forget_password/forget_password.dart';
import 'package:shaadi_book/screens/auth_screens/sign_up.dart';
import 'package:shaadi_book/screens/auth_screens/social_fb_and_google_card.dart';
import 'package:shaadi_book/screens/home/home.dart';

import '../../my_app_config/app_color_constants.dart';
import '../../my_app_config/app_font_family.dart';
import '../../my_app_config/app_font_size_constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/auth_common.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColorConstant.primaryColor.withOpacity(0.2),
                            AppColorConstant.primaryColorDeep.withOpacity(0.2),
                            const Color(0xff1C1C1E).withOpacity(0.0),
                            const Color(0xff1C1C1E).withOpacity(1.0),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 24.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(90.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Login To Your Account',
                                      style: TextStyle(
                                        fontFamily: kantumruy,
                                        color: AppColorConstant.primaryColor,
                                        fontSize:
                                            AppFontSizeConstant.fontSize18,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    // Email field
                                    EmailTextField(
                                      emailController: _emailController,
                                    ),
                                    const SizedBox(height: 12.0),
                                    // Password field
                                    PasswordField(
                                      passwordController: _passwordController,
                                      hint: 'Password',
                                    ),
                                    const SizedBox(height: 24.0),
                                    // Label
                                    Text(
                                      'Or Continue With',
                                      style: TextStyle(
                                        fontFamily: kantumruy,
                                        color: AppColorConstant.labelColor,
                                        fontSize:
                                            AppFontSizeConstant.fontSize14,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    // Social login option
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Expanded(
                                          child: SocialFbAndGoogleCard(
                                            icon: 'assets/svg/fb.svg',
                                            title: 'Facebook',
                                          ),
                                        ),
                                        SizedBox(width: 20.0),
                                        Expanded(
                                          child: SocialFbAndGoogleCard(
                                            icon: 'assets/svg/google.svg',
                                            title: 'Google',
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Forget password?
                                    const SizedBox(height: 24.0),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                const ForgetPassword(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Forgot Your Password?',
                                        style: TextStyle(
                                          fontFamily: kantumruy,
                                          color: const Color(0xff9EA1AB),
                                          fontSize:
                                              AppFontSizeConstant.fontSize14,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.0,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    // login button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  const Home(),
                                            ),
                                          );
                                        },
                                        child: const Text('Next'),
                                      ),
                                    ),
                                    // create an account?
                                    const SizedBox(height: 20.0),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                const SignUp(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Create an account?',
                                        style: TextStyle(
                                          fontFamily: kantumruy,
                                          color: const Color(0xff9EA1AB),
                                          fontSize:
                                              AppFontSizeConstant.fontSize14,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.0,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
