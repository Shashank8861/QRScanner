import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _history = prefs
              .getStringList('ff_history')
              ?.map((x) {
                try {
                  return QRItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _history;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _qr = 'null';
  String get qr => _qr;
  set qr(String _value) {
    _qr = _value;
  }

  List<QRItemStruct> _history = [];
  List<QRItemStruct> get history => _history;
  set history(List<QRItemStruct> _value) {
    _history = _value;
    prefs.setStringList(
        'ff_history', _value.map((x) => x.serialize()).toList());
  }

  void addToHistory(QRItemStruct _value) {
    _history.add(_value);
    prefs.setStringList(
        'ff_history', _history.map((x) => x.serialize()).toList());
  }

  void removeFromHistory(QRItemStruct _value) {
    _history.remove(_value);
    prefs.setStringList(
        'ff_history', _history.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromHistory(int _index) {
    _history.removeAt(_index);
    prefs.setStringList(
        'ff_history', _history.map((x) => x.serialize()).toList());
  }

  void updateHistoryAtIndex(
    int _index,
    QRItemStruct Function(QRItemStruct) updateFn,
  ) {
    _history[_index] = updateFn(_history[_index]);
    prefs.setStringList(
        'ff_history', _history.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInHistory(int _index, QRItemStruct _value) {
    _history.insert(_index, _value);
    prefs.setStringList(
        'ff_history', _history.map((x) => x.serialize()).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
