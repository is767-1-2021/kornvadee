import 'package:final_app/datacontroller.dart';
import 'package:final_app/datainput.dart';
import 'package:final_app/datamodel.dart';
import 'package:final_app/dataservices.dart';
import 'package:final_app/date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  List<Data> data = List.empty();
  bool isLoading = false;

  var service = DataServices();
  var controller;

  _ViewState() {
    controller = DataController(service);
  }

  var children;

  @override
  void initState() {
    super.initState();
    _getData();

    controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));

    // service = NotisServices();
    // controller = NotisController(service!);
  }

  void _getData() async {
    var newData = await controller.fectData(context.read<Date>().date);

    setState(() {
      data = newData;
    });
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: data.isEmpty ? 1 : data.length,
          itemBuilder: (context, index) {
            if (data.isEmpty) {
              return Text('Still no data to show');
            }

            return Container(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  height: 80,
                  child: Column(
                    children: <Widget>[
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Container(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: 140,
                                    minHeight: 80,
                                    maxWidth: 140,
                                    maxHeight: 80,
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          data[index].transactions,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          data[index].amount + "  E",
                                          // data[index].amount.toString() + "  E",
                                          // overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                    leading:
                                        Icon(Icons.notification_add_outlined),
                                    // leading:
                                    //     IconButton(data[index].icon),
                                    //     onPressed(){},
                                    tileColor: Colors.grey[200],
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
              ),
            );
          });

  @override
  Widget build(BuildContext context) {
    // final List<String> dayinwks = <String>[
    //   'M',
    //   'T',
    //   'W',
    //   'T',
    //   'F',
    //   'S',
    //   'S',
    // ];
    // TODO: implement build
    // final List<String> dateinwks = <String>[
    //   '22',
    //   '23',
    //   '24',
    //   '25',
    //   '26',
    //   '27',
    //   '28',
    // ];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'EUR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[700],
        leading: GestureDetector(
          onTap: () {},
          child: Icon(Icons.event_rounded),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
            child: Column(
              children: [
                Container(
                  color: Colors.green[700],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // copy container
                      Container(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(height: 8),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  shape: BoxShape.circle),
                            ),
                            Text("OCT",
                                style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  shape: BoxShape.circle),
                            ),
                            Text("NOV",
                                style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  shape: BoxShape.circle),
                            ),
                            Text("DEC",
                                style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  shape: BoxShape.circle),
                            ),
                            Text("JAN",
                                style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  shape: BoxShape.circle),
                            ),
                            Text("FEB",
                                style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                            ),
                            Text("MAR",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                            ),
                            Text("APR",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                            ),
                            Text("MAY",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                            ),
                            Text("JUN",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size(0.0, 80.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Datainput()));
        },
        tooltip: 'Add Transactions',
        child: const Icon(Icons.add),
      ),
      // V. ใช้ได้
      body: Center(
        child: body,
      ),

      // body: (Container(
      //   padding: EdgeInsets.all(8.0),
      //   child: Column(
      //     children: [
      //       // แถว1 Month
      //       Container(
      //         color: Colors.green[700],
      //         child: Row(
      //           // crossAxisAlignment: CrossAxisAlignment.stretch,
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Container(
      //               // width: 25,
      //               child: Column(
      //                 children: [
      //                   SizedBox(height: 8),
      //                   Container(
      //                     width: 10,
      //                     height: 10,
      //                     decoration: BoxDecoration(
      //                         color: Colors.grey[200], shape: BoxShape.circle),
      //                   ),
      //                   Text("Oct",
      //                       style: TextStyle(
      //                         fontSize: 15,
      //                       )),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //       // แถว 2 day, date
      //       Container(
      //         color: Colors.grey[100],
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Container(
      //               width: 25,
      //               child: Column(
      //                 children: [
      //                   Text("${dayinwks[index]}",
      //                       style: TextStyle(
      //                         fontSize: 15,
      //                       )),
      //                   SizedBox(height: 30),
      //                   Container(
      //                     child: Text(
      //                       "${dateinwks[index]}",
      //                       textAlign: TextAlign.center,
      //                     ),
      //                     width: 30,
      //                     height: 30,
      //                     decoration: BoxDecoration(
      //                         color: Colors.grey[200], shape: BoxShape.circle),
      //                   ),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //       Center(child: body),
      //     ],
      //   ),
      // )),

      // V. ใช้ไม่ได้
      // body: Column(
      //   children: [
      //     Center(
      //       child: getBody(),
      //     ),
      //     Center(
      //       child: body),
      //     ),
      //   ],
      // ),
    );
  }
}

// Widget getBody() {
//   return Container(
//     // height: 150,
//     padding: EdgeInsets.all(8.0),
//     // color: Colors.green[700],
//     child: Column(
//       children: [
//         // แถว1 Month
//         Container(
//           color: Colors.green[700],
//           child: Row(
//             // crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 // width: 25,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 8),
//                     Container(
//                       width: 10,
//                       height: 10,
//                       decoration: BoxDecoration(
//                           color: Colors.grey[200], shape: BoxShape.circle),
//                     ),
//                     Text("Oct",
//                         style: TextStyle(
//                           fontSize: 15,
//                         )),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         // แถว 2 day, date
//         Container(
//           color: Colors.grey[100],
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 25,
//                 child: Column(
//                   children: [
//                     Text("M",
//                         style: TextStyle(
//                           fontSize: 15,
//                         )),
//                     SizedBox(height: 30),
//                     Container(
//                       child: Text(
//                         '22',
//                         textAlign: TextAlign.center,
//                       ),
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                           color: Colors.grey[200], shape: BoxShape.circle),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
