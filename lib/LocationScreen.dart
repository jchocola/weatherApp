

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'services/DecodeDataFromJson.dart';
import 'CityScreen.dart';

class LocationScreen extends StatefulWidget
{
  String ?weatherDataJsonFormat;
  LocationScreen({this.weatherDataJsonFormat});
  @override
  _LocationScreenState createState()=>_LocationScreenState();
}

  class _LocationScreenState extends State<LocationScreen>
  {
    DecodeDataJSON decodedInfo= DecodeDataJSON();

    num temperature = 0;
    num feelLike = 0;
    String description = "ERROR TRY AGAIN";
    String cityName = "";
    num minTemp = 0;
    num maxTemp = 0;
    num windSpeed = 0;

    @override
    void initState() {
    decodedInfo.decode(widget.weatherDataJsonFormat!);
    temperature = decodedInfo.temp;
    feelLike = decodedInfo.feelLike;
    description = decodedInfo.description;
    cityName = decodedInfo.cityName;
    minTemp = decodedInfo.tempMin;
    maxTemp = decodedInfo.tempMax;
    windSpeed = decodedInfo.windSpeed;
    super.initState();
  }
    @override
    Widget build (BuildContext)
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          body: SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(onPressed: (){Navigator.pop(context);}, child: Icon(FontAwesomeIcons.arrowRotateLeft)),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context){
                          return CityScreen();
                        }));
                      }, child: Icon(FontAwesomeIcons.city)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("$temperature ºC",style: kTempTextStyle,),
                        Text("feels like: $feelLike"),
                        Text("$description",style: kDescripTextStyle,),
                        Text("city name: $cityName"),
                        SizedBox(
                          width: 100,
                          child: Divider(
                            color: Colors.red,
                            indent: 0.3,
                            endIndent: 0.9,
                            thickness: 0.8,
                          ),
                        ),
                        Text("min. temperature : $minTemp"),
                        Text("max. temperature : $maxTemp"),
                        Text("wind speed : $windSpeed"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      );
    }
  }

  const kTempTextStyle = TextStyle(
    fontSize: 50,
    color: Colors.green,
    fontWeight: FontWeight.bold,
  );
const kDescripTextStyle = TextStyle(
  fontSize: 25,
  color: Colors.cyanAccent,
  fontWeight: FontWeight.bold,
);