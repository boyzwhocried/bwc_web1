import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpotifyProfile extends StatefulWidget {
  const SpotifyProfile({super.key});

  @override
  SpotifyProfileState createState() => SpotifyProfileState();
}

class SpotifyProfileState extends State<SpotifyProfile> {
  final String accessToken = 'BQC2wgPNbhJTxzVO5RUUDNzxvI-jdSjyAcdQB4m8faIBpl-H9SE70hid-pikXu3deP0s7KMtr0Em3CcdtUcelj_9xxTKOoe8WHQ4xVbR7BQLlJGpdFZD6exvIzhDAWTmPfjjBJEcQpZpCpjSeGg9gFoNzC5hxTQ8DOkF2hzSckmma7qnaQsiQsQjBB04E-xm4vhLaBhaAGH7Mq_T7wtLZTNPQlvD';

  Future<Map<String, dynamic>> getUserProfile() async {
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/me'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spotify Profile'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final profileData = snapshot.data!;
            final displayName = profileData['display_name'];

            return Center(
              child: Text('Display Name: $displayName'),
            );
          }
        },
      ),
    );
  }
}