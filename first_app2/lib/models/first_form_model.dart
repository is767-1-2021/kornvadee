import 'package:flutter/material.dart';

class FirstFormModel extends ChangeNotifier {
  //1. สร้างตัวแปร string / int
  String? _firstName;
  String? _lastName;
  int? _age;

// 2. คลุมทั้งหมด คลิกขวา generate getter setter แล้วจัดหน้าให้สวยงาม
  get firstName => this._firstName;

  set firstName(value) {
    this._firstName = value;
    // 3. ใส่{} แล้ว แทรก notifylisterner ว่าทุกครั้งที่มีค่าเปลี่ยน ให้มาดึงค่าไปใช้งาน
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
// 4. ไปที่หน้า main แล้วเพิ่มตรง void main
