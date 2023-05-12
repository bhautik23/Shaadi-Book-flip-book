import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../screens/auth_screens/login.dart';
import '../screens/utils/alert_screen.dart';

class RegisterControllerApi extends GetxController {
  Dio dio = Dio();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController c_passwrodController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();

  Future<void> registerProvider(BuildContext context) async {
    final res =
        await dio.post('https://shaadibook.epiccodez.com/api/register', data: {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'c_password': passwordController.text,
      'phone': mobilenumberController.text
    });
    if (res.statusCode == 200) {
      print(dataStorage.write("register_token", res.data['data']['token']));
      print("==============?${dataStorage.read('login_token')}");
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const AlertScreen(
            title: 'Congratulation',
            mssg: 'You have signed Up\nsuccessfully.',
          ),
        ),
      );
    }
  }
}
