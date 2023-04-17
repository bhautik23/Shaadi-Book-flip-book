import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:shaadi_book/screens/event_screens/album_grid_item.dart';

class AlbumGrid extends StatefulWidget {
  const AlbumGrid({super.key});

  @override
  State<AlbumGrid> createState() => _AlbumGridState();
}

class _AlbumGridState extends State<AlbumGrid> {
  final _listImages = [
    "assets/images/DSC_6031.JPG",
    "assets/images/DSC_6041.JPG",
    "assets/images/DSC_6071.JPG",
    "assets/images/DSC_6081.JPG",
    "assets/images/DSC_6083.JPG",
    "assets/images/DSC_6084.JPG",
    "assets/images/DSC_6087.JPG",
    "assets/images/DSC_6097.JPG",
    "assets/images/DSC_6111.JPG",
    "assets/images/DSC_6116.JPG",
    "assets/images/DSC_6138.JPG",
    "assets/images/DSC_6152.JPG",
    "assets/images/DSC_6176.JPG",
    "assets/images/DSC_6193.JPG",
    "assets/images/DSC_6230.JPG",
    "assets/images/DSC_6244.JPG",
    "assets/images/DSC_6264.JPG",
    "assets/images/DSC_6343.JPG",
    // "1.png",
    // "2.png",
    // "3.png",
    // "4.png",
    // "5.png",
    // "6.png",
    // "7.png",
    // "6.png",
    // "6.png",
    // "6.png",
    // "6.png",
    // "6.png",
    // "6.png",
    // "6.png",
    // "6.png",
    // "6.png",
  ];

  @override
  Widget build(BuildContext context) {
    // Grid count for Staggered Grid
    int count = 0;
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: _listImages.map((e) {
          // int _currentIndex = _listImages.indexOf(e);
          if (count == 7) {
            count = 0;
          } else {
            count++;
          }
          return AlbumGridItem(
            image: e,
            staggeredGridCount: count - 1,
          );
        }).toList(),
        // StaggeredGridTile.count(
        //   crossAxisCellCount: 2,
        //   mainAxisCellCount: 2,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         fit: BoxFit.fill,
        //         image: AssetImage(
        //           'assets/images/${_lis[0]}',
        //         ),
        //       ),
        //     ),
        //     child: InkWell(
        //       onTap: () async {
        //         await _flipBook();
        //         // Navigator.push(
        //         //   context,
        //         //   CupertinoPageRoute(
        //         //     builder: (context) => CustomWidget(),
        //         //   ),
        //         // );
        //       },
        //       child: Container(
        //         padding: EdgeInsets.all(10.0),
        //         child: Align(
        //           alignment: Alignment.bottomLeft,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               _buildFavCard(),
        //               _buildDownloadCard(),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // StaggeredGridTile.count(
        //   crossAxisCellCount: 2,
        //   mainAxisCellCount: 2,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         fit: BoxFit.fill,
        //         image: AssetImage(
        //           'assets/images/${_lis[1]}',
        //         ),
        //       ),
        //     ),
        //     child: InkWell(
        //       onTap: () async {
        //         await _flipBook();
        //       },
        //       child: Container(
        //         padding: EdgeInsets.all(10.0),
        //         child: Align(
        //           alignment: Alignment.bottomLeft,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               _buildFavCard(),
        //               _buildDownloadCard(),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // StaggeredGridTile.count(
        //   crossAxisCellCount: 4,
        //   mainAxisCellCount: 2,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         fit: BoxFit.fill,
        //         image: AssetImage(
        //           'assets/images/${_lis[2]}',
        //         ),
        //       ),
        //     ),
        //     child: InkWell(
        //       onTap: () async {
        //         await _flipBook();
        //       },
        //       child: Container(
        //         padding: EdgeInsets.all(10.0),
        //         child: Align(
        //           alignment: Alignment.bottomLeft,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               _buildFavCard(),
        //               _buildDownloadCard(),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // StaggeredGridTile.count(
        //   crossAxisCellCount: 2,
        //   mainAxisCellCount: 2,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         fit: BoxFit.fill,
        //         image: AssetImage(
        //           'assets/images/${_lis[3]}',
        //         ),
        //       ),
        //     ),
        //     child: InkWell(
        //       onTap: () async {
        //         await _flipBook();
        //       },
        //       child: Container(
        //         padding: EdgeInsets.all(10.0),
        //         child: Align(
        //           alignment: Alignment.bottomLeft,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               _buildFavCard(),
        //               _buildDownloadCard(),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // StaggeredGridTile.count(
        //   crossAxisCellCount: 2,
        //   mainAxisCellCount: 2,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         fit: BoxFit.fill,
        //         image: AssetImage(
        //           'assets/images/${_lis[4]}',
        //         ),
        //       ),
        //     ),
        //     child: InkWell(
        //       onTap: () async {
        //         await _flipBook();
        //       },
        //       child: Container(
        //         padding: EdgeInsets.all(10.0),
        //         child: Align(
        //           alignment: Alignment.bottomLeft,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               _buildFavCard(),
        //               _buildDownloadCard(),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // StaggeredGridTile.count(
        //   crossAxisCellCount: 2,
        //   mainAxisCellCount: 2,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         fit: BoxFit.fill,
        //         image: AssetImage(
        //           'assets/images/${_lis[5]}',
        //         ),
        //       ),
        //     ),
        //     child: Container(
        //       padding: EdgeInsets.all(10.0),
        //       child: Align(
        //         alignment: Alignment.bottomLeft,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             _buildFavCard(),
        //             _buildDownloadCard(),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // StaggeredGridTile.count(
        //   crossAxisCellCount: 2,
        //   mainAxisCellCount: 4,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         fit: BoxFit.fill,
        //         image: AssetImage(
        //           'assets/images/${_lis[6]}',
        //         ),
        //       ),
        //     ),
        //     child: Container(
        //       padding: EdgeInsets.all(10.0),
        //       child: Align(
        //         alignment: Alignment.bottomLeft,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             _buildFavCard(),
        //             _buildDownloadCard(),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
