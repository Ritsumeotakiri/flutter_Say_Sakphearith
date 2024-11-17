import 'package:flutter/material.dart';
import 'package:pratice/W5_S2/EXERCISE-1/EXERCISE-3/screen/temperature.dart';
import 'package:pratice/W5_S2/EXERCISE-1/EXERCISE-3/screen/welcome.dart';
// Assuming this is your temperature screen widget.

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isWelcomeScreen = true; // State variable to manage screen switching

  // Callback method to switch the screen to Temperature
  void startConversion() {
    setState(() {
      isWelcomeScreen = false; // Switch to the temperature screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isWelcomeScreen
              ? Welcome(onStart: startConversion) // Pass callback to Welcome
              : const Temperature(), // Show Temperature screen when isWelcomeScreen is false
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
