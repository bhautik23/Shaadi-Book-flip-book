import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shaadi_book/screens/nav_screens/favorite_screens/favorite_grid.dart';

import '../../../my_app_config/app_color_constants.dart';
import '../../../my_app_config/app_font_family.dart';
import '../../../my_app_config/app_font_size_constants.dart';
import '../../event_screens/album_grid.dart';
import '../../utils/custom_back_button.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
              top: 20.0, right: 24.0, bottom: 4.0, left: 24.0),
          child: Column(
            children: [
              // app bar
              Row(
                children: [
                  // back button
                  const CustomBackButton(),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Favorite List',
                      style: TextStyle(
                        fontFamily: dMSerifDisplay,
                        color: AppColorConstant.fontColor,
                        fontSize: AppFontSizeConstant.fontSize22,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              // Album grid
              const Expanded(
                child: FavoriteGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
