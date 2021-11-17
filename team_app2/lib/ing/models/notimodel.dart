import 'package:cloud_firestore/cloud_firestore.dart';

class Notis {
  final String username;
  final String notificationTitle;
  final String notificationDetail;
  // final String icon;

  Notis(
    this.username,
    this.notificationTitle,
    this.notificationDetail,
    // this.icon
  );

  factory Notis.fromJson(
    Map<String, dynamic> json,
  ) {
    return Notis(
      json['username'] as String,
      json['notificationTitle'] as String,
      json['notificationDetail'] as String,
      // json['icon'] as String,
    );
  }
}

class AllNotis {
  final List<Notis> notis;
  AllNotis(this.notis);

  factory AllNotis.fromJson(List<dynamic> json) {
    List<Notis> notis;

    notis = json.map((index) => Notis.fromJson(index)).toList();

    return AllNotis(notis);
  }

  // for convert snapshot ไปเปน todo ข้างบน
  factory AllNotis.fromSnapshot(QuerySnapshot s) {
    List<Notis> notis = s.docs.map((DocumentSnapshot ds) {
      return Notis.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllNotis(notis);
  }
}
