import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../my_app_config/app_color_constants.dart';
import '../../../my_app_config/app_font_family.dart';
import '../../../my_app_config/app_font_size_constants.dart';

class PhonenumberTextFiled extends StatelessWidget {
  var function;
  final Color? colors;
  TextEditingController phonenumberController;
  PhonenumberTextFiled(
      {Key? key,
      this.function,
      required this.phonenumberController,
      this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onChanged: function,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10)
        ],
        autofocus: false,
        controller: phonenumberController,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: kantumruy,
          color: AppColorConstant.primaryColor,
          fontSize: AppFontSizeConstant.fontSize16,
        ),
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: 'Phone',
            prefixIcon: Align(
              heightFactor: 1.0,
              widthFactor: 1.0,
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Color(0xff7A2A91),
                    Color(0xff7A2A91).withOpacity(.6)
                  ],
                  tileMode: TileMode.clamp,
                ).createShader(bounds),
                child: Icon(
                  CupertinoIcons.phone,
                  color: Colors.white,
                ),
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
                color:colors!,
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
            return "Please Enter Phone Number";
          }
          return null;
        },
      ),
    );
  }
}
