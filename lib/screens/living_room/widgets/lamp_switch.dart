import 'package:flutter/material.dart';
import 'package:lamp_app/screens/living_room/living_room.dart';

class LampSwitch extends StatelessWidget {
  const LampSwitch(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.isOn,
      this.onTap});

  final double screenHeight;
  final double screenWidth;
  final bool isOn;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight * 0.61,
      left: screenWidth * 0.5 - 14,
      height: 70,
      width: 30,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: animationDuration,
          curve: Curves.fastEaseInToSlowEaseOut,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isOn ? bulbOnColor : bulbOffColor,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: isOn ? Alignment.bottomCenter : Alignment.topCenter,
          child: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: darkGray,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
