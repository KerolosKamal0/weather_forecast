import 'package:flutter/material.dart';

import '../data/models/weather.dart';
import '../data/models/weather_day.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  final List<WeatherDay> weatherWeekDays;

  WeatherLoaded(this.weather, this.weatherWeekDays);
}

class WeatherDayPerHourLoaded extends WeatherState {
  final List<WeatherDay> weatherDays;

  WeatherDayPerHourLoaded(this.weatherDays);
}
