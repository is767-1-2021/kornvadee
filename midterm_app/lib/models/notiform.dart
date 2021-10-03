import 'package:flutter/material.dart';

class NotiformModels extends ChangeNotifier {
  String? _alert1;
  String? _alert2;
  String? _alert3;

  get alert1 => this._alert1;
  set alert1(value) {
    this._alert1 = value;
    notifyListeners();
  }

  get alert2 => this._alert2;
  set alert2(value) {
    this._alert2 = value;
    notifyListeners();
  }

  get alert3 => this._alert3;
  set alert3(value) {
    this._alert3 = value;
    notifyListeners();
  }
}
