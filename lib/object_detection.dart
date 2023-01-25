import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/nav_bar.dart';
import 'package:object_detection/persistent_bottom_bar_scaffold.dart';
import 'package:path/path.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

// import 'nlp_detector_views/entity_extraction_view.dart';
import 'nlp_detector_views/language_identifier_view.dart';
import 'nlp_detector_views/language_translator_view.dart';
// import 'nlp_detector_views/smart_reply_view.dart';
import 'vision_detector_views/barcode_scanner_view.dart';
// import 'vision_detector_views/digital_ink_recognizer_view.dart';
import 'vision_detector_views/face_detector_view.dart';
import 'vision_detector_views/label_detector_view.dart';
import 'vision_detector_views/object_detector_view.dart';
import 'vision_detector_views/pose_detector_view.dart';
import 'vision_detector_views/selfie_segmenter_view.dart';
// import 'vision_detector_views/text_detector_view.dart';

List<CameraDescription> cameras = [];

class ObjectDetectionWidget extends StatefulWidget {
  final Function onScreenHideButtonPressed;
  final bool hideStatus;

  const ObjectDetectionWidget({
    Key? key,
    required this.onScreenHideButtonPressed,
    this.hideStatus = false,
  }) : super(key: key);

  @override
  ObjectDetectionWidgetState createState() => ObjectDetectionWidgetState();
}

class ObjectDetectionWidgetState extends State<ObjectDetectionWidget> {
  late Future<void> _bar;

  Future<void> mainFuture() async {
    WidgetsFlutterBinding.ensureInitialized();

    cameras = await availableCameras();

    // runApp(const MyApp());
  }

  @override
  void initState() {
    super.initState();
    _bar = mainFuture();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(12.0),
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Text(
                  'Vision',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: '/home'),
                      screen: const BarcodeScannerView(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: const Text(
                    'Barcode Scanning',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: '/home'),
                      screen: const FaceDetectorView(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: const Text(
                    'Face Detection',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: '/home'),
                      screen: const ImageLabelView(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: const Text(
                    'Image Labeling',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: '/home'),
                      screen: const ObjectDetectorView(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: const Text(
                    'Object Detection',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: '/home'),
                      screen: const PoseDetectorView(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: const Text(
                    'Pose Detection',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: '/home'),
                      screen: const SelfieSegmenterView(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: const Text(
                    'Selfie Segmentation',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              Container(
                margin: const EdgeInsets.all(12.0),
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Text(
                  'Natural Language',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: '/home'),
                      screen: const LanguageIdentifierView(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: const Text(
                    'Language ID',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: '/home'),
                      screen: const LanguageTranslatorView(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: const Text(
                    'On-device Translation',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Center(
//   child: ElevatedButton(
//     onPressed: () {
//       pushNewScreenWithRouteSettings(
//         context,
//         settings: const RouteSettings(name: '/home'),
//         screen: BarcodeScannerView(),
//         pageTransitionAnimation:
//         PageTransitionAnimation.scaleRotate,
//       );
//     },
//     child: const Text(
//       "Barcode",
//     style: TextStyle(color: Colors.white),
//     ),
//   ),
// ),

// Column(
//   children: <Widget>[
//     FutureBuilder<void>(
//       future: _bar,
//       builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//         if (snapshot.hasData) {
//           return ;
//         } else {
//           return Text('Calculating answer...');
//         }
//       },
//     ),
//     ElevatedButton(
//       onPressed: () {
//         pushNewScreenWithRouteSettings(
//           context,
//           settings: const RouteSettings(name: '/home'),
//           screen: BarcodeScannerView(),
//           pageTransitionAnimation:
//           PageTransitionAnimation.scaleRotate,
//         );
//       },
//       child: const Text(
//         "Barcode",
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   ],
// );

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.red,
//         alignment: Alignment.center,
//         child: ElevatedButton(
//           onPressed: _push,
//           child: const Text(
//             'PUSH',
//             style: TextStyle(fontSize: 32.0, color: Colors.white),
//           ),
//         )
//     );
//   }
// }

// class Home extends StatelessWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: const [
//                   ExpansionTile(
//                     title: Text('Vision APIs'),
//                     children: [
//                       CustomCard('Barcode Scanning', BarcodeScannerView()),
//                       CustomCard('Face Detection', FaceDetectorView()),
//                       CustomCard('Image Labeling', ImageLabelView()),
//                       CustomCard('Object Detection', ObjectDetectorView()),
//                       // CustomCard('Text Recognition', TextRecognizerView()),
//                       // CustomCard('Digital Ink Recognition', DigitalInkView()),
//                       CustomCard('Pose Detection', PoseDetectorView()),
//                       CustomCard('Selfie Segmentation', SelfieSegmenterView()),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   ExpansionTile(
//                     title: Text('Natural Language APIs'),
//                     children: [
//                       CustomCard('Language ID', LanguageIdentifierView()),
//                       CustomCard(
//                           'On-device Translation', LanguageTranslatorView()),
//                       // CustomCard('Smart Reply', SmartReplyView()),
//                       // CustomCard('Entity Extraction', EntityExtractionView()),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
