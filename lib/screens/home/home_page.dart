import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/screens/auth_screens/custom_form_text_field/event_text_field.dart';
import 'package:shaadi_book/screens/event_screens/event_screen.dart';

import '../../Controller/search_event_id_controller.dart';
import '../../my_app_config/app_font_size_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _eventController = TextEditingController();
  final eventShow = Get.put(SearcheventIdController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 0), () => setState(() {}));
    final  photos =    // Image card
    (eventShow.data?.isNotEmpty ?? false) ?int.parse("${eventShow.data?['engagement']}") +
        int.parse("${eventShow.data?['ganesh_sthapana']}") +
        int.parse("${eventShow.data?['grah_shanti']}") +
        int.parse("${eventShow.data?['haldi']}") +
        int.parse("${eventShow.data?['sangeet_sandhya']}") +
        int.parse("${eventShow.data?['wedding']}") +
        int.parse("${eventShow.data?['reception']}") +
        int.parse("${eventShow.data?['album']}") : 0;
    return Container(
      padding: const EdgeInsets.only(
          top: 16.0, right: 24.0, bottom: 4.0, left: 24.0),
      child: Column(
        children: [
          // user name and notification
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // User name
              Text(
                'Hi! ${eventShow.data?['name']}',
                style: TextStyle(
                  fontFamily: dMSerifDisplay,
                  color: AppColorConstant.fontColor,
                  fontSize: AppFontSizeConstant.fontSize22,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.0,
                ),
              ),
              // Notification
              SizedBox(
                width: 60.0,
                height: 60.0,
                child: Card(
                  elevation: 0.0,
                  color: AppColorConstant.formBorderColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset('assets/svg/bell.svg'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          // Event Id
          EventTextField(eventController: _eventController),
          const SizedBox(height: 16.0),
          // Image card
          (eventShow.data?.isNotEmpty ?? false)
              ? Container(
                  height: 150.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: (eventShow.data?['cover_photo'] == null)
                        ? DecorationImage(
                            image: AssetImage('assets/images/Frame.png'),
                            fit: BoxFit.fill,
                          )
                        : DecorationImage(
                            image: NetworkImage(eventShow.data?['cover_photo']),
                            fit: BoxFit.fill,
                          ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>  EventScreen(eventId: eventShow.data),
                        ),
                      );
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
                            AppColorConstant.primaryColorDeep.withOpacity(0.25),
                            const Color(0xff1C1C1E).withOpacity(0.6),
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
                              child: SvgPicture.asset(
                                  'assets/svg/linear_share.svg'),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 110.0,
                                      child: Text(
                                        eventShow.data?['project_name'] ?? "",
                                        style: TextStyle(
                                          fontFamily: dMSerifDisplay,
                                          color: Colors.white,
                                          fontSize:
                                              AppFontSizeConstant.fontSize18,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '$photos Photos',
                                          style: TextStyle(
                                            fontFamily: kantumruy,
                                            color: const Color(0xff9EA1AB),
                                            fontSize:
                                                AppFontSizeConstant.fontSize14 -
                                                    2.0,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                        Text(
                                          '0 videos',
                                          style: TextStyle(
                                            fontFamily: kantumruy,
                                            color: const Color(0xff9EA1AB),
                                            fontSize:
                                                AppFontSizeConstant.fontSize14 -
                                                    2.0,
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
                )
              : Text(
                  "Please enter your event Id",
                  style: TextStyle(
                      color: AppColorConstant.primaryColor,
                      fontFamily: kantumruy,
                      letterSpacing: 0.3),
                ),
        ],
      ),
    );
  }
}
