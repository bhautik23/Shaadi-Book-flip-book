import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';
import 'package:shaadi_book/screens/auth_screens/login.dart';

class AlertScreen extends StatefulWidget {
  final String title;
  final String mssg;
  const AlertScreen({super.key, required this.title, required this.mssg});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 40.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/alert_tick.svg'),
                    const SizedBox(height: 22.0),
                    // Title
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontFamily: kantumruy,
                        color: AppColorConstant.primaryColor,
                        fontSize: AppFontSizeConstant.fontSize24 + 6.0,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 22.0),
                    // Message
                    Text(
                      widget.mssg,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: kantumruy,
                        color: AppColorConstant.fontColor,
                        fontSize: AppFontSizeConstant.fontSize18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0,
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
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: const Text('Sign In'),
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
