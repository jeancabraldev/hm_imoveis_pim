import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  PreferencesManager(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static final StreamController<PreferencesManager> _controller =
      StreamController.broadcast();

  final Stream<PreferencesManager> stream = _controller.stream;

  final _useDarkTheme = 'useDarkTheme';

  Future useDarkTheme({bool value}) async {
    await _sharedPreferences.setBool(_useDarkTheme, value);
    _controller.add(this);
  }

  bool darkTheme() {
    return _sharedPreferences.getBool(_useDarkTheme) ?? false;
  }

  /*final SharedPreferences _sharedPreferences;

  static final StreamController<PreferencesManager> _streamController =
      StreamController.broadcast();

  final Stream<PreferencesManager> stream = _streamController.stream;

  final _useDarkTheme = 'useDarkThe';

  Future myDarkTheme({bool value}) async {
    await _sharedPreferences.setBool(_useDarkTheme, value);
    _streamController.add(this);
  }

  bool darkTheme() {
    return _sharedPreferences.getBool(_useDarkTheme) ?? false;
  }*/
}
