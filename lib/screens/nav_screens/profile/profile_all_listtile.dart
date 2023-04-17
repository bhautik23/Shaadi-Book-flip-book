import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';

import '../../../my_app_config/app_font_family.dart';

class ProfileAllListTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final Widget? routeWidget;
  const ProfileAllListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.routeWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 6.0,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: kantumruy,
          color: Colors.black,
          fontSize: AppFontSizeConstant.fontSize16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
      ),
      leading: Container(
        width: 28.0,
        height: 28.0,
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: AppColorConstant.primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: icon,
      ),
      trailing: SvgPicture.asset("assets/svg/right_arrow.svg"),
      contentPadding: const EdgeInsets.only(
        top: 0.0,
        right: 32.0,
        bottom: 0.0,
        left: 24.0,
      ),
      onTap: () {},
    );
  }
}
