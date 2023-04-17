import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';

class SocialFbAndGoogleCard extends StatelessWidget {
  const SocialFbAndGoogleCard({
    Key? key,
    required String icon,
    required String title,
  })  : _icon = icon,
        _title = title,
        super(key: key);

  final String _icon;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color: AppColorConstant.formBorderColor,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              _icon,
            ),
            // const SizedBox(width: 12.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Text(
                  _title,
                  style: TextStyle(
                    fontFamily: kantumruy,
                    color: AppColorConstant.fontColor,
                    fontSize: AppFontSizeConstant.fontSize16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.0,
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
