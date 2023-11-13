import 'package:geolocator/geolocator.dart';

import 'services/getCurrentLocation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'LocationScreen.dart';
import 'services/constants.dart';

String apiKey = getApiKey();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  MY_POSITION myPos =
      MY_POSITION(); // object , where save/get our position (long and latitude)
  String WEATHER_DATA =
      ""; // variable , where contains our json data from http.Response

  // make request using http-lib
  void getWeatherData() async {
    String URL =
        "https://api.openweathermap.org/data/2.5/weather?lat=${myPos.latitude}&lon=${myPos.longtitude}&appid=$apiKey&units=metric";
    //making request
    http.Response myResponse = await http.get(Uri.parse(URL));
    if (myResponse.statusCode == 200) {
      WEATHER_DATA = myResponse.body;
      print(myResponse.body);
    } else {
      print(myResponse.statusCode);
    }
  }

  @override
  void initState() {
    myPos.getCurrentLocation(); // get longtitude end latitude
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            getWeatherData();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LocationScreen(weatherDataJsonFormat: WEATHER_DATA,);
            }));
          },
          child: Text("Get Location"),
        ),
      ),
    );
  }
}
