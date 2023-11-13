import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'services/constants.dart';
import 'package:http/http.dart' as http;
import 'services/DecodeDataFromJson.dart';

String apikey = getApiKey();

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  DecodeDataJSON decodedInfo = DecodeDataJSON();
  String cityName = "";
  String WEAHTER_DATA = "";

  void getWeatherDataWithCityName() async {
    String cityNameFixed = cityName.toUpperCase();
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityNameFixed&appid=$apikey&units=metric";
    http.Response response = await http.get(Uri.parse(url));
    WEAHTER_DATA = response.body;
    if (response.statusCode == 200) {
      WEAHTER_DATA = response.body;
      decodedInfo.decode(WEAHTER_DATA);
      print(WEAHTER_DATA);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(FontAwesomeIcons.angleLeft),
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your city name",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      icon: Icon(
                        FontAwesomeIcons.city,
                      ),
                    ),
                    onChanged: (value) {
                      //print(value);
                      cityName = value;
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text("City name: ${decodedInfo.cityName} ºC"),
                      Text("Temperature: ${decodedInfo.temp}"),
                      Text("${decodedInfo.description}"),
                      Text("Min. temp. :${decodedInfo.tempMin} ºC"),
                      Text("Max temp. :${decodedInfo.tempMax} ºC"),
                      Text("Wind speed :${decodedInfo.windSpeed} km/h"),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: (){
                  getWeatherDataWithCityName();
                  setState(() {

                  });
                }, child: Text("Get Info")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
