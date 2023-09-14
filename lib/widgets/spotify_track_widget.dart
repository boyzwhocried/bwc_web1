import 'dart:convert';
import 'dart:math';

import 'package:bwc_web1/others/temp/spotify/attemp5/spotify_tracks_model.dart';
import 'package:bwc_web1/utils/constants/constants.dart';
import 'package:bwc_web1/widgets/custom/custom_continuous_spinning_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpotifyTrack extends StatefulWidget {
  const SpotifyTrack({super.key});

  @override
  State<SpotifyTrack> createState() => _SpotifyTrackState();
}

class _SpotifyTrackState extends State<SpotifyTrack> {
  List<Data>? spotifyTracks = [];

  //generate ranged random int
  final random = Random();
  int next(int min, int max) => min + random.nextInt(max - min);

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
    final track = spotifyTracks?[next(0, spotifyTracks?.length ?? 0)];
    return Container(
      width: 315,
      padding: EdgeInsets.all(
          Constants().responsiveTextStyleFooters(context).fontSize! - 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white24,
      ),
      child: Row(
        children: [
          ContinuousSpinWidget(
            durationPerRotation: const Duration(seconds: 5),
            child:
                track?.album?.images != null && track!.album!.images!.isNotEmpty
                    ? ClipOval(
                        child: Image.network(
                          track.album!.images![0].url!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Icon(Icons.music_note),
          ),
          SizedBox(
              width: Constants().responsiveTextStyleFooters(context).fontSize! -
                  2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                track?.name ?? 'Unknown',
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: Constants()
                            .responsiveTextStyleFooters(context)
                            .fontSize! -
                        2),
              ),
              Text(
                'by ${track?.artists?.map((a) => a.name).join(', ') ?? 'Unknown Artist'}',
                softWrap: true,
                style: TextStyle(
                    fontSize: Constants()
                            .responsiveTextStyleFooters(context)
                            .fontSize! -
                        2),
              ),
            ],
          ),
          SizedBox(
              width: Constants().responsiveTextStyleFooters(context).fontSize! -
                  2),
        ],
      ),
    );
  }
}
