import 'package:flutter/material.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    // end: Alignment.bottomCenter,
                    colors: [
                      AppColorConstant.primaryColor,
                      AppColorConstant.primaryColorDeep,
                    ],
                  ),
                ),
                child: Center(
                  // child: Text(
                  //   "LOGO",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: AppFontSizeConstant.fontSize18,
                  //   ),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0),
                    child: Image.asset('assets/images/logo.png'),
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
