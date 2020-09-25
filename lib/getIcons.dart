import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GetIcons{

  static Icon getIcon(String iconCode){
    if(iconCode == '01d'){
      return Icon(FontAwesomeIcons.solidSun,
      color: Colors.amber,);
    }else if(iconCode == '01n'){
      return Icon(FontAwesomeIcons.moon);
    }else if(iconCode == '02d'){
      return Icon(FontAwesomeIcons.cloudSun,
      color: Colors.amber,);
    }else if(iconCode == '02n'){
      return Icon(FontAwesomeIcons.cloudMoon);
    }else if(iconCode == '03d' || iconCode == '03n'){
      return Icon(FontAwesomeIcons.cloud);
    }
  }
}
//
// 01d.png 	01n.png 	clear sky
// 02d.png 	02n.png 	few clouds
// 03d.png 	03n.png 	scattered clouds
// 04d.png 	04n.png 	broken clouds
// 09d.png 	09n.png 	shower rain
// 10d.png 	10n.png 	rain
// 11d.png 	11n.png 	thunderstorm
// 13d.png 	13n.png 	snow
// 50d.png 	50n.png 	mist