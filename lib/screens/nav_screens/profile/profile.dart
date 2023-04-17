import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/screens/nav_screens/profile/logout_listtile.dart';
import 'package:shaadi_book/screens/nav_screens/profile/profile_all_listtile.dart';

import '../../../my_app_config/app_color_constants.dart';
import '../../../my_app_config/app_font_size_constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60.0, bottom: 4.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // avatar
              Container(
                child: Image.asset("assets/images/user.png"),
              ),
              const SizedBox(height: 10.0),
              // User name
              Text(
                'Carla Rosser',
                style: TextStyle(
                  fontFamily: montserrat,
                  color: Colors.black,
                  fontSize: AppFontSizeConstant.fontSize18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 12.0),
              // User name
              Text(
                'carlarosser23@gmail.com',
                style: TextStyle(
                  fontFamily: montserrat,
                  color: AppColorConstant.greyLabelColor,
                  fontSize: AppFontSizeConstant.fontSize16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 30.0),
              ProfileAllListTile(
                title: "Edit Profile",
                icon: SvgPicture.asset("assets/svg/profile.svg"),
              ),
              ProfileAllListTile(
                title: "Change Password",
                icon: SvgPicture.asset("assets/svg/un_lock.svg"),
              ),
              const SizedBox(height: 20.0),
              ProfileAllListTile(
                title: "FAQs",
                icon: SvgPicture.asset("assets/svg/faqs.svg"),
              ),
              ProfileAllListTile(
                title: "Policy",
                icon: SvgPicture.asset("assets/svg/policy.svg"),
              ),
              ProfileAllListTile(
                title: "Share Feedback",
                icon: SvgPicture.asset("assets/svg/feedback.svg"),
              ),
              ProfileAllListTile(
                title: "Contact Us",
                icon: SvgPicture.asset("assets/svg/call.svg"),
              ),
              const SizedBox(height: 20.0),
              const LogoutListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
