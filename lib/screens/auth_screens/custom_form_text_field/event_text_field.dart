import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';

class EventTextField extends StatelessWidget {
  const EventTextField({
    Key? key,
    required TextEditingController eventController,
  })  : _eventController = eventController,
        super(key: key);

  final TextEditingController _eventController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: _eventController,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: kantumruy,
        color: AppColorConstant.primaryColor,
        fontSize: AppFontSizeConstant.fontSize16,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: 'Event Id',
        prefixIcon: Align(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: SvgPicture.asset(
            'assets/svg/event.svg',
          ),
        ),
        hintStyle: TextStyle(
          fontFamily: kantumruy,
          color: AppColorConstant.primaryColor,
          fontSize: AppFontSizeConstant.fontSize16,
          fontWeight: FontWeight.w400,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorConstant.formBorderColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFD8000C),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorConstant.primaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFD8000C),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Doctor Name";
        }
        return null;
      },
    );
  }
}
