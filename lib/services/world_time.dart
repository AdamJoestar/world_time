import 'dart:convert';

import 'package:http/http.dart';

class WorldTime {
  String location;
  String time;
  String Flag;
  String url;

  WorldTime({this.location, this.Flag, this.url});

  void getTime() async {
    String apiKey = 'lOaZowDZm53aB1/8hjEaIg==1P7fRSlBaLWg9YAU';
    Response response = await get(
      Uri.parse('https://api.api-ninjas.com/v1/worldtime?timezone=$url'),
      headers: {'X-Api-Key': apiKey},
    );
    Map data = jsonDecode(response.body);
    //print(data);

    // get properties from data
    String datetime = data['datetime'] ?? 'Unknown datetime';
    String day = data['day_of_week'] ?? 'No days';
    // print(datetime);
    // print(day);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);

    time = now.toString();
  
  }

}

WorldTime instance = WorldTime(
  location: 'Jakarta',
  Flag: 'indonesia.png',
  url: 'Asia/Jakarta',
);