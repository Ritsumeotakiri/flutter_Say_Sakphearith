import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  TextEditingController tempController = TextEditingController();
  String fahrenheitResult = ''; // Result variable to hold Fahrenheit value

  // Function to convert Celsius to Fahrenheit
  void convertToFahrenheit() {
    setState(() {
      // Get the input value, check if it's not empty and convert
      double celsius = double.tryParse(tempController.text) ?? 0;
      fahrenheitResult = ((celsius * 9 / 5) + 32).toStringAsFixed(2);
    });
  }

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              controller: tempController,
              keyboardType: TextInputType.number,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
              onChanged: (_) => convertToFahrenheit(), // Convert as user types
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                fahrenheitResult.isEmpty
                    ? 'Enter a temperature'
                    : fahrenheitResult,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
