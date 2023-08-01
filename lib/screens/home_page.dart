import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:bwc_web1/utils/custom_animated_fade_in_icon.dart';
import 'package:bwc_web1/utils/custom_animated_fade_in_text.dart';
import 'package:bwc_web1/utils/smooth_gradient_background.dart';
import 'package:bwc_web1/widgets/contents/introduction.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this); // Replace '3' with the number of actions you have
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = getDeviceType(context);
    double screenWidth = getScreenWidth(context);
    // double screenHeight = getScreenHeight(context);

    return Scaffold(
      endDrawer: Drawer(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 36,
                    ),
                    padding: const EdgeInsets.all(7),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Spacer(),
                SizedBox(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          _tabController.animateTo(
                              1); // Replace '0' with the index of the action you want to show
                          setState(() {});
                        },
                        title: const Text(
                          'explore',
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.right,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 30),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          _tabController.animateTo(
                              2); // Replace '1' with the index of the action you want to show
                          setState(() {});
                        },
                        title: const Text(
                          'about',
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.right,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 30),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
      // const MainDrawer(),
      appBar: AppBar(
        toolbarHeight:
            deviceType != DeviceType.phone ? 70 + screenWidth / 80 : 70,
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
        title: Padding(
          padding: EdgeInsets.only(
              left: deviceType != DeviceType.phone
                  ? (10 / 100) * screenWidth
                  : 0),
          child: GestureDetector(
            onTap: () {
              _tabController.animateTo(
                  0); // Replace '0' with the index of the action you want to show
              setState(() {});
            },
            child: AnimatedFadeInText(
              text: 'boyzwhocried',
              textStyle: TextStyle(
                letterSpacing: 2.0,
                fontWeight: FontWeight.w600,
                fontSize: 20 + (screenWidth / 100),
              ),
              slideDirection: deviceType == DeviceType.phone
                  ? TextSlideDirection.topToBottom
                  : TextSlideDirection.leftToRight,
              curveType: Curves.easeInOutCubic,
            ),
          ),
        ),
        centerTitle: deviceType == DeviceType.phone,
        actions: [
          if (deviceType != DeviceType.phone)
            Padding(
              padding: EdgeInsets.only(
                right: (10 / 100) * screenWidth,
              ),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      _tabController.animateTo(
                          1); // Replace '0' with the index of the action you want to show
                      setState(() {});
                    },
                    child: const AnimatedFadeInText(
                      text: 'explore',
                      textStyle: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 18,
                      ),
                      slideDirection: TextSlideDirection.topToBottom,
                      curveType: Curves.easeInOutCubic,
                      delay: Duration(milliseconds: 200),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _tabController.animateTo(
                          2); // Replace '1' with the index of the action you want to show
                      setState(() {});
                    },
                    child: const AnimatedFadeInText(
                      text: 'about',
                      textStyle: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 18,
                      ),
                      slideDirection: TextSlideDirection.topToBottom,
                      curveType: Curves.easeInOutCubic,
                      delay: Duration(milliseconds: 400),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      body: SmoothGradientBackground(
        gradientDirectionType: GradientDirectionType.dynamic,
        gradients: const [
          Color.fromARGB(75, 255, 239, 195),
          Color.fromARGB(75, 215, 255, 195),
          Color.fromARGB(75, 195, 255, 255),
          Color.fromARGB(75, 250, 195, 255),
          Color.fromARGB(75, 255, 195, 195),
          Color.fromARGB(75, 204, 195, 255),
        ],
        child: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all((12 / 100) * screenWidth),
              child: const Column(
                children: [
                  IntroductionSection(),
                ],
              ),
            ),
            const Center(
              child: Text(
                'explore page',
              ),
            ),
            const Center(
              child: Text(
                'about page',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<DarkModeProvider>(
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
    );
  }
}
