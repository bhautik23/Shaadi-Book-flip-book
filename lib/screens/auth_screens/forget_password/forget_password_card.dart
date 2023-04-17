import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';
import 'package:shaadi_book/screens/auth_screens/forget_password/masking_dot.dart';

class ForgetPasswordCard extends StatefulWidget {
  final bool isMobile;
  final String masking;
  const ForgetPasswordCard(
      {super.key, required this.isMobile, required this.masking});

  @override
  State<ForgetPasswordCard> createState() => _ForgetPasswordCardState();
}

class _ForgetPasswordCardState extends State<ForgetPasswordCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(widget.isMobile
                ? 'assets/svg/chat.svg'
                : 'assets/svg/email.svg'),
            const SizedBox(width: 18.0),
            // sms or email
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    widget.isMobile ? 'Via sms:' : 'Via email:',
                    style: TextStyle(
                      fontFamily: kantumruy,
                      color: AppColorConstant.labelColor,
                      fontSize: AppFontSizeConstant.fontSize16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // mobile or email
                  Row(
                    children: [
                      const MaskingDot(),
                      // masking number
                      Text(
                        widget.masking,
                        style: TextStyle(
                          fontFamily: kantumruy,
                          color: AppColorConstant.fontColor,
                          fontSize: AppFontSizeConstant.fontSize16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
