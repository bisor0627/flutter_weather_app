import 'package:flutter/material.dart';

///isPortrait = Orientation.portrait == MediaQuery.of(context).orientation;
class UIThemeData with ChangeNotifier {
  bool? _isPortrait;

  bool get isPortrait => _isPortrait ?? true;

  setisPortrait(bool isPortrait) {
    _isPortrait = isPortrait;
    notifyListeners();
  }
}
//
