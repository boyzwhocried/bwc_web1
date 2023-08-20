import 'package:flutter/foundation.dart';

class DarkModeProvider with ChangeNotifier {
  bool _isDarkMode =
      PlatformDispatcher.instance.platformBrightness == Brightness.dark;

  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
