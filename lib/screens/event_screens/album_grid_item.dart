import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlbumGridItem extends StatefulWidget {
  final String image;
  final int staggeredGridCount;
  const AlbumGridItem(
      {super.key, required this.image, required this.staggeredGridCount});

  @override
  State<AlbumGridItem> createState() => _AlbumGridItemState();
}

class _AlbumGridItemState extends State<AlbumGridItem> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: _crossCellCount(),
      mainAxisCellCount: _mainCellCount(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              widget.image,
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            // await _flipBook();
            // Navigator.push(
            //   context,
            //   CupertinoPageRoute(
            //     builder: (context) => CustomWidget(),
            //   ),
            // );
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFavCard(),
                  _buildDownloadCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFavCard() {
    return SizedBox(
      width: 32.0,
      height: 32.0,
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset(
              "assets/svg/heart.svg",
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadCard() {
    return SizedBox(
      width: 32.0,
      height: 32.0,
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset(
              "assets/svg/download.svg",
            ),
          ),
        ),
      ),
    );
  }

  int _crossCellCount() {
    switch (widget.staggeredGridCount) {
      case 0:
      case 1:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
        return 2;

      case 2:
        return 4;
      default:
        return 2;
    }
  }

  int _mainCellCount() {
    switch (widget.staggeredGridCount) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 7:
        return 2;

      case 6:
        return 4;
      default:
        return 2;
    }
  }
}
