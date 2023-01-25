import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:object_detection/vision_detector_views/barcode_scanner_view.dart';
import 'package:object_detection/vision_detector_views/face_detector_view.dart';
import 'nav_bar.dart';
import 'package:object_detection/object_detection.dart';

// void main() => runApp(const MyApp());

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: const NavBar(),
      initialRoute: '/',
      routes: const {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/bc': (context) => const BarcodeScannerView(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        // '/fd': (context) => const FaceDetectorView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
