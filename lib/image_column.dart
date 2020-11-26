import 'package:flutter/material.dart';
import 'simple_image.dart';

class ImageColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(100, (index) => SimpleImage())
        ),
      )
    );
  }
}
