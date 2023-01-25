import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final int currentIndex;
  final Color backgroundColor;

  const HomeWidget({super.key,
    required this.currentIndex,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    print("This is build in home");
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: height,
        width: width,
        color: backgroundColor,
        child: Padding(padding: const EdgeInsets.all(30), child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        )));
  }
}