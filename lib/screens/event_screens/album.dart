import 'package:flutter/material.dart';
import 'package:shaadi_book/screens/event_screens/album_grid.dart';
import 'package:shaadi_book/screens/utils/custom_back_button.dart';

import '../../my_app_config/app_color_constants.dart';
import '../../my_app_config/app_font_family.dart';
import '../../my_app_config/app_font_size_constants.dart';

class Album extends StatefulWidget {
  const Album({super.key});

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
              top: 20.0, right: 24.0, bottom: 4.0, left: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // app bar
              Row(
                children: [
                  // back button
                  const CustomBackButton(),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Album',
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
                child: AlbumGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
