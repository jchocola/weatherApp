import 'dart:convert';

class DecodeDataJSON {
  String description = "";
  num temp = 0;
  num feelLike = 0;
  num tempMin = 0;
  num tempMax = 0;
  num windSpeed = 0;
  String cityName = "";
  void decode(String JSONdata)
  {
    if(JSONdata != '')
      {
        dynamic data = jsonDecode(JSONdata);
        description = data["weather"][0]["description"];
        temp = data["main"]["temp"];
        feelLike = data["main"]["feels_like"];
        tempMin = data["main"]["temp_min"];
        tempMax = data["main"]["temp_max"];
        windSpeed = data["wind"]["speed"];
        cityName = data["name"];
      }

  }
}