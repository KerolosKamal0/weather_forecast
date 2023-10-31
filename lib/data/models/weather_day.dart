class WeatherDay {
  DateTime date;
  String weatherMain;
  String weatherDescription;
  String weatherIcon;
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  double windSpeed;
  int visibility;

  WeatherDay({
    required this.date,
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
  });

  factory WeatherDay.fromJson(Map<String, dynamic> json) => WeatherDay(
        date: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000),
        temp: json["main"]["temp"] - 273.15,
        tempMin: json["main"]["temp_min"] - 273.15,
        tempMax: json["main"]["temp_max"] - 273.15,
        feelsLike: json["main"]["feels_like"] - 273.15,
        pressure: json["main"]["pressure"],
        humidity: json["main"]["humidity"],
        weatherMain: json["weather"][0]["main"],
        weatherDescription: json["weather"][0]["description"],
        weatherIcon: json["weather"][0]["icon"],
        windSpeed: json["wind"]["speed"] * (18 / 5),
        visibility: json["visibility"],
      );
}
