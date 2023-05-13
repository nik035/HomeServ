import 'dart:math';

import 'package:flutter/material.dart';
import 'package:manpower_management_app/screens/otp.dart';

class EmployeeWorkPage extends StatefulWidget {
  @override
  _EmployeeWorkPageState createState() => _EmployeeWorkPageState();
}

class _EmployeeWorkPageState extends State<EmployeeWorkPage> {
  List<String> works = ["Plumbing", "Driving", "Painting"];

  List<Map<String, dynamic>> workAssignments = [
    {"work": "Plumbing", "description": "Fixing the leaky faucet in the bathroom", "address": "Room no 03, Lapis Hostel, Nit Trichy", "phone": "7654677895", "distance": "2.3 km"},
    {"work": "Driving", "description": "Pick up the client from the airport", "address": "356, Balajinagar, Trichy", "phone": "9818573469", "distance": "5.6 km"},
    {"work": "Painting", "description": "Painting the living room walls", "address": "124, Chattram, Trichy city", "phone": "6350699142", "distance": "5.2 km"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Work Assignments"),
      ),
      body: ListView.builder(
        itemCount: workAssignments.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> assignment = workAssignments[index];
          return ListTile(
            // leading: Image.network(
            //   assignment["imageUrl"],
            //   height: 48,
            //   width: 48,
            // ),
            title: Text(assignment["work"]),
            subtitle: Text(assignment["description"]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(assignment["distance"]),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmWorkPage(work: assignment["work"],
                          address: assignment["address"],
                          phone: assignment["phone"],)
                      ),
                    );
                  },
                  child: Text("Confirm"),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      workAssignments.removeAt(index);
                    });
                  },
                  child: Text("Deny"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }}

//   String generateOTP() {
//     Random random = Random();
//     return random.nextInt(10000).toString().padLeft(6, "0");
//   }
// }
// class ConfirmWorkPage extends StatelessWidget {
//   final String work;
//   final String address;
//   final String phone;
//   final String otp;
//
//   const ConfirmWorkPage(
//       {Key? key,
//         required this.work,
//         required this.address,
//         required this.phone,
//         required this.otp})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Confirm Work"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 16),
//           Text("Work: $work", style: TextStyle(fontSize: 24)),
//           SizedBox(height: 8),
//           Text("Address: $address", style: TextStyle(fontSize: 16)),
//           SizedBox(height: 8),
//           Text("Phone: $phone", style: TextStyle(fontSize: 16)),
//           SizedBox(height: 32),
//           Center(
//             child: Column(
//               children: [
//                 Text("Please enter the OTP below to confirm the work."),
//                 SizedBox(height: 16),
//                 Text(
//                   otp,
//                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("Close"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
