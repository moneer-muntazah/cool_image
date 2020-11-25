import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart' as package;

/// Predefined aspect ratios.
@immutable
class ExtendedImageRatio {
  static const square = ExtendedImageRatio._(numerator: 1, denominator: 1);
  static const banner = ExtendedImageRatio._(numerator: 7, denominator: 2.77);
  static const eightXFive = ExtendedImageRatio._(numerator: 8, denominator: 5);

  final double numerator, denominator;

  const ExtendedImageRatio._(
      {@required this.numerator, @required this.denominator})
      : assert(numerator != null &&
            denominator != null &&
            numerator >= 0 &&
            denominator > 0);
}

/// A simple wrapper around [package.ExtendedImage]
/// Specifying the [ratio] property helps optimize the image memory footprint.
class ExtendedImage extends package.ExtendedImage {
  ExtendedImage(String url,
      {@required BuildContext context,
      ExtendedImageRatio ratio,
      double width,
      double height,
      bool cache = true,
      BoxFit fit = BoxFit.scaleDown,
      ExtendedImagePlaceholder placeholder})
      : assert((width == null && height == null && ratio == null) ||
            (width != null && height != null)),
        super.network(url,
            fit: fit,
            alignment: Alignment.center,
            width: width,
            height: height,
            cacheWidth: ratio != null && width != null && height != null
                ? (width <= MediaQuery.of(context).size.width
                        ? width
                        : MediaQuery.of(context).size.width)
                    .round()
                    .toInt()
                : null,
            cacheHeight: ratio != null && width != null && height != null
                ? ((width <= MediaQuery.of(context).size.width
                            ? width
                            : MediaQuery.of(context).size.width) *
                        ratio.denominator /
                        ratio.numerator)
                    .round()
                    .toInt()
                : null,
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
