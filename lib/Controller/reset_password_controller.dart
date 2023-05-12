import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shaadi_book/main.dart';

import '../screens/utils/alert_screen.dart';

class Resetpassword extends GetxController {
  Dio dio = Dio();
  TextEditingController emailConteroller = TextEditingController();
  TextEditingController passwordConteroller = TextEditingController();
  TextEditingController c_passwordConteroller = TextEditingController();
  Future<void> resetPassword(BuildContext context) async {
    final token = (dataStorage.read('login_token') == null)
        ? 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZWY1MjRhYWRhOTVjMDYzYTExMTRmMzQ0MTRmNmUxOGE2NWQyNDU5N2I5M2E0NGM2YzllODg3ODA4NTUxMTNhNzQyN2RlZGVjNWM3MmEwZGQiLCJpYXQiOjE2ODIwNjA4MTUuMzIwNTM0LCJuYmYiOjE2ODIwNjA4MTUuMzIwNTM3LCJleHAiOjE3MTM2ODMyMTUuMzE5NjA4LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.KGXKdERNCThUQD_CbD9XBv2-P_nInjzjextrT9-XJKtblalcvmpiin0wKySV-kORluFJVQbXWHLmp9RbkdaK2NqGudNSMic7RWOjAz2b4OMOt77VkPNqMpDscfpddqONDrea_FxvSZDuC1OmzdAS71vE7Jx8PuWOmIFFHbNusfFNj9Z03t6DgwK7hE2tv61hde-SkvQWAzxUuuG6l4KWL-Ct6feBjNd0MOdec_juIdfrSbEk1QjTvReXO3zkSHvwh6eSBkvAbrR6wGsI8CSuE05J06gr4FDXIGDtWEMMLPhFL5p8gIlQSNFcpEVJE0QRwyTo0coWwTxp6VewcKwA0gkIDXsjSZ2sE_8nKhtUDKCb-eQ3eCgnzlX6P_o-aDVym2woSJ9kyPSAaC7AcnO1ujL9CEDOjk163RtNa0gUEiElbynpdHzkV3saMfdczG3sn6MmTjCtbluomCD-LLCcrA4jiq9SEJxLiuI9WsCxRSll79rNR3zIU4pZ_coCYRyi1o6sqvIX5YhhGr6c3oQNx5BWOowb2ZeGvXKnJDW5AlcFTL0C7iy_njzeHNx2E9v44pO52q8LEZZlhujAPM-J4Tx6cq-OoSItMdUERTSSnkdWqNnz24zzFvE2tKT_9ssSGotu21rCgPZR8Wsk6mVa-m6NpKGrrzZxkzR1WDI5pjk'
        : dataStorage.read('login_token');
    try {
      print(token);
      print("----->Email$emailConteroller");
      print("----->Pass$passwordConteroller");
      print("----->c_pass$c_passwordConteroller");
      final res = await dio.post(
          'https://epiccodez.com/shaadibook/api/reset-password',
          options: Options(headers: {"Authorization": "Bearer $token"}),
          data: {
            "email": emailConteroller.text,
            "password": passwordConteroller.text,
            "c_password": c_passwordConteroller.text
          },
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const AlertScreen(
              title: 'Congrats!',
              mssg: 'Password Reset Successful',
            ),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
