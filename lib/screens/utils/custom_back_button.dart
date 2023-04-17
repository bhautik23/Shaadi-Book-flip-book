import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColorConstant.primaryColor.withOpacity(0.5),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SvgPicture.asset('assets/svg/left_arrow.svg'),
          ),
        ),
      ),
    );
  }
}
