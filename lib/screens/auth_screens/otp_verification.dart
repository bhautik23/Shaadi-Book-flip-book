import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shaadi_book/Service/Firebase_serivce.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';
import 'package:shaadi_book/screens/auth_screens/custom_form_text_field/phonenumber_text_field.dart';
import 'package:shaadi_book/screens/utils/custom_back_button.dart';

class OtpVerification extends StatefulWidget {
  TextEditingController? controller;
  OtpVerification({super.key, this.controller});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  var phonenumberController = TextEditingController();
  final firebaseService = Get.put(FirebaseService());

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    firebaseService.sendOtp(phonenumberController: widget.controller);
    super.initState();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      // width: 60,
      height: 64,
      textStyle: TextStyle(
        fontFamily: montserrat,
        fontSize: AppFontSizeConstant.fontSize22,
        color: AppColorConstant.primaryColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
    );

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
                      'Enter 6-digit Verification code',
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
                      'Code send to +91 12345**** .\nThis code will expired in 01:30',
                      style: TextStyle(
                        fontFamily: kantumruy,
                        color: AppColorConstant.fontColor,
                        fontSize: AppFontSizeConstant.fontSize14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 34.0),
                    // Phone Number Field
                    // PhonenumberTextFiled(
                    //   phonenumberController: phonenumberController,
                    //   colors: Color(0xffB1B9C6),
                    // ),
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
                    Center(
                      child: Container(
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(22.0),
                          border: Border.all(
                            color: const Color(0xffB1B9C6),
                          ),
                        ),
                        child: Pinput(
                          length: 6,
                          controller: controller,
                          focusNode: focusNode,
                          separator: Container(
                            height: 64,
                            width: 1,
                            color: const Color(0xffB1B9C6),
                          ),
                          defaultPinTheme: defaultPinTheme,
                          showCursor: true,
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
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
                      firebaseService.verifiyOtp(context, controller);
                      // Navigator.push(
                      //   context,4
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
