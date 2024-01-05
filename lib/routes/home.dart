import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/card_small.dart';
import '../data/data.dart';

const String URL = 'https://run.mocky.io/v3/133aa2f0-6db6-4230-988d-4885024cc6e6';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  AppBar appBar = AppBar(
    centerTitle: true,
    title: const Text(
      'Digi-Bank',
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
    ),

    // 'Trailing' Action(s)
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: CircleAvatar(
          radius: 17.0,
          backgroundColor: Colors.red,
          child: CircleAvatar(
            radius: 14.0,
            backgroundColor: Colors.blue,
            // backgroundImage: <TO INSERT>,
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final Widget body = Center(
      child: FutureBuilder(
        future: fetch(url: URL),
        builder: (BuildContext context, AsyncSnapshot<List<Data>> snap) {
          if (snap.hasData && snap.connectionState == ConnectionState.done) {
            List<Data> data = snap.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, i) {
                return CardSmall(data[i]);
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: body,
      ),
    );
  }
}

Future<List<Data>> fetch({String url = URL}) async {
  List<Data> data = [];
  final resp = await http.get(Uri.parse(url));

  if (resp.statusCode == 200) {
    List<dynamic> results = jsonDecode(resp.body)["digital_banks"];
    debugPrint('Results Count: ${results.length}');

    for (int i = 0; i < results.length; i++) {
      data.add(Data.fromJSON(results[i]));
    }
  }

  debugPrint('Data Count: ${data.length}');
  return data;
}
