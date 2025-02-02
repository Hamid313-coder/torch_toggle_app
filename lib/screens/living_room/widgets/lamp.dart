import 'package:flutter/material.dart';
import 'package:lamp_app/screens/living_room/living_room.dart';

class Lamp extends StatelessWidget {
  const Lamp({
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
    return Positioned(
      top: screenHeight * 0.15,
      width: screenWidth,
      child: ClipPath(
        clipper: TrapzoidClipper(),
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.25,
              decoration: const BoxDecoration(color: darkGray),
            ),
            AnimatedContainer(
              duration: animationDuration,
              height: screenHeight * 0.75,
              decoration: BoxDecoration(
                gradient: isOn
                    ? LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                            bulbOnColor.withOpacity(0.4),
                            bulbOnColor.withOpacity(0.1)
                          ])
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrapzoidClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final width = size.width;
    final hieght = size.height;
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, hieght);
    path.lineTo(width, hieght);
    path.lineTo(width, hieght * 0.75);
    path.lineTo(width * 0.5, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
