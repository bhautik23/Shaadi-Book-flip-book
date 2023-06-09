import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';
import 'package:shaadi_book/screens/auth_screens/custom_form_text_field/confirm_password_field.dart';
import 'package:shaadi_book/screens/auth_screens/custom_form_text_field/password_field.dart';
import 'package:shaadi_book/screens/utils/alert_screen.dart';
import 'package:shaadi_book/screens/utils/custom_back_button.dart';

import '../../../Controller/reset_password_controller.dart';
import '../custom_form_text_field/email_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final resetpassword = Get.put(Resetpassword());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConstant.scaffoldColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
              top: 24.0, left: 24.0, right: 24.0, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // back button
                    const CustomBackButton(),
                    const SizedBox(height: 24.0),
                    // Title
                    Text(
                      'Reset your password here',
                      style: TextStyle(
                        fontFamily: kantumruy,
                        color: AppColorConstant.fontColor,
                        fontSize: AppFontSizeConstant.fontSize18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                      ),
                    ),
                    // sub Title
                    Text(
                      'Select which contact details should we use to reset your password',
                      style: TextStyle(
                        fontFamily: kantumruy,
                        color: AppColorConstant.fontColor,
                        fontSize: AppFontSizeConstant.fontSize14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    // Email Number Field
                    EmailTextField(
                        emailController: resetpassword.emailConteroller),
                    const SizedBox(height: 24.0),
                    // New PAssword
                    PasswordField(
                      passwordController: resetpassword.passwordConteroller,
                      hint: 'New Password',
                    ),
                    const SizedBox(height: 18.0),
                    // Confirm PAssword
                    ConfirmPasswordField(
                      confPasswordController:
                          resetpassword.c_passwordConteroller,
                      hint: 'Confirm Password',
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      resetpassword.resetPassword(context);
                    },
                    child: const Text('Next'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
