import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shaadi_book/main.dart';
import 'package:shaadi_book/screens/auth_screens/otp_verification.dart';

class ForgetpasswordController extends GetxController {
  Dio dio = Dio();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String number = "";
  Future<void> forgetPhonePassword(BuildContext context) async {
    try {
      final res = await dio.post(
        'https://shaadibook.epiccodez.com/api/forget-password',
        data: {"phone": phoneController.text},
      );
      if (res.statusCode == 200) {
        print("Done");
        print("${res.data['data']['phone']}");
        number = res.data['data']['phone'];
        print(number);
        if (number == phoneController.text) {
          Navigator.of(context).push( CupertinoPageRoute(
                  builder: (context) => OtpVerification(controller: phoneController),
                ),
              );
        }
      }
    } catch (e) {
      print("Error:-${e.toString()}");
    }
  }
}
