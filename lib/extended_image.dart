import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart' as package;

enum ImageDimension {
  square, // 1:1
  banner // 700:277
}

class ExtendedImage extends package.ExtendedImage {
  ExtendedImage(String url,
      {ImageDimension dimension,
      double width,
      double height,
      bool cache = true,
      ExtendedImagePlaceholder placeholder})
      : assert((width == null && height == null) ||
            (width != null && height != null)),
        super.network(url,
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            constraints: BoxConstraints.tightFor(height: height, width: width),
            enableLoadState: false, loadStateChanged: (state) {
          if (state.extendedImageLoadState == package.LoadState.loading ||
              state.extendedImageLoadState == package.LoadState.failed) {
            return placeholder;
          }
          return state.completedWidget;
        });
}

class ExtendedImagePlaceholder extends StatelessWidget {
  final int alpha;
  final double scale;
  final Alignment alignment;

  const ExtendedImagePlaceholder(
      {this.alpha, this.scale = 0.7, this.alignment = Alignment.topCenter});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.orange.withAlpha(alpha)),
      alignment: alignment,
      child: Transform.scale(
        scale: scale,
        child: Image.asset(
          'assets/placeholder_image.png',
          color: Colors.orange.withAlpha(alpha + 10),
        ),
      ),
    );
  }
}
