import 'package:flutter/material.dart';
import 'extended_image.dart';

class SimpleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExtendedImage(
      'https://via.placeholder.com/80/150',
      height: 100,
      width: 100,
      placeholder: ExtendedImagePlaceholder(
        alpha: 100,
        // padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
      ),
    );
  }
}
