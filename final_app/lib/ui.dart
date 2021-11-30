// import 'package:flutter/material.dart';

//move แล้ว 
//class UI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           children: [
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'EUR',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Icon(Icons.arrow_drop_down),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.green[700],
//         leading: GestureDetector(
//           onTap: () {},
//           child: Icon(Icons.event_rounded),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(
//               Icons.drag_indicator_outlined,
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: getBody(),
//       
//     );
//   }

//  Pending from here***************************************************
//   Widget getBody() {
//     return Container(
//       // height: 150,
//       padding: EdgeInsets.all(8.0),
//       // color: Colors.green[700],
//       child: Column(
//         children: [
//           // แถว1 Month
//           Container(
//             color: Colors.green[700],
//             child: Row(
//               // crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   // width: 25,
//                   child: Column(
//                     children: [
//                       SizedBox(height: 8),
//                       Container(
//                         width: 10,
//                         height: 10,
//                         decoration: BoxDecoration(
//                             color: Colors.grey[200], shape: BoxShape.circle),
//                       ),
//                       Text("Oct",
//                           style: TextStyle(
//                             fontSize: 15,
//                           )),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           // แถว 2 day, date
//           Container(
//             color: Colors.grey[100],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: 25,
//                   child: Column(
//                     children: [
//                       Text("M",
//                           style: TextStyle(
//                             fontSize: 15,
//                           )),
//                       SizedBox(height: 30),
//                       Container(
//                         child: Text(
//                           '22',
//                           textAlign: TextAlign.center,
//                         ),
//                         width: 30,
//                         height: 30,
//                         decoration: BoxDecoration(
//                             color: Colors.grey[200], shape: BoxShape.circle),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
