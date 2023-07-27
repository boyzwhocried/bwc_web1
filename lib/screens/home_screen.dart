import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:bwc_web1/widgets/main_drawer.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = getDeviceType(context);
    // double screenWidth = getScreenWidth(context);
    // double screenHeight = getScreenHeight(context);

    // bool isDark = true;
    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.1),
        title: const Text(
          'boyzwhocried',
          style: TextStyle(
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
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
                    child: const Text(
                      'explore',
                      style: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'about',
                      style: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Consumer<DarkModeProvider>(
                    builder: (context, darkModeProvider, child) {
                      return IconButton(
                        onPressed: () {
                          darkModeProvider.toggleDarkMode();
                        },
                        icon: Icon(
                          darkModeProvider.isDarkMode
                              ? Icons.dark_mode
                              : Icons.light_mode,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
      // body: ,
    );
  }
}
