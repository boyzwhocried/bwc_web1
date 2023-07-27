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
    double screenWidth = getScreenWidth(context);
    // double screenHeight = getScreenHeight(context);

    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: AppBar(
        toolbarHeight:
            deviceType != DeviceType.phone ? 70 + screenWidth / 80 : 70,
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.1),
        title: Padding(
          padding: EdgeInsets.only(
              left: deviceType != DeviceType.phone
                  ? (10 / 100) * screenWidth
                  : 0),
          child: AnimatedFadeInText(
            text: 'boyzwhocried',
            textStyle: TextStyle(
              // letterSpacing: 2.0,
              fontWeight: FontWeight.w600,
              fontSize: 20 + screenWidth / 100,
            ),
            slideDirection: deviceType == DeviceType.phone
                ? SlideDirection.topToBottom
                : SlideDirection.leftToRight,
            curveType: Curves.easeInOutCubic,
          ),
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
                      slideDirection: SlideDirection.topToBottom,
                      curveType: Curves.easeInOutCubic,
                      delay: Duration(milliseconds: 200),
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
                      slideDirection: SlideDirection.topToBottom,
                      curveType: Curves.easeInOutCubic,
                      delay: Duration(milliseconds: 400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3,
                      right: (10 / 100) * screenWidth,
                    ),
                    child: Consumer<DarkModeProvider>(
                      builder: (context, darkModeProvider, child) {
                        return IconButton(
                          onPressed: () {
                            darkModeProvider.toggleDarkMode();
                          },
                          icon: AnimatedFadeInIcon(
                            iconData: darkModeProvider.isDarkMode
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined,
                            delay: const Duration(milliseconds: 500),
                          ),
                          iconSize: 36,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      body: Center(
        child: Image.asset(
          'assets/images/fixed.png',
        ),
      ),
    );
  }
}
