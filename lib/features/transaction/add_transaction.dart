// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:moneymanagementapp/features/transaction/drop_down_to_filter.dart';

// class TransactionList extends StatelessWidget {
//   const TransactionList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SizedBox(
//                 width: 260,
//                 height: 55,
//                 child: TextFormField(
//                   // Search transactions by purpose
//                   onChanged: (value) {
//                     // Call state management logic to filter transactions
//                   },
//                   style: const TextStyle(color: Colors.green),
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     prefixIcon: const Padding(
//                       padding: EdgeInsets.only(left: 25),
//                       child: Icon(Icons.search),
//                     ),
//                     prefixIconColor: const Color.fromARGB(255, 120, 120, 120),
//                     hintText: 'search by purpose',
//                     hintStyle: GoogleFonts.poppins(
//                       color: const Color.fromARGB(255, 139, 139, 139),
//                       fontSize: 15,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(width: 1, color: Colors.green),
//                       borderRadius: BorderRadius.circular(50.0),
//                     ),
//                   ),
//                 ),
//               ),
//               const DropDownToFilter(),
//             ],
//           ),
//           Container(height: 0),
//           Container(
//             margin: const EdgeInsets.all(15),
//             height: 620, // Adjust height based on your design
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(44, 158, 158, 158),
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Center(
//               child: Text(
//                 'No Transaction data !!!',
//                 style: GoogleFonts.poppins(
//                   color: Colors.white38,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             // Replace the below comment with state management logic
//           ),
//         ],
//       ),
//     );
//   }
// }
