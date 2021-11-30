import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Date extends ChangeNotifier {
  String date = '';
  get getDate => this.date;

  set setDate(date) => {this.date = date, notifyListeners()};
}
