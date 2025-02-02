import 'package:flutter/material.dart';
import 'package:lamp_app/screens/living_room/living_room.dart';

class LampHangerRope extends StatelessWidget {
  const LampHangerRope({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 80,
      width: 12,
      height: height,
      child: const ColoredBox(color: darkGray),
    );
  }
}
