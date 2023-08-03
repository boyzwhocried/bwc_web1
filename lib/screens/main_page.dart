import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:bwc_web1/widgets/contents/introduction.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_text.dart';
import 'package:bwc_web1/widgets/custom/smooth_gradient_background.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/widgets/dark_mode_toggle_button.dart';
import 'package:bwc_web1/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
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

  // Switching between page funtion with controller
  void switchPage(int pageNumber) {
    _tabController.animateTo(
        pageNumber); // Replace '0' with the index of the action you want to show
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);

    DeviceType deviceType = getDeviceType(context);
    double screenWidth = getScreenWidth(context);

    return Scaffold(
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
              switchPage(0);
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
                      switchPage(1);
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
                      switchPage(2);
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
      endDrawer: SideDrawer(
        updateCallback: (pageIndex) {
          switchPage(pageIndex);
        },
      ),
      body: SmoothGradientBackground(
        gradientDirectionType: GradientDirectionType.dynamic,
        gradients: Pastel7ColorfulA50.colorList,
        child: TabBarView(
          controller: _tabController,
          children: [
            Padding(
              padding: EdgeInsets.all((12 / 100) * screenWidth),
              child: const IntroductionSection(),
            ),
            const IntroductionSection(), // Explore page
            const IntroductionSection(), // About page
          ],
        ),
      ),
      floatingActionButton: DarkModeToggleButton(
        darkModeProvider: darkModeProvider,
        iconSize: 36,
      ),
    );
  }
}
