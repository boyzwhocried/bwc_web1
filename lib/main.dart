import 'package:bwc_web1/others/temp/spotify_profile.dart';
import 'package:bwc_web1/provider/dark_mode_provider.dart';
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
          home: const SpotifyProfile(),
          // home: const MainPage(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
