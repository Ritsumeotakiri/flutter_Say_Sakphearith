import 'package:flutter/material.dart';

class WeatherForecast extends StatelessWidget {
  final String weatherCondition; 
  final String temperature; 
  final String dayOfWeek; 

  const WeatherForecast({
    required this.weatherCondition,
    required this.temperature,
    required this.dayOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    IconData weatherIcon;
    Color cardColor;

    switch (weatherCondition.toLowerCase()) {
      case 'sunny':
        weatherIcon = Icons.wb_sunny;
        cardColor = Colors.yellow[100]!;
        break;
      case 'rainy':
        weatherIcon = Icons.cloud;
        cardColor = Colors.blue[100]!;
        break;
      case 'cloudy':
        weatherIcon = Icons.cloud_queue;
        cardColor = Colors.grey[300]!;
        break;
      case 'snowy':
        weatherIcon = Icons.ac_unit;
        cardColor = Colors.blue[50]!;
        break;
      default:
        weatherIcon = Icons.error; 
        cardColor = Colors.white;
    }

    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: cardColor,
        elevation: 4,
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(weatherIcon, size: 28),
              Text(dayOfWeek, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(temperature, style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Weather Forecast')),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              WeatherForecast(weatherCondition: 'Sunny', temperature: '15°', dayOfWeek: 'Sun'),
              WeatherForecast(weatherCondition: 'Rainy', temperature: '12°', dayOfWeek: 'Mon'),
              WeatherForecast(weatherCondition: 'Rainy', temperature: '9°', dayOfWeek: 'Tue'),
              WeatherForecast(weatherCondition: 'Cloudy', temperature: '8°', dayOfWeek: 'Wed'),
              WeatherForecast(weatherCondition: 'Sunny', temperature: '5°', dayOfWeek: 'Thu'),
              WeatherForecast(weatherCondition: 'Sunny', temperature: '4°', dayOfWeek: 'Fri'),
              WeatherForecast(weatherCondition: 'Sunny', temperature: '3°', dayOfWeek: 'Sat'),
            ],
          ),
        ),
      ),
    );
  }
}
