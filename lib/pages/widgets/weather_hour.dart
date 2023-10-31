import 'package:flutter/material.dart';

class WeatherHour extends StatefulWidget {
  final double tempWeather;
  final String iconWeather;
  final DateTime dateWeather;
  const WeatherHour(
      {super.key,
      required this.tempWeather,
      required this.iconWeather,
      required this.dateWeather});

  @override
  State<WeatherHour> createState() => _WeatherHourState();
}

class _WeatherHourState extends State<WeatherHour> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.3),
      ),
      child: Column(
        children: [
          Text(
            "${widget.tempWeather.ceil()}°C",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Image.network(
            "https://openweathermap.org/img/wn/${widget.iconWeather}@4x.png",
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 5),
          Text(
            widget.dateWeather.hour > 12
                ? "${widget.dateWeather.hour - 12} PM"
                : "${widget.dateWeather.hour} AM",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
