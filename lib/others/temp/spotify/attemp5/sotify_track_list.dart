import 'dart:convert';

import 'package:bwc_web1/others/temp/spotify/attemp5/spotify_tracks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpotifyTrackList extends StatefulWidget {
  const SpotifyTrackList({super.key});

  @override
  SpotifyTrackListState createState() => SpotifyTrackListState();
}

class SpotifyTrackListState extends State<SpotifyTrackList> {
  List<Data>? spotifyTracks = [];
  

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final jsonText = await rootBundle
        .loadString('assets/json/dummy_spotify_data_multiple.json');
    final jsonData = json.decode(jsonText);
    final tracksModel = SpotifyTracksModel.fromJson(jsonData);
    setState(() {
      spotifyTracks = tracksModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spotify Tracks'),
      ),
      body: ListView.builder(
        itemCount: spotifyTracks?.length ?? 0,
        itemBuilder: (context, index) {
          final track = spotifyTracks?[index];
          return ListTile(
            leading:
                track?.album?.images != null && track!.album!.images!.isNotEmpty
                    ? Image.network(track.album!.images![0].url!)
                    : const Icon(Icons.music_note),
            title: Text(track?.name ?? 'Unknown'),
            subtitle: Text(track?.artists?.map((a) => a.name).join(', ') ??
                'Unknown Artist'),
          );
        },
      ),
    );
  }
}
