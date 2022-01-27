import 'package:flutter/material.dart';

class SearchData with ChangeNotifier {
  String? _keyword;

  String get keyword => _keyword ?? "";

  setkeyword(String keyword) {
    _keyword = keyword;
    print(_keyword);
    notifyListeners();
  }
}
