import 'dart:convert';

import 'package:http/http.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      String apiKey = 'lOaZowDZm53aB1/8hjEaIg==1P7fRSlBaLWg9YAU';
      Response response = await get(
        Uri.parse('https://api.api-ninjas.com/v1/worldtime?timezone=$url'),
        headers: {'X-Api-Key': apiKey},
      );
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from data
      String datetime = data['datetime'] ?? 'Unknown datetime';
      // String day = data['day_of_week'] ?? 'No days'; // Removed unused variable
      // print(datetime);
      // print(day);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);

      time = now.toString();
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}

WorldTime instance = WorldTime(
  location: 'Jakarta',
  flag: 'indonesia.png',
  url: 'Asia/Jakarta',
);
