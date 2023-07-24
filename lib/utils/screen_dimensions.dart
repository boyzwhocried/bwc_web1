import 'package:flutter/material.dart';

enum DeviceType {
  desktop,
  tablet,
  phone,
  unknown,
}

DeviceType getDeviceType(BuildContext context) {
  double deviceWidth = getScreenWidth(context);

  if (deviceWidth > 1200) {
    return DeviceType.desktop;
  } else if (deviceWidth > 600) {
    return DeviceType.tablet;
  } else {
    return DeviceType.phone;
  }
}

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double getScreenWidth(BuildContext context) {
  return getScreenSize(context).width;
}

double getScreenHeight(BuildContext context) {
  return getScreenSize(context).height;
}
