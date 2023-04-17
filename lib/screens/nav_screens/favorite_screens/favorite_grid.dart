import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteGrid extends StatefulWidget {
  const FavoriteGrid({super.key});

  @override
  State<FavoriteGrid> createState() => _FavoriteGridState();
}

class _FavoriteGridState extends State<FavoriteGrid> {
  final _lis = [
    "1.png",
    "2.png",
    "3.png",
    "4.png",
    "5.png",
    "6.png",
    "7.png",
    "6.png",
    "6.png",
    "6.png",
    "6.png",
    "6.png",
    "6.png",
    "6.png",
    "6.png",
    "6.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/${_lis[0]}',
                  ),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: _buildFavCard(),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/${_lis[1]}',
                  ),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: _buildFavCard(),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/${_lis[2]}',
                  ),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: _buildFavCard(),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/${_lis[3]}',
                  ),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: _buildFavCard(),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/${_lis[4]}',
                  ),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: _buildFavCard(),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/${_lis[5]}',
                  ),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: _buildFavCard(),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/${_lis[6]}',
                  ),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: _buildFavCard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavCard() {
    return SizedBox(
      width: 32.0,
      height: 32.0,
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(25.0),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(
              "assets/svg/heart_fill.svg",
            ),
          ),
        ),
      ),
    );
  }
}
