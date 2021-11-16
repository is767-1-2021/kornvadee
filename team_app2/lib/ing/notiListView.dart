import 'package:flutter/material.dart';
import 'package:team_app/ing/controllers/noticontroller.dart';
import 'package:team_app/ing/services/notiservices.dart';
import 'package:team_app/main.dart';
import 'package:team_app/ing/models/notimodel.dart';

// class Item {
//   String noti;
//   String update;
//   Icon icon;

//   Item({required this.noti, required this.update, required this.icon});
// }

// final List<Item> _item = [
//   Item(
//       noti: 'เสียใจด้วย งวดนี้ไม่ถูกนะ T^T',
//       update: '1 ตุลาคม 2564',
//       icon: Icon(Icons.bolt)),
//   Item(
//       noti: 'คุณยังไม่ได้ชำระคำสั่งซื้อในตะกร้า',
//       update: '30 กันยายน 2564',
//       icon: Icon(Icons.notification_important_rounded)),
//   Item(
//       noti: 'เลขเด็ดแม่น้ำหนึ่ง มาแล้ว!!',
//       update: '29 กันยายน 2564',
//       icon: Icon(Icons.brightness_low))
// ];

// class Listviewtest extends StatefulWidget {
//   final NotisController controller;

//   Listviewtest({required this.controller});
//   @override
//   _ListviewtestState createState() => _ListviewtestState();
// }

// class _ListviewtestState extends State<Listviewtest> {
//   Services? service;
//   NotisController? controller;

//   @override
//   void initState() {
//     super.initState();
//     service = NotisServices();
//     controller = NotisController(service!);
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(
//           'การแจ้งเตือน',
//           style: TextStyle(fontSize: 28),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: _item.length,
//         itemBuilder: (BuildContext context, int index) {
//           Item item = _item[index];

//           return ListTile(
//             title: Text(
//               item.noti,
//             ),
//             subtitle: Text(item.update),
//             leading: item.icon,
//             tileColor: Colors.deepPurple[50],
//           );
//         },
//       ),
//       bottomNavigationBar: BottomBar(),
//     );
//   }
// }

class Listviewtest extends StatefulWidget {
  final NotisController controller;

  Listviewtest({required this.controller});
  @override
  _ListviewtestState createState() => _ListviewtestState();
}

class _ListviewtestState extends State<Listviewtest> {
  List<Notis> notis = List.empty();
  bool isLoading = false;

  var children;

  @override
  void initState() {
    super.initState();
    _getnotis();

    widget.controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));

    // service = NotisServices();
    // controller = NotisController(service!);
  }

  void _getnotis() async {
    var newNotis = await widget.controller.fectNotis();

    setState(() {
      notis = newNotis;
    });
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: notis.isEmpty ? 1 : notis.length,
          itemBuilder: (context, index) {
            if (notis.isEmpty) {
              return Text('Notifications');
            }

            return Card(
              child: Container(
                height: 120,
                child: Column(
                  children: <Widget>[
                    Table(
                      children: [
                        TableRow(
                          children: [
                            Container(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 120,
                                  minHeight: 110,
                                  maxWidth: 120,
                                  maxHeight: 110,
                                ),
                                child: ListTile(
                                  title: Text(notis[index].notificationTitle),
                                  subtitle:
                                      Text(notis[index].notificationDetail),
                                  leading:
                                      Icon(Icons.notification_add_outlined),
                                  // leading:
                                  //     IconButton(notis[index].icon),
                                  //     onPressed(){},

                                  // leading: Image.asset(
                                  //     'assets/' + notis[index].image,
                                  //     fit: BoxFit.cover),
                                  // leading: Icon(Icons.brightness_low),
                                  tileColor: Colors.deepPurple[50],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('การแจ้งเตือนของคุณ'),
      ),
      body: Center(
        child: body,
      ),
    );
  }
}
