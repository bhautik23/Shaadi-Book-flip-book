import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/screens/auth_screens/sign_up.dart';

import '../../my_app_config/app_color_constants.dart';
import '../../my_app_config/app_font_size_constants.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      height: 52.0,
      child: Card(
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const SignUp(),
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
                'Sign Up',
                style: TextStyle(
                  fontFamily: kantumruy,
                  color: AppColorConstant.primaryColor,
                  fontSize: AppFontSizeConstant.fontSize16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
