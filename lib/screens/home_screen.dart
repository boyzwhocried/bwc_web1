import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:bwc_web1/utils/custom_animated_fade_in_icon.dart';
import 'package:bwc_web1/utils/custom_animated_fade_in_text.dart';
import 'package:bwc_web1/widgets/main_drawer.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = getDeviceType(context);

    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.1),
        title: const AnimatedFadeInText(
          text: 'boyzwhocried',
          textStyle: TextStyle(
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
          ),
          slideDirection: SlideDirection.topToBottom,
          curveType: Curves.easeInOutCubic,
        ),
        centerTitle: deviceType == DeviceType.phone,
        actions: [
          if (deviceType != DeviceType.phone)
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const AnimatedFadeInText(
                      text: 'explore',
                      textStyle: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 18,
                      ),
                      slideDirection: SlideDirection.rightToLeft,
                      curveType: Curves.easeInOutCubic,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const AnimatedFadeInText(
                      text: 'about',
                      textStyle: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 18,
                      ),
                      slideDirection: SlideDirection.rightToLeft,
                      curveType: Curves.easeInOutCubic,
                    ),
                  ),
                  Consumer<DarkModeProvider>(
                    builder: (context, darkModeProvider, child) {
                      return IconButton(
                          onPressed: () {
                            darkModeProvider.toggleDarkMode();
                          },
                          icon: AnimatedFadeInIcon(
                            iconData: darkModeProvider.isDarkMode
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined,
                          ));
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
      // body:
    );
  }
}
