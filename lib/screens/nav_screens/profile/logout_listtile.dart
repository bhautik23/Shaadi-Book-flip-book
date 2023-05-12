import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/main.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';
import 'package:shaadi_book/screens/auth_screens/auth_common.dart';

import '../../../my_app_config/app_font_family.dart';

class LogoutListTile extends StatefulWidget {
  const LogoutListTile({super.key});

  @override
  State<LogoutListTile> createState() => _LogoutListTileState();
}

class _LogoutListTileState extends State<LogoutListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 6.0,
      title: Text(
        'Log Out',
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
          color: AppColorConstant.redColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SvgPicture.asset("assets/svg/exit.svg"),
      ),
      contentPadding: const EdgeInsets.only(
        top: 0.0,
        right: 32.0,
        bottom: 0.0,
        left: 24.0,
      ),
      onTap: () {
        dataStorage.remove('login_token');
        setState(() {});
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const AuthCommon(),
          ),
        );
      },
    );
  }
}
