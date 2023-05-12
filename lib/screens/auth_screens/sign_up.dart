import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';
import 'package:shaadi_book/screens/auth_screens/custom_form_text_field/email_text_field.dart';
import 'package:shaadi_book/screens/auth_screens/custom_form_text_field/password_field.dart';
import 'package:shaadi_book/screens/auth_screens/custom_form_text_field/phonenumber_text_field.dart';
import 'package:shaadi_book/screens/auth_screens/login.dart';
import 'package:shaadi_book/screens/auth_screens/user_name_text_field.dart';

import '../../Controller/register_controller_api.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isChecked = false;

  final register = Get.put(RegisterControllerApi());

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
                        image: AssetImage('assets/images/signup.png'),
                        fit: BoxFit.fitHeight,
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
                                      'Sign Up For Free',
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
                                    // User name
                                    UserNameTextField(
                                      userNameController:
                                          register.nameController,
                                    ),
                                    const SizedBox(height: 12.0),
                                    // Email field
                                    PhonenumberTextFiled(
                                        phonenumberController:register.mobilenumberController,
                                        colors:AppColorConstant.formBorderColor),
                                    const SizedBox(height: 12.0),
                                    // Phone number field
                                    EmailTextField(
                                      emailController: register.emailController,
                                    ),
                                    const SizedBox(height: 12.0),
                                    // Password field
                                    PasswordField(
                                      passwordController:
                                          register.passwordController,
                                      hint: 'Password',
                                    ),
                                    const SizedBox(height: 20.0),
                                    // Remember me
                                    _buildRememberMe(),
                                    const SizedBox(height: 28.0),

                                    // login button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          register.registerProvider(context);
                                        },
                                        child: const Text('Next'),
                                      ),
                                    ),
                                    // create an account?
                                    const SizedBox(height: 20.0),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(),));
                                      },
                                      child: Text(
                                        'Already have an account?',
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

  Row _buildRememberMe() {
    return Row(
      children: [
        Center(
            child: InkWell(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColorConstant.primaryColor,
                  width: 1.5,
                ),
                color:
                    _isChecked ? AppColorConstant.primaryColor : Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: _isChecked
                  ? const Icon(
                      CupertinoIcons.checkmark_alt,
                      size: 16.0,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.check_box_outline_blank,
                      size: 16.0,
                      color: Colors.white,
                    ),
            ),
          ),
        )),
        const SizedBox(width: 12.0),
        Text(
          'Keep Me Signed In',
          style: TextStyle(
            fontFamily: kantumruy,
            color: AppColorConstant.labelColor,
            fontSize: AppFontSizeConstant.fontSize14 - 2.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}
