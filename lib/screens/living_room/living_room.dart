import 'package:flutter/material.dart';

const darkGray = Color(0xFF232323);
const bulbOnColor = Color(0xFFFFE12C);
const bulbOffColor = Color(0xFFC1C1C1);
const animationDuration = Duration(milliseconds: 500);

class LivingRoomScreen extends StatefulWidget {
  const LivingRoomScreen({super.key});

  @override
  State<LivingRoomScreen> createState() => _LivingRoomScreenState();
}

class _LivingRoomScreenState extends State<LivingRoomScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          LampHangerRope(height: screenHeight * 0.15),
        ],
      ),
    );
  }
}

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
