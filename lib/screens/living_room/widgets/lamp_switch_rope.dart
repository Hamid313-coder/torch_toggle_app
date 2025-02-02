import 'package:flutter/material.dart';
import 'package:lamp_app/screens/living_room/living_room.dart';

class LampSwitchRope extends StatelessWidget {
  const LampSwitchRope({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.isOn,
  });

  final double screenHeight;
  final double screenWidth;
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: animationDuration,
      curve: Curves.fastEaseInToSlowEaseOut,
      width: 2,
      top: screenHeight * 0.4,
      bottom: screenHeight * (isOn ? 0.32 : 0.38),
      left: screenWidth * 0.5,
      child: Container(
        color: darkGray,
      ),
    );
  }
}
