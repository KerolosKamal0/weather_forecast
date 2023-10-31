import 'package:advanced_weather_forecast_application/data/models/weather_day.dart';

class Weather {
  double lon;
  double lat;
  String weatherMain;
  String weatherDescription;
  String weatherIcon;
  double temp;
  double tempMin;
  double tempMax;
  double feelsLike;
  int pressure;
  int humidity;
  int visibility;
  double windSpeed;
  String country;
  String city;
  List<WeatherDay>? weatherDay;

  Weather({
    required this.lon,
    required this.lat,
    required this.weatherMain,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.country,
    required this.city,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        lon: json["coord"]["lon"],
        lat: json["coord"]["lat"],
        weatherMain: json["weather"][0]["main"],
        weatherDescription: json["weather"][0]["description"],
        weatherIcon: json["weather"][0]["icon"],
        temp: json["main"]["temp"] - 273.15,
        tempMin: json["main"]["temp_min"] - 273.15,
        tempMax: json["main"]["temp_max"] - 273.15,
        feelsLike: json["main"]["feels_like"] - 273.15,
        pressure: json["main"]["pressure"],
        humidity: json["main"]["humidity"],
        visibility: json["visibility"],
        windSpeed: json["wind"]["speed"] * (18 / 5),
        country: json["sys"]["country"],
        city: json["name"],
      );
}
