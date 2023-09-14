import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpotifyMe extends StatefulWidget {
  const SpotifyMe({super.key});

  @override
  SpotifyMeState createState() => SpotifyMeState();
}

class SpotifyMeState extends State<SpotifyMe> {
  String _data = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://YOUR_NODE_SERVER_IP_OR_HOST/getCurrentlyPlaying'));

    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body)['your_data_key'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Spotify App'),
        ),
        body: Center(
          child: _data.isNotEmpty
              ? Text('Currently Playing: $_data')
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}