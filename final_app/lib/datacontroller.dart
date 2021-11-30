import 'dart:async';

import 'package:final_app/datamodel.dart';
import 'package:final_app/dataservices.dart';

class DataController {
  final Services service;
  List<Data> datas = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  DataController(this.service);

  Future<List<Data>> fectData(String date) async {
    onSyncController.add(true);
    datas = await service.getData(date);
    onSyncController.add(false);
    return datas;
  }

  addData(
    String icon,
    String transactions,
    String amount,
    // int amount,
    String date,
  ) async {
    await service.addData(icon, transactions, amount, date);
  }
}
