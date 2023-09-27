import 'dart:convert';
import 'dart:math';
import 'package:bwc_web1/utils/constants/constants.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/url_launcher.dart';
import 'package:bwc_web1/widgets/custom/custom_continuous_spinning_widget.dart';
import 'package:bwc_web1/widgets/custom/custom_marquee.dart';
import 'package:http/http.dart' as http;
import 'package:bwc_web1/widgets/custom/spotify/playlist_from_server/spotify_playlist_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpotifyPlaylistWidget extends StatefulWidget {
  const SpotifyPlaylistWidget({Key? key}) : super(key: key);

  @override
  SpotifyPlaylistWidgetState createState() => SpotifyPlaylistWidgetState();
}

class SpotifyPlaylistWidgetState extends State<SpotifyPlaylistWidget> {
  List<Items>? playlistItems = [];
  final random = Random();
  Items? currentSong; // Store the currently displayed song

  final String url = 'http://localhost:3000';
  final String endpointGetPlaylist = '/get-playlist';

  int next(int min, int max) => min + random.nextInt(max - min);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final lastFetchTime = prefs.getInt('lastFetchTime') ?? 0;

      // Check if the data was fetched within the last week
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      final isDataExpired =
          currentTime - lastFetchTime > const Duration(days: 7).inMilliseconds;

      // Use cached data if available and not expired
      if (!isDataExpired) {
        final cachedData = prefs.getString('cachedData');
        if (cachedData != null) {
          final jsonData = json.decode(cachedData);
          final List<dynamic> items = jsonData['tracks']['items'];

          // Now, cast the dynamic items to the desired type (e.g., Items)
          final List<Items> typedItems =
              items.map((item) => Items.fromJson(item)).toList();

          setState(() {
            playlistItems = typedItems;
            currentSong = playlistItems!.isNotEmpty
                ? playlistItems![next(0, playlistItems!.length)]
                : null;
          });
          // ignore: avoid_print
          print('Data is not expired');
          return; // Exit the function early since we used cached data
        }
      }
      try {
        // Fetch new data from the server
        final response = await http.get(Uri.parse('$url$endpointGetPlaylist'));
        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          final List<dynamic> items = jsonData['tracks']['items'];

          // Now, cast the dynamic items to the desired type (e.g., Items)
          final List<Items> typedItems =
              items.map((item) => Items.fromJson(item)).toList();

          setState(() {
            playlistItems = typedItems;
            currentSong = playlistItems!.isNotEmpty
                ? playlistItems![next(0, playlistItems!.length)]
                : null;
          });

          // Cache the data and timestamp of the last fetch
          prefs.setString('cachedData', response.body);
          prefs.setInt('lastFetchTime', currentTime);

          // ignore: avoid_print
          print('Success fetching data: ${response.body}');
        }
      } catch (e) {
        final cachedData = prefs.getString('cachedData');
        if (cachedData != null) {
          final jsonData = json.decode(cachedData);
          final List<dynamic> items = jsonData['tracks']['items'];

          // Now, cast the dynamic items to the desired type (e.g., Items)
          final List<Items> typedItems =
              items.map((item) => Items.fromJson(item)).toList();

          setState(() {
            playlistItems = typedItems;
            currentSong = playlistItems!.isNotEmpty
                ? playlistItems![next(0, playlistItems!.length)]
                : null;
          });
          // ignore: avoid_print
          print('Use cached data instead');
          // return; // Exit the function early since we used cached data
        }
        // ignore: avoid_print
        print('Error fetching data: $e');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        try {
          final String? externalUrls =
              currentSong?.track!.externalUrls!.spotify;
          urlLaunchInBrowser(externalUrls!);
        } catch (e) {
          // ignore: avoid_print
          print('Error fetching data: $e');
        }
      },
      icon: Container(
        width: responsiveFontSize(
          context,
          200,
          maxFontSize: 315,
          scalingFactor: 0.1,
        ),
        padding: EdgeInsets.all(
          responsiveFontSize(context, 6, scalingFactor: 0.02),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              responsiveFontSize(context, 50, scalingFactor: 0.05)),
          color: Colors.white24,
        ),
        child: Row(
          children: [
            ContinuousSpinWidget(
              durationPerRotation: const Duration(seconds: 5),
              child: currentSong?.track?.album?.images != null &&
                      currentSong!.track!.album!.images!.isNotEmpty
                  ? ClipOval(
                      child: Image.network(
                        currentSong!.track!.album!.images![0].url!,
                        width: responsiveFontSize(context, 60),
                        height: responsiveFontSize(context, 60),
                        fit: BoxFit.cover,
                      ),
                    )
                  : ClipOval(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Constants()
                              .customColors
                              .mainThemeColor
                              .greenLime
                              .withOpacity(0.2),
                        ),
                        width: responsiveFontSize(context, 60),
                        height: responsiveFontSize(context, 60),
                        child: const Icon(Icons.music_note),
                      ),
                    ),
            ),
            SizedBox(
              width:
                  Constants().responsiveTextStyleFooters(context).fontSize! - 4,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• on repeat:',
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: Constants()
                                .responsiveTextStyleFooters(context)
                                .fontSize! -
                            2),
                  ),
                  CustomMarquee(
                    text:
                        '"${currentSong?.track?.name ?? 'Unknown'}" by ${currentSong?.track?.artists?.map((a) => a.name).join(', ') ?? 'Unknown Artist'}',
                    style: TextStyle(
                      fontSize: Constants()
                              .responsiveTextStyleFooters(context)
                              .fontSize! -
                          2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width:
                  Constants().responsiveTextStyleFooters(context).fontSize! - 2,
            ),
          ],
        ),
      ),
    );
  }
}
