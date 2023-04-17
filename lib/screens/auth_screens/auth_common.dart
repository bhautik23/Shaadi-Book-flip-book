import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';
import 'package:shaadi_book/screens/auth_screens/login_button.dart';
import 'package:shaadi_book/screens/auth_screens/sign_up_button.dart';

import '../../my_app_config/app_color_constants.dart';

class AuthCommon extends StatefulWidget {
  const AuthCommon({super.key});

  @override
  State<AuthCommon> createState() => _AuthCommonState();
}

class _AuthCommonState extends State<AuthCommon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/auth_common.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [
                  //       AppColorConstant.primaryColor.withOpacity(0.2),
                  //       AppColorConstant.primaryColorDeep.withOpacity(0.2),
                  //       const Color(0xff1C1C1E).withOpacity(0.0),
                  //       const Color(0xff1C1C1E).withOpacity(1.0),
                  //     ],
                  //   ),
                  // ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 16.0, right: 16.0, bottom: 80.0, left: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "LOGO",
                              style: TextStyle(
                                fontFamily: dMSerifDisplay,
                                fontSize: AppFontSizeConstant.fontSize24 + 4.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        // Sign up button
                        const SignUpButton(),
                        // Login button
                        const LoginButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
