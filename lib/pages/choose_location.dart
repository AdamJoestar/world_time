import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async{
    String username = await Future.delayed(Duration(seconds: 4), () {
      return 'my name is';
    });

     String rapper = await Future.delayed(Duration(seconds: 3), () {
      return 'playboi carti';
    });

    print('$username - $rapper');
  }

  

  @override
  void initState() {
    super.initState();
    getData();
    print('IAM MUSICCCC');
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Text('Pilih Lokasi '),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
