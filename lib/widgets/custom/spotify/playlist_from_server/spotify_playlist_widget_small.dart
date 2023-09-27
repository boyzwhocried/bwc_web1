import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:bwc_web1/utils/constants/constants.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/url_launcher.dart';
import 'package:bwc_web1/widgets/custom/custom_arc_text_widget.dart';
import 'package:bwc_web1/widgets/custom/custom_continuous_spinning_widget.dart';
import 'package:bwc_web1/widgets/custom/custom_marquee.dart';
import 'package:http/http.dart' as http;
import 'package:bwc_web1/widgets/custom/spotify/playlist_from_server/spotify_playlist_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpotifyPlaylistWidgetSmall extends StatefulWidget {
  const SpotifyPlaylistWidgetSmall({Key? key}) : super(key: key);

  @override
  SpotifyPlaylistWidgetSmallState createState() =>
      SpotifyPlaylistWidgetSmallState();
}

class SpotifyPlaylistWidgetSmallState
    extends State<SpotifyPlaylistWidgetSmall> {
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
      icon: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: currentSong?.track?.album?.images != null &&
                    currentSong!.track!.album!.images!.isNotEmpty
                ? Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                        currentSong!.track!.album!.images![0].url!,
                        width: responsiveFontSize(context, 90),
                        height: responsiveFontSize(context, 90),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: Color.fromARGB(
                          255,
                          255 -
                              Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!
                                  .red,
                          255 -
                              Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!
                                  .green,
                          255 -
                              Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!
                                  .blue,
                        ).withOpacity(0.5),
                        margin: const EdgeInsets.only(bottom: 8),
                        width: responsiveFontSize(context, 90),
                        height: responsiveFontSize(context, 25),
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 5.0,
                                sigmaY:
                                    5.0), // Adjust sigmaX and sigmaY for desired blur intensity
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomMarquee(
                                    velocity: 30.0,
                                    text:
                                        '"${currentSong?.track?.name ?? 'Unknown'}" by ${currentSong?.track?.artists?.map((a) => a.name).join(', ') ?? 'Unknown Artist'}',
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: Constants()
                                              .responsiveTextStyleFooters(
                                                  context)
                                              .fontSize! -
                                          5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Constants()
                          .customColors
                          .mainThemeColor
                          .greenLime
                          .withOpacity(0.2),
                    ),
                    width: responsiveFontSize(context, 90),
                    height: responsiveFontSize(context, 90),
                    child: const Icon(Icons.music_note),
                  ),
          ),
          ContinuousSpinWidget(
            durationPerRotation: const Duration(seconds: 8),
            child: ArcText(
              radius: 47,
              text: 'on repeat • on repeat • on repeat • ',
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 15.4),
            ),
          ),
        ],
      ),
    );
  }
}
