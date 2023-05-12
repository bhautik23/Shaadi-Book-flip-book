import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../screens/home/home.dart';

class LoginControllerApi extends GetxController {
  Dio dio = Dio();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginProvider(BuildContext context) async {
    try {
      final res = await dio.post(
        'https://epiccodez.com/shaadibook/api/login',
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      if (res.statusCode == 200) {
        print(dataStorage.write("login_token", res.data['data']['token']));
        print("==============?${dataStorage.read('login_token')}");
        Navigator.push(context, CupertinoPageRoute(
            builder: (context) => Home(name: res.data['data']['name']),
          ),
        ).whenComplete(() {
          if (res.statusCode == 200) {
            emailController.clear();
            passwordController.clear();
          }
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
