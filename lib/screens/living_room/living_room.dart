import 'package:flutter/material.dart';
import 'package:lamp_app/screens/living_room/widgets/lamp.dart';
import 'package:lamp_app/screens/living_room/widgets/lamp_blub.dart';
import 'package:lamp_app/screens/living_room/widgets/lamp_hanger_rope.dart';
import 'package:lamp_app/screens/living_room/widgets/lamp_switch.dart';
import 'package:lamp_app/screens/living_room/widgets/lamp_switch_rope.dart';
import 'package:torch_light/torch_light.dart';

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
  bool isOn = false;

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
          LampBlub(
            isOn: isOn,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
          Lamp(
            isOn: isOn,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          LampSwitch(
            isOn: isOn,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            onTap: toggleTorch,
          ),
          LampSwitchRope(
            isOn: isOn,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }

  void toggleTorch() async {
    try {
      final hasTorch = await TorchLight.isTorchAvailable();
      if (!hasTorch) {
        showSnackBar('Torch is not available!');
        return;
      }

      isOn ? await TorchLight.disableTorch() : await TorchLight.enableTorch();

      setState(() {
        isOn = !isOn;
      });
    } catch (e) {
      print(e.toString());
      showSnackBar('Something went!');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
