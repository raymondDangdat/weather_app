import 'package:http/http.dart' as http;
import 'package:weather_app/WeatherData.dart';
import 'dart:convert';
import 'GetLocation.dart';

class HttpHandler{
  static const String _apiKey = 'fc2e81c96b3f2a75d354ab07a8f2e681';
  static GetLocation _getLocation = GetLocation();

  //get current temperature
  static Future<WeatherData>getTemperature() async{
    var _getLatLon = await _getLocation.getCurrentLocation();

    if(_getLatLon != null){
      http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=${_getLatLon.latitude}&lon=${_getLatLon.longitude}&appid=$_apiKey&units=metric');
      if(response.statusCode == 200){
       return WeatherData.fromJSON(json.decode(response.body));
      }else{
        throw Exception('Failed to fetch weather data');
      }
    }

  }

}