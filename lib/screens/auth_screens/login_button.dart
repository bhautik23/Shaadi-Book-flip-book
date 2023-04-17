import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/screens/auth_screens/login.dart';

import '../../my_app_config/app_color_constants.dart';
import '../../my_app_config/app_font_size_constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      height: 52.0,
      child: Card(
        elevation: 0.0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
          side: BorderSide(
            color: AppColorConstant.primaryColor,
            width: 2.0,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: kantumruy,
                  color: Colors.white,
                  fontSize: AppFontSizeConstant.fontSize16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
