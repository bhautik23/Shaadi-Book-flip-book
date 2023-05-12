import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery_saver/files.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

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
      child: Container(clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
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
  File? _displayImage;

  // This is the flag to check if the image is downloading
  // If it is true, the screen will show "Downloading..."
  bool _isDownloading = false;

  void save_image() async {
    try {
      Uint8List imageBytes = (await http.get(Uri.parse('https://example.com/image.png'))).bodyBytes;

      GallerySaver.saveImage(imageBytes.toString()).then((success) {
        setState(() {
          print('Image is saved');
        });
      });
    } catch (e) {
      print("=====1>$e");
    }
  }


  Future<void> _download() async {
    // Set the flag to true
    setState(() {
      _isDownloading = true;
    });
    final response = await widget.image;
    final imageName = path.basename(widget.image);
    final appDir = await path_provider.getApplicationDocumentsDirectory();

    // This is the saved image path
    // You can use it to display the saved image later
    final localPath = path.join(appDir.path, imageName);
    final imageFile = File(localPath);
    setState(() {
      _isDownloading = false;
      _displayImage = imageFile;
    });
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
          onTap: () {
            save_image();
          },
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
          onTap: () {
          },
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
