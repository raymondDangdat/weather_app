import 'package:flutter/material.dart';
import 'package:weather_app/WeatherData.dart';
import 'package:weather_app/getIcons.dart';
import 'HttpHandler.dart';
class DisplayWeatherData extends StatelessWidget {
  Future<WeatherData> _getWeatherData;
  @override
  Widget build(BuildContext context) {
    _getWeatherData = HttpHandler.getTemperature();
    return FutureBuilder<WeatherData>(
      future: _getWeatherData,
      builder: (context, snapShot){
        if(snapShot.hasData){
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: Text(
                  "You are in: ",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[500]),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        snapShot.data.city,
                        style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[500]),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 35.0,
                      ),
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 17.0, horizontal: 25.0),
                color: Colors.white,
                child: ListTile(
                  leading: GetIcons.getIcon('${snapShot.data.icon}'),
                  title: Text("Temperature: ${snapShot.data.temp} c"),
                  subtitle: Text('Status: ${snapShot.data.description}'),
                ),
              ),
            ],
          );
        }else if(snapShot.hasError){
          return Text('${snapShot.error}');
        }

        // if data did not load completely
        return CircularProgressIndicator();
      },
    );
  }
}
