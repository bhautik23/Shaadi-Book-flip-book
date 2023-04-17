import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';
import 'package:shaadi_book/screens/get_started/get_started_third.dart';

class GetStartedSecond extends StatefulWidget {
  const GetStartedSecond({super.key});

  @override
  State<GetStartedSecond> createState() => _GetStartedSecondState();
}

class _GetStartedSecondState extends State<GetStartedSecond> {
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
                  image: AssetImage('assets/images/get_started_second.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //   // gradient: LinearGradient(
                //   //   begin: Alignment.topCenter,
                //   //   end: Alignment.bottomCenter,
                //   //   colors: [
                //   //     AppColorConstant.primaryColor.withOpacity(0.2),
                //   //     AppColorConstant.primaryColorDeep.withOpacity(0.2),
                //   //     const Color(0xff1C1C1E).withOpacity(0.0),
                //   //     const Color(0xff1C1C1E).withOpacity(1.0),
                //   //   ],
                //   // ),
                // ),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Cherish Your Wedding",
                            style: TextStyle(
                              fontFamily: dMSerifDisplay,
                              fontSize: AppFontSizeConstant.fontSize24 + 4.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          right: 80.0,
                        ),
                        child: Text(
                          "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
                          style: TextStyle(
                            fontFamily: montserrat,
                            fontSize: AppFontSizeConstant.fontSize14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          children: [
                            Container(
                              height: 8.0,
                              width: 8.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            const SizedBox(width: 6.0),
                            Container(
                              height: 8.0,
                              width: 16.0,
                              decoration: BoxDecoration(
                                color: AppColorConstant.primaryColor,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            const SizedBox(width: 6.0),
                            Container(
                              height: 8.0,
                              width: 8.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const GetStartedThird(),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                                'assets/svg/get_started_next_btn.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
