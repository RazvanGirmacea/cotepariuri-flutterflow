import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _firstOpen = prefs.getBool('ff_firstOpen') ?? _firstOpen;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _data;
  dynamic get data => _data;
  set data(dynamic value) {
    _data = value;
  }

  dynamic _leagueData;
  dynamic get leagueData => _leagueData;
  set leagueData(dynamic value) {
    _leagueData = value;
  }

  dynamic _matchData;
  dynamic get matchData => _matchData;
  set matchData(dynamic value) {
    _matchData = value;
  }

  bool _bet = true;
  bool get bet => _bet;
  set bet(bool value) {
    _bet = value;
  }

  bool _home = false;
  bool get home => _home;
  set home(bool value) {
    _home = value;
  }

  bool _up = false;
  bool get up => _up;
  set up(bool value) {
    _up = value;
  }

  bool _isLive = true;
  bool get isLive => _isLive;
  set isLive(bool value) {
    _isLive = value;
  }

  bool _firstOpen = true;
  bool get firstOpen => _firstOpen;
  set firstOpen(bool value) {
    _firstOpen = value;
    prefs.setBool('ff_firstOpen', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
