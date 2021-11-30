import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/datamodel.dart';

abstract class Services {
  Future<List<Data>> getData(String date);
  Future<void> addData(
    String icon,
    String transactions,
    String amount,
    // int amount,
    String date,
  );
}

class DataServices extends Services {
  @override
  Future<List<Data>> getData(String date) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('final_app')
        .where('date', isEqualTo: '25 Feb 2021')
        .get();
    AllData data = AllData.fromSnapshot(snapshot);
    return data.data;
  }

  @override
  Future<void> addData(
    String icon,
    String transactions,
    String amount,
    // int amount,
    String date,
  ) async {
    final DataRef = FirebaseFirestore.instance
        .collection('final_app')
        .withConverter<Data>(
            fromFirestore: (snapshot, _) => Data.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson());

    await DataRef.add(
      Data(
        icon,
        transactions,
        amount,
        date,
      ),
    );
  }
}
