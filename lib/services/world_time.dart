import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  bool isDaytime = false;  // Initialize to false to avoid LateInitializationError

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      String apiKey = 'kLJhjen5ioNAi5zvgWKcbg==vbMy8u95XiDP49Wd';
      Response response = await get(
        Uri.parse('https://api.api-ninjas.com/v1/worldtime?timezone=$url'),
        headers: {'X-Api-Key': apiKey},
      );
      print('API response status: \${response.statusCode}');
      print('API response body: \${response.body}');

      if (response.statusCode != 200) {
        print('API call failed with status: \${response.statusCode}');
        time = 'Could not get time data';
        isDaytime = false;
        return;
      }

      Map data = jsonDecode(response.body);

      String datetime = data['datetime'] ?? 'Unknown datetime';
      print('Received datetime: \$datetime');

      if (datetime == 'Unknown datetime') {
        throw FormatException('Invalid datetime received from API');
      }

      DateTime now = DateTime.parse(datetime);

      isDaytime = now.hour >= 6 && now.hour < 18;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: \$e');
      time = 'Could not get time data';
      isDaytime = false;
    }
  }
}

WorldTime instance = WorldTime(
  location: 'Jakarta',
  flag: 'indonesia.png',
  url: 'Asia/Jakarta',
);
