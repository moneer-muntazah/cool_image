import 'package:flutter/material.dart';
import 'simple_image.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: SimpleImage()),
    );
  }
}
