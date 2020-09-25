import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/GetLocation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DisplayWeatherData.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  DisplayWeatherData _displayWeatherData = DisplayWeatherData();
  @override
  Widget build(BuildContext context) {
    // getLocation();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: displayImage(),
          ),

          Container(
            child: _displayWeatherData,
          )
        ],
      )),
    );
  }

//  DISPLAY IMAGES BASED ON CURRENT TIME
  displayImage() {
    var now = DateTime.now();
    final currentTime = DateFormat.jm().format(now);

    if (currentTime.contains("AM")) {
      return Image.asset("images/dayTime.jpg");
    } else if (currentTime.contains("PM")) {
      return Image.asset("images/nightTime.jpg");
    }
  }
}
