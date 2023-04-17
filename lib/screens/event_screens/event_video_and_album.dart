import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/screens/event_screens/album.dart';
import 'package:shaadi_book/screens/utils/custom_back_button.dart';

import '../../my_app_config/app_color_constants.dart';
import '../../my_app_config/app_font_family.dart';
import '../../my_app_config/app_font_size_constants.dart';

class EventVideoAndAlbum extends StatefulWidget {
  const EventVideoAndAlbum({super.key});

  @override
  State<EventVideoAndAlbum> createState() => _EventVideoAndAlbumState();
}

class _EventVideoAndAlbumState extends State<EventVideoAndAlbum> {
  Future<void> _flipBook() async {
    // platform.send(_pong);
    const platform = MethodChannel("mycall");
    // var result = await platform.invokeMethod("mycall", {"text": "Mostak"});
  }

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
                      'Engagement',
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
              const SizedBox(height: 24.0),
              // video title
              Text(
                'Photo Gallery',
                style: TextStyle(
                  fontFamily: kantumruy,
                  color: AppColorConstant.fontColor,
                  fontSize: AppFontSizeConstant.fontSize18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 12.0),
              _buildImageCardOne(context),
              const SizedBox(height: 24.0),
              // album title
              Text(
                'Album',
                style: TextStyle(
                  fontFamily: kantumruy,
                  color: AppColorConstant.fontColor,
                  fontSize: AppFontSizeConstant.fontSize18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 12.0),
              _buildImageCardTwo(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.white,
        elevation: 4.0,
        child: SvgPicture.asset('assets/svg/scanner.svg'),
      ),
    );
  }

  Container _buildImageCardOne(BuildContext context) {
    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Frame.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const Album(),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColorConstant.primaryColor.withOpacity(0.2),
                AppColorConstant.primaryColorDeep.withOpacity(0.20),
                const Color(0xff1C1C1E).withOpacity(0.2),
                const Color(0xff1C1C1E).withOpacity(1.0),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // share icon
                Container(
                  width: 28.0,
                  height: 28.0,
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColorConstant.formBorderColor,
                  ),
                  child: SvgPicture.asset('assets/svg/linear_share.svg'),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 110.0,
                          child: Text(
                            'Engagement',
                            style: TextStyle(
                              fontFamily: dMSerifDisplay,
                              color: Colors.white,
                              fontSize: AppFontSizeConstant.fontSize18,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        Text(
                          '4 videos',
                          style: TextStyle(
                            fontFamily: kantumruy,
                            color: const Color(0xff9EA1AB),
                            fontSize: AppFontSizeConstant.fontSize14 - 2.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildImageCardTwo(BuildContext context) {
    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Frame.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: InkWell(
        onTap: () {
          _flipBook();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColorConstant.primaryColor.withOpacity(0.2),
                AppColorConstant.primaryColorDeep.withOpacity(0.20),
                const Color(0xff1C1C1E).withOpacity(0.2),
                const Color(0xff1C1C1E).withOpacity(1.0),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // share icon
                Container(
                  width: 28.0,
                  height: 28.0,
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColorConstant.formBorderColor,
                  ),
                  child: SvgPicture.asset('assets/svg/linear_share.svg'),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 110.0,
                          child: Text(
                            'Engagement',
                            style: TextStyle(
                              fontFamily: dMSerifDisplay,
                              color: Colors.white,
                              fontSize: AppFontSizeConstant.fontSize18,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        Text(
                          '30 Photos',
                          style: TextStyle(
                            fontFamily: kantumruy,
                            color: const Color(0xff9EA1AB),
                            fontSize: AppFontSizeConstant.fontSize14 - 2.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
