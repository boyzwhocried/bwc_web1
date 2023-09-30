import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:bwc_web1/screens/about_page.dart';
import 'package:bwc_web1/screens/front_page.dart';
import 'package:bwc_web1/utils/constants/constants.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/responsive_padding_size.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/widgets/contents/introduction.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/widgets/custom/smooth_gradient_background.dart';
import 'package:bwc_web1/widgets/dark_mode_toggle_button.dart';
import 'package:bwc_web1/widgets/side_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

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
      length: 3, // Replace with the actual number of tabs
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Function to switch between pages using the TabController
  void switchPage(int pageNumber) {
    _tabController.animateTo(pageNumber);
  }

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    final deviceType = getDeviceType(context);
    final screenWidth = getScreenWidth(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight:
            deviceType != DeviceType.phone ? 70 + screenWidth / 80 : 70,
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
        title: Padding(
          padding: EdgeInsets.only(
            left: deviceType != DeviceType.phone
                ? responsivePaddingSize(
                    context, 10) // 10 percent of the screen width
                : 0,
          ),
          child: GestureDetector(
            onTap: () {
              switchPage(0);
            },
            child: AnimatedFadeInWidget(
              slideDirection: deviceType == DeviceType.phone
                  ? SlideDirection.topToBottom
                  : SlideDirection.leftToRight,
              curveType: Curves.easeInOutCubic,
              child: Text(
                'boyzwhocried',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w600,
                  fontSize: responsiveFontSize(context, 20),
                ),
              ),
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
                  AnimatedFadeInWidget(
                    slideDirection: SlideDirection.topToBottom,
                    curveType: Curves.easeInOutCubic,
                    startDelay: const Duration(milliseconds: 200),
                    child: TextButton(
                      onPressed: () {
                        switchPage(1);
                      },
                      child: Text(
                        'explore',
                        style: TextStyle(
                          letterSpacing: 3.0,
                          fontSize: responsiveFontSize(
                            context,
                            16,
                            scalingFactor: 0.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedFadeInWidget(
                    slideDirection: SlideDirection.topToBottom,
                    curveType: Curves.easeInOutCubic,
                    startDelay: const Duration(milliseconds: 400),
                    child: TextButton(
                      onPressed: () {
                        switchPage(2);
                      },
                      child: Text(
                        'about',
                        style: TextStyle(
                          letterSpacing: 3.0,
                          fontSize: responsiveFontSize(
                            context,
                            16,
                            scalingFactor: 0.2,
                          ),
                        ),
                      ),
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
        gradients: Constants().backgroundColorGradient(),
        child: TabBarView(
          controller: _tabController,
          children: [
            FrontPage(
              updateCallback: (pageIndex) {
                switchPage(pageIndex);
              },
            ), // Front Page
            const IntroductionSection(), // Explore page
            const AboutPage(), // About page
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
