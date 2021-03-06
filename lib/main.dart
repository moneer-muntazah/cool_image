import 'package:flutter/material.dart';
import 'simple_image.dart';
import 'image_screen.dart';
import 'image_column.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: Center(child: SimpleImage()),
      body: Center(
        child: FloatingActionButton(
          child: Text("ImageScreen", style: TextStyle(fontSize: 8)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ImageScreen()));
          },
        ),
      ),
      // body: Center(
      //   child: FloatingActionButton(
      //     child: Text(
      //       "ImageColumn",
      //       style: TextStyle(fontSize: 8),
      //     ),
      //     onPressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => ImageColumn()));
      //     },
      //   ),
      // ),
    );
  }
}
