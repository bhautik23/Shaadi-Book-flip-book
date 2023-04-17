import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';

import '../../my_app_config/app_color_constants.dart';
import '../../my_app_config/app_font_family.dart';

class GetStartedItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final int selectedIndex;
  const GetStartedItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.selectedIndex,
      required this.imagePath});

  @override
  State<GetStartedItem> createState() => _GetStartedItemState();
}

class _GetStartedItemState extends State<GetStartedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
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
                //   //     const Color(0xff7B2991).withOpacity(0.3),
                //   //     AppColorConstant.primaryColorDeep.withOpacity(0.4),
                //   //     const Color(0xff1C1C1E).withOpacity(0.8),
                //   //     const Color(0xff1C1C1E).withOpacity(1.0),
                //   //   ],
                //   // ),
                // ),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 16.0, right: 16.0, bottom: 70.0, left: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.title,
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
                          widget.subTitle,
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
                              width: widget.selectedIndex == 0 ? 16.0 : 8.0,
                              decoration: BoxDecoration(
                                color: widget.selectedIndex == 0
                                    ? AppColorConstant.primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            const SizedBox(width: 6.0),
                            Container(
                              height: 8.0,
                              width: widget.selectedIndex == 1 ? 16.0 : 8.0,
                              decoration: BoxDecoration(
                                color: widget.selectedIndex == 1
                                    ? AppColorConstant.primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            const SizedBox(width: 6.0),
                            Container(
                              height: 8.0,
                              width: widget.selectedIndex == 2 ? 16.0 : 8.0,
                              decoration: BoxDecoration(
                                color: widget.selectedIndex == 2
                                    ? AppColorConstant.primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
