import 'dart:convert';

import 'package:bwc_web1/others/temp/spotify/attemp2/models/spotify_currently_playing_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpotifyWidgetContainer extends StatelessWidget {
  const SpotifyWidgetContainer({super.key});

  Future<SpotifyCurrentlyPlayingModel> _loadSpotifyData() async {
    final String jsonData =
        await rootBundle.loadString('json/dummy_spotify_data.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonData);
    final SpotifyCurrentlyPlayingModel spotifyData =
        SpotifyCurrentlyPlayingModel.fromJson(jsonMap);
    return spotifyData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SpotifyCurrentlyPlayingModel>(
      future: _loadSpotifyData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show a loading indicator while data is loading
        } else if (snapshot.hasError) {
          return const Text('Error loading data');
        } else if (snapshot.hasData) {
          return SpotifyCurrentlyPlayingWidget(
            currentlyPlaying: snapshot.data!,
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}

class SpotifyCurrentlyPlayingWidget extends StatelessWidget {
  final SpotifyCurrentlyPlayingModel currentlyPlaying;

  const SpotifyCurrentlyPlayingWidget({super.key, required this.currentlyPlaying});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Now Playing: ${currentlyPlaying.item?.name ?? "Unknown"}'),
        Text('Artist: ${currentlyPlaying.item?.artists?.first.name ?? "Unknown"}'),
        // Add more UI elements as needed
      ],
    );
  }
}
