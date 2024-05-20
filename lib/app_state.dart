import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
  set data(dynamic _value) {
    _data = _value;
  }

  dynamic _leagueData;
  dynamic get leagueData => _leagueData;
  set leagueData(dynamic _value) {
    _leagueData = _value;
  }

  dynamic _matchData;
  dynamic get matchData => _matchData;
  set matchData(dynamic _value) {
    _matchData = _value;
  }

  bool _bet = true;
  bool get bet => _bet;
  set bet(bool _value) {
    _bet = _value;
  }

  bool _home = false;
  bool get home => _home;
  set home(bool _value) {
    _home = _value;
  }

  bool _up = false;
  bool get up => _up;
  set up(bool _value) {
    _up = _value;
  }

  bool _isLive = true;
  bool get isLive => _isLive;
  set isLive(bool _value) {
    _isLive = _value;
  }

  bool _firstOpen = true;
  bool get firstOpen => _firstOpen;
  set firstOpen(bool _value) {
    _firstOpen = _value;
    prefs.setBool('ff_firstOpen', _value);
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
