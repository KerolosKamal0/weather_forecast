import 'package:advanced_weather_forecast_application/data/models/weather_day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherNextDay extends StatefulWidget {
  final WeatherDay weatherDay;
  const WeatherNextDay({super.key, required this.weatherDay});

  @override
  State<WeatherNextDay> createState() => _WeatherNextDayState();
}

class _WeatherNextDayState extends State<WeatherNextDay> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            DateFormat('EEEE').format(widget.weatherDay.date),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          child: Image.network(
            "https://openweathermap.org/img/wn/${widget.weatherDay.weatherIcon}@4x.png",
            width: 50,
            height: 50,
            alignment: Alignment.center,
          ),
        ),
        Expanded(
          child: Text(
            "${widget.weatherDay.temp.ceil()}°C",
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
