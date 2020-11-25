import 'package:flutter/material.dart';
import 'extended_image.dart';

class SimpleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExtendedImage(
      'https://placeimg.com/640/400/any',
      context: context,
      ratio: ExtendedImageRatio.eightXFive,
      width: 320,
      height: 200,
      placeholder: ExtendedImagePlaceholder(
        alpha: 100,
      ),
    );
  }
}
