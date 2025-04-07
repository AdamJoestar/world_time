import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    String apiKey = 'lOaZowDZm53aB1/8hjEaIg==1P7fRSlBaLWg9YAU';
    Response response = await get(
      Uri.parse('https://api.api-ninjas.com/v1/worldtime?timezone=Asia/Jakarta'),
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
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('loading screen'));
  }
}
