import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/screens/event_screens/event_item.dart';
import 'package:shaadi_book/screens/event_screens/event_video_and_album.dart';
import 'package:shaadi_book/screens/utils/custom_back_button.dart';

import '../../my_app_config/app_font_size_constants.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final _eventList = [
    {
      "event": "Ring Ceremony",
      "image": "assets/images/Frame.png",
    },
    {
      "event": "Marriage Anniversary",
      "image": "assets/images/Frame-2.png",
    },
    {
      "event": "Birthday Party",
      "image": "assets/images/Frame-3.png",
    },
    {
      "event": "Birthday Party",
      "image": "assets/images/Frame-4.png",
    },
    {
      "event": "Album",
      "image": "assets/images/Frame-2.png",
    },
    {
      "event": "Engagement",
      "image": "assets/images/Frame-2.png",
    },
    {
      "event": "Ganesh Sthapna",
      "image": "assets/images/Frame-2.png",
    },
    {
      "event": "Haldi",
      "image": "assets/images/Frame-2.png",
    },
    {
      "event": "Grah shanti",
      "image": "assets/images/Frame-2.png",
    },
    {
      "event": "Sangeet",
      "image": "assets/images/Frame-2.png",
    },
    {
      "event": "Marriage",
      "image": "assets/images/Frame-2.png",
    },
    {
      "event": "Reception",
      "image": "assets/images/Frame-2.png",
    },
  ];
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
                      'Abhishek & Kiran',
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
              const SizedBox(height: 20.0),
              // Event List
              Expanded(
                child: ListView.builder(
                  itemCount: _eventList.length,
                  itemBuilder: (context, index) {
                    return EventItem(
                      event: _eventList[index]["event"]!,
                      image: _eventList[index]["image"]!,
                    );
                  },
                ),
              ),
              // // Image card 1
              // _buildImageCardOne(context),
              // const SizedBox(height: 14.0),
              // _buildImageCardTwo(context),
              // const SizedBox(height: 14.0),
              // _buildImageCardThird(context),
              // const SizedBox(height: 14.0),
              // _buildImageCardFourth(context),
            ],
          ),
        ),
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
              builder: (context) => const EventVideoAndAlbum(),
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
                            'Ring Ceremony',
                            style: TextStyle(
                              fontFamily: dMSerifDisplay,
                              color: Colors.white,
                              fontSize: AppFontSizeConstant.fontSize18,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
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
          image: AssetImage('assets/images/Frame-2.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   CupertinoPageRoute(
          //     builder: (context) => const EventScreen(),
          //   ),
          // );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColorConstant.primaryColor.withOpacity(0.2),
                AppColorConstant.primaryColorDeep.withOpacity(0.2),
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
                            'Marriage Anniversary',
                            style: TextStyle(
                              fontFamily: dMSerifDisplay,
                              color: Colors.white,
                              fontSize: AppFontSizeConstant.fontSize18,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
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

  Container _buildImageCardThird(BuildContext context) {
    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Frame-3.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   CupertinoPageRoute(
          //     builder: (context) => const EventScreen(),
          //   ),
          // );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // end: Alignment(0,10),
              colors: [
                AppColorConstant.primaryColor.withOpacity(0.2),
                AppColorConstant.primaryColorDeep.withOpacity(0.2),
                const Color(0xff1C1C1E).withOpacity(0.0),
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
                            'Birthday Party',
                            style: TextStyle(
                              fontFamily: dMSerifDisplay,
                              color: Colors.white,
                              fontSize: AppFontSizeConstant.fontSize18,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
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

  Container _buildImageCardFourth(BuildContext context) {
    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Frame-4.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   CupertinoPageRoute(
          //     builder: (context) => const EventScreen(),
          //   ),
          // );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColorConstant.primaryColor.withOpacity(0.2),
                AppColorConstant.primaryColorDeep.withOpacity(0.2),
                const Color(0xff1C1C1E).withOpacity(0.0),
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
                            'Birthday Party',
                            style: TextStyle(
                              fontFamily: dMSerifDisplay,
                              color: Colors.white,
                              fontSize: AppFontSizeConstant.fontSize18,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
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
