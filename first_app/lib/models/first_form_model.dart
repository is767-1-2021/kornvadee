import 'package:flutter/material.dart';

class FirstFormModel extends ChangeNotifier {
  String? _firstName;
  String? _lastName;
  int? _age;

  get firstName => this._firstName;

  set firstName(value) {
    this._firstName = value;
    notifyListeners();
  }

  get lastName => this._lastName;

  set lastName(value) {
    this._lastName = value;
    notifyListeners();
  }

  get age => this._age;
// notify listener คือเปนการแจ้งให้ทราบว่ามีการเปลี่ยนค่า เพื่อดึงค่าใหม่ไปใช้งานต่อ (observer pattern)
  set age(value) {
    this._age = value;
    notifyListeners();
  }
}
//change notifier provider รับคำสั่งแล้วเอาไปบอกว่า change ไหนบ้าง