import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      String apiKey = 'kLJhjen5ioNAi5zvgWKcbg==vbMy8u95XiDP49Wd';
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

      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;

      time = DateFormat.jm().format(now);
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
