import 'package:flutter/material.dart';
import 'package:lamp_app/screens/living_room/living_room.dart';

class LampBlub extends StatelessWidget {
  const LampBlub({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.isOn,
  });

  final double screenWidth;
  final double screenHeight;
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: screenWidth * 0.1,
        top: screenHeight * 0.34,
        width: 100,
        height: 100,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: isOn ? bulbOnColor : bulbOffColor, shape: BoxShape.circle),
        ));
  }
}
