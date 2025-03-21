import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

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
    print(data);
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
