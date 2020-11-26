import 'package:flutter/material.dart';
import 'extended_image.dart';

class SimpleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExtendedImage(
      // 'https://placeimg.com/2000/1250/any',
      'https://www.wallpapertip.com/wmimgs/47-478400_night-nature-wallpaper.jpg',
      context: context,
      // ratio: ExtendedImageRatio.eightXFive,
      width: 320,
      height: 200,
      placeholder: ExtendedImagePlaceholder(
        alpha: 100,
      ),
    );
    // return Image.network(
    //   // 'https://placeimg.com/2000/1250/any',
    //   'https://www.wallpapertip.com/wmimgs/47-478400_night-nature-wallpaper.jpg',
    //   width: 320,
    //   height: 200,
    //   // cacheWidth: 320,
    //   // cacheHeight: 200,
    // );
    // return Container();
  }
}
