import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';
import 'package:shaadi_book/screens/auth_screens/custom_form_text_field/phonenumber_text_field.dart';
import 'package:shaadi_book/screens/utils/custom_back_button.dart';

import '../../Controller/forget_password_controller.dart';

class PhoneNumberForget extends StatefulWidget {
  const PhoneNumberForget({super.key});

  @override
  State<PhoneNumberForget> createState() => _PhoneNumberForgetState();
}

class _PhoneNumberForgetState extends State<PhoneNumberForget> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  var phonenumberController = TextEditingController();

  final forgetpassword = Get.put(ForgetpasswordController());

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
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
                      'Enter 10-digit mobile number',
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
                      'Code send to +91 12345**** .\n',
                      style: TextStyle(
                        fontFamily: kantumruy,
                        color: AppColorConstant.fontColor,
                        fontSize: AppFontSizeConstant.fontSize14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 34.0),
                    // Phone Number Field
                    PhonenumberTextFiled(
                      phonenumberController: forgetpassword.phoneController,
                      colors: Color(0xffB1B9C6),
                    ),
                    // MaterialButton(
                    //   onPressed: () async {
                    //     firebaseService.sendOtp(
                    //         phonenumberController: phonenumberController.text);
                    //   },
                    //   child: Text("Send OTP"),
                    //   color: Colors.deepPurple.withOpacity(.9),
                    //   elevation: 0,
                    // ),
                    const SizedBox(height: 34.0),
                    // Otp Field
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      forgetpassword.forgetPhonePassword(context);
                      // firebaseService.verifiyOtp(context, controller.text);
                      // Navigator.push(
                      //   context,
                      //   CupertinoPageRoute(
                      //     builder: (context) => const ResetPassword(),
                      //   ),
                      // );
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
