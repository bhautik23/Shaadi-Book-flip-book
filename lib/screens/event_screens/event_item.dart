import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';
import 'package:shaadi_book/screens/event_screens/event_video_and_album.dart';

class EventItem extends StatefulWidget {
  final String event;
  final String image;
  final int id;
  var eventId;
  // Function onTap;
   EventItem({super.key, required this.event, required this.image,required this.id,required this.eventId,});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 14.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.image),
          fit: BoxFit.fill,
        ),
      ),
      child: InkWell(
        onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) =>  EventVideoAndAlbum(eventId: widget.eventId,Id: widget.id),
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
                  padding: const EdgeInsets.all(4.0),
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
                            widget.event,
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
