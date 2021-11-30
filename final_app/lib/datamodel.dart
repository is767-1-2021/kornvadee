import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
  final String icon;
  final String transactions;
  final String amount;
  // final int amount;
  final String date;

  Data(
    this.icon,
    this.transactions,
    this.amount,
    this.date,
  );

  factory Data.fromJson(
    Map<String, dynamic> json,
  ) {
    return Data(
      json['icon'] as String,
      json['transactions'] as String,
      json['amount'] as String,
      // json['amount'] as int,
      json['date'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'transactions': transactions,
      'amount': amount,
      'date': date,
    };
  }
}

class AllData {
  final List<Data> data;
  AllData(this.data);

  factory AllData.fromJson(List<dynamic> json) {
    List<Data> data;

    data = json.map((index) => Data.fromJson(index)).toList();

    return AllData(data);
  }

  // for convert snapshot ไปเปน todo ข้างบน
  factory AllData.fromSnapshot(QuerySnapshot s) {
    List<Data> data = s.docs.map((DocumentSnapshot ds) {
      return Data.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllData(data);
  }
}
