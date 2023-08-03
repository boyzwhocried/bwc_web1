import 'package:bwc_web1/widgets/contents/introduction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required TabController tabController,
    required this.screenWidth,
  }) : _tabController = tabController;

  final TabController _tabController;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
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
    );
  }
}