import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/home/home.dart';

class FirebaseService extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationID = "";

  ///Send Otp Function

  Future<void> sendOtp({TextEditingController? phonenumberController}) async {
    try {
      print("Phone==${phonenumberController.toString()}");
      await auth.verifyPhoneNumber(
        phoneNumber: "+91${phonenumberController!.text}",
        timeout: Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          verificationID = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("---->$verificationID");
        },
      );
    } catch (e) {
      log("--${e.toString()}");
    }
  }

  /// Otp Verification Function

  Future<void> verifiyOtp(
      BuildContext context, TextEditingController verificationOtp) async {
    final _cred = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: verificationOtp.text);
    final user = await auth.signInWithCredential(_cred);
    if (user.user != null) {
      print("User:-${user.user}");
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => Home(),
        ),
      );
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
