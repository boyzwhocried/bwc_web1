// ignore_for_file: unused_import

import 'package:bwc_web1/others/temp/postman.dart';
import 'package:bwc_web1/others/temp/spotify/attemp5/sotify_track_list.dart';
import 'package:bwc_web1/others/temp/test.dart';
import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:bwc_web1/screens/main_page.dart';
import 'package:bwc_web1/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DarkModeProvider()),
      ],
      child: Consumer<DarkModeProvider>(
          builder: (context, darkModeProvider, child) {
        return MaterialApp(
          title: 'boyzwhocried',
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: GoogleFonts.poppins().fontFamily,
            colorSchemeSeed: Constants().customColors.mainThemeColor.greenLime,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: GoogleFonts.poppins().fontFamily,
            colorSchemeSeed: Constants().customColors.mainThemeColor.greenLime,
            useMaterial3: true,
          ),
          themeMode:
              darkModeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          // home: const SpotifyProfile(),
          // home: const SpotifyProfileAPI(),
          // home: const SpotifyWidgetContainer(),
          // home: const SpotifyMe(),
          // home:  const Postman(),
          // home:  const SpotifyTrackList(),//local json dummy data approach (works) 
          // home: const PostmanTest(),
          home: const MainPage(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}

//<< Experiment area >>

// // Copyright (c) 2017, 2020 rinukkusu, hayribakici. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

// // Copyright (c) 2017, 2020 rinukkusu, hayribakici. All rights reserved. Use of this source code
// // is governed by a BSD-style license that can be found in the LICENSE file.

// import 'dart:io';
// import 'dart:convert';
// import 'package:spotify/spotify.dart';

// void main() async {
//   var keyJson = await File('example/.apikeys').readAsString();
//   var keyMap = json.decode(keyJson);

//   var credentials = SpotifyApiCredentials(keyMap['ec2e9bc000884ed4ba6fb2ef738cfbfc'], keyMap['ca5c2989a02b489cba8422d73cf48355']);
//   var spotify = SpotifyApi(credentials);

//   print('\nPodcast:');
//   await spotify.shows
//       .get('4rOoJ6Egrf8K2IrywzwOMk')
//       .then((podcast) => print(podcast.name))
//       .onError(
//           (error, stackTrace) => print((error as SpotifyException).message));

//   print('\nPodcast episode:');
//   var episodes = spotify.shows.episodes('4AlxqGkkrqe0mfIx3Mi7Xt');
//   await episodes.first().then((first) => print(first.items!.first)).onError(
//       (error, stackTrace) => print((error as SpotifyException).message));

//   print('\nArtists:');
//   var artists = await spotify.artists.list(['0OdUWJ0sBjDrqHygGUXeCF']);
//   artists.forEach((x) => print(x.name));

//   print('\nAlbum:');
//   var album = await spotify.albums.get('2Hog1V8mdTWKhCYqI5paph');
//   print(album.name);

//   print('\nAlbum Tracks:');
//   var tracks = await spotify.albums.getTracks(album.id!).all();
//   tracks.forEach((track) {
//     print(track.name);
//   });

//   print('\nNew Releases');
//   var newReleases = await spotify.browse.getNewReleases().first();
//   newReleases.items!.forEach((album) => print(album.name));

//   print('\nFeatured Playlist:');
//   var featuredPlaylists = await spotify.playlists.featured.all();
//   featuredPlaylists.forEach((playlist) {
//     print(playlist.name);
//   });

//   print('\nUser\'s playlists:');
//   var usersPlaylists =
//       await spotify.playlists.getUsersPlaylists('superinteressante').all();
//   usersPlaylists.forEach((playlist) {
//     print(playlist.name);
//   });

//   print("\nSearching for \'Metallica\':");
//   var search = await spotify.search.get('metallica').first(2);

//   search.forEach((pages) {
//     if (pages.items == null) {
//       print('Empty items');
//     }
//     pages.items!.forEach((item) {
//       if (item is PlaylistSimple) {
//         print('Playlist: \n'
//             'id: ${item.id}\n'
//             'name: ${item.name}:\n'
//             'collaborative: ${item.collaborative}\n'
//             'href: ${item.href}\n'
//             'trackslink: ${item.tracksLink!.href}\n'
//             'owner: ${item.owner}\n'
//             'public: ${item.owner}\n'
//             'snapshotId: ${item.snapshotId}\n'
//             'type: ${item.type}\n'
//             'uri: ${item.uri}\n'
//             'images: ${item.images!.length}\n'
//             '-------------------------------');
//       }
//       if (item is Artist) {
//         print('Artist: \n'
//             'id: ${item.id}\n'
//             'name: ${item.name}\n'
//             'href: ${item.href}\n'
//             'type: ${item.type}\n'
//             'uri: ${item.uri}\n'
//             'popularity: ${item.popularity}\n'
//             '-------------------------------');
//       }
//       if (item is Track) {
//         print('Track:\n'
//             'id: ${item.id}\n'
//             'name: ${item.name}\n'
//             'href: ${item.href}\n'
//             'type: ${item.type}\n'
//             'uri: ${item.uri}\n'
//             'isPlayable: ${item.isPlayable}\n'
//             'artists: ${item.artists!.length}\n'
//             'availableMarkets: ${item.availableMarkets!.length}\n'
//             'discNumber: ${item.discNumber}\n'
//             'trackNumber: ${item.trackNumber}\n'
//             'explicit: ${item.explicit}\n'
//             'popularity: ${item.popularity}\n'
//             '-------------------------------');
//       }
//       if (item is AlbumSimple) {
//         print('Album:\n'
//             'id: ${item.id}\n'
//             'name: ${item.name}\n'
//             'href: ${item.href}\n'
//             'type: ${item.type}\n'
//             'uri: ${item.uri}\n'
//             'albumType: ${item.albumType}\n'
//             'artists: ${item.artists!.length}\n'
//             'availableMarkets: ${item.availableMarkets!.length}\n'
//             'images: ${item.images!.length}\n'
//             'releaseDate: ${item.releaseDate}\n'
//             'releaseDatePrecision: ${item.releaseDatePrecision}\n'
//             '-------------------------------');
//       }
//     });
//   });

//   var relatedArtists =
//       await spotify.artists.relatedArtists('0OdUWJ0sBjDrqHygGUXeCF');
//   print('\nRelated Artists: ${relatedArtists.length}');

//   credentials = await spotify.getCredentials();
//   print('\nCredentials:');
//   print('Client Id: ${credentials.clientId}');
//   print('Access Token: ${credentials.accessToken}');
//   print('Credentials Expired: ${credentials.isExpired}');
// }
