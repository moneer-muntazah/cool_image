import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart' as package;

class ExtendedImage extends package.ExtendedImage {
  @override
  final BoxConstraints constraints;

  ExtendedImage(String url,
      {double width,
      double height,
      bool cache = true,
      ExtendedImagePlaceholder placeholder})
      : constraints = BoxConstraints.tightFor(width: width, height: height),
        super.network(url,
            width: width,
            height: height,
            cache: cache,
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
  final EdgeInsets padding;

  const ExtendedImagePlaceholder({this.alpha, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.orange.withAlpha(alpha)),
      padding: padding,
      child: Image.asset(
        'assets/placeholder_image.png',
        color: Colors.orange.withAlpha(alpha + 10),
      ),
    );
  }
}
