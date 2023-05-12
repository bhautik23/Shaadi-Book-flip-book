import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaadi_book/main.dart';
import 'package:shaadi_book/screens/auth_screens/auth_common.dart';
import 'package:shaadi_book/screens/get_started/get_started_item.dart';
import 'package:shaadi_book/screens/home/home.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: const [
                  GetStartedItem(
                    imagePath: "assets/images/get_started_first.png",
                    title: "Cherish Your Wedding",
                    subTitle:
                        "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
                    selectedIndex: 0,
                  ),
                  GetStartedItem(
                    imagePath: "assets/images/get_started_second.png",
                    title: "Cherish Your Wedding",
                    subTitle:
                        "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
                    selectedIndex: 1,
                  ),
                  GetStartedItem(
                    imagePath: "assets/images/get_started_third.png",
                    title: "Cherish Your Wedding",
                    subTitle:"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
                    selectedIndex: 2,
                  ),
                ],
              ),
              // child: Container(
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/images/get_started_first.png'),
              //       fit: BoxFit.cover,

              //     ),
              //   ),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     // decoration: BoxDecoration(
              //     //   // gradient: LinearGradient(
              //     //   //   begin: Alignment.topCenter,
              //     //   //   end: Alignment.bottomCenter,
              //     //   //   colors: [
              //     //   //     const Color(0xff7B2991).withOpacity(0.3),
              //     //   //     AppColorConstant.primaryColorDeep.withOpacity(0.4),
              //     //   //     const Color(0xff1C1C1E).withOpacity(0.8),
              //     //   //     const Color(0xff1C1C1E).withOpacity(1.0),
              //     //   //   ],
              //     //   // ),
              //     // ),
              //     child: Container(
              //       padding: const EdgeInsets.all(16.0),
              //       child: Column(
              //         mainAxisSize: MainAxisSize.max,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Expanded(
              //             child: Align(
              //               alignment: Alignment.bottomLeft,
              //               child: Text(
              //                 "Cherish Your Wedding",
              //                 style: TextStyle(
              //                   fontFamily: dMSerifDisplay,
              //                   fontSize: AppFontSizeConstant.fontSize24 + 4.0,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(
              //               top: 8.0,
              //               right: 80.0,
              //             ),
              //             child: Text(
              //               "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
              //               style: TextStyle(
              //                 fontFamily: montserrat,
              //                 fontSize: AppFontSizeConstant.fontSize14,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(top: 12.0),
              //             child: Row(
              //               children: [
              //                 Container(
              //                   height: 8.0,
              //                   width: 16.0,
              //                   decoration: BoxDecoration(
              //                     color: AppColorConstant.primaryColor,
              //                     borderRadius: BorderRadius.circular(20.0),
              //                   ),
              //                 ),
              //                 const SizedBox(width: 6.0),
              //                 Container(
              //                   height: 8.0,
              //                   width: 8.0,
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.circular(20.0),
              //                   ),
              //                 ),
              //                 const SizedBox(width: 6.0),
              //                 Container(
              //                   height: 8.0,
              //                   width: 8.0,
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.circular(20.0),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           SizedBox(
              //             width: double.infinity,
              //             child: Align(
              //               alignment: Alignment.bottomRight,
              //               child: InkWell(
              //                 onTap: () {
              //                   Navigator.push(
              //                     context,
              //                     CupertinoPageRoute(
              //                       builder: (context) =>
              //                           const GetStartedSecond(),
              //                     ),
              //                   );
              //                 },
              //                 child: SvgPicture.asset(
              //                     'assets/svg/get_started_next_btn.svg'),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          onTap: () async {
            // const platform = MethodChannel("mycall");
            // var result =
            //     await platform.invokeMethod("mycall", {"text": "Mostak"});
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => dataStorage.read('login_token') == null ? const AuthCommon() : Home(),
              ),
            );
          },
          child: SvgPicture.asset('assets/svg/get_started_next_btn.svg'),
        ),
      ),
    );
  }
}
