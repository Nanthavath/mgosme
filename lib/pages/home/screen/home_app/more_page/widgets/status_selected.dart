// import 'package:flutter/material.dart';
//
// class StatusSelected extends StatefulWidget {
//   @override
//   _StatusSelectedState createState() => _StatusSelectedState();
// }
//
// String selectedStatus;
//
// class _StatusSelectedState extends State<StatusSelected> {
//   List<String> status = [
//     'ໂສດ',
//     'ແຕ່ງງານແລ້ວ',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: Column(
//         children: List.generate(
//           status.length,
//           (index) {
//             return Container(
//               margin: EdgeInsets.only(top: 5),
//               decoration: BoxDecoration(
//                 border: const Border(
//                   bottom: BorderSide(
//                     color: Colors.grey,
//                     width: 1,
//                   ),
//                 ),
//               ),
//               child: ListTile(
//                 title: Text(
//                   '${status[index]}',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 trailing: Radio(
//                   value: status[index],
//                   groupValue: selectedStatus,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedStatus = value;
//                     });
//                   },
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
