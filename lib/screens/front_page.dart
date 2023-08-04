import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/widgets/contents/introduction.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all((12 / 100) * getScreenWidth(context)),
        child: const IntroductionSection(),
      ),
    );
  }
}