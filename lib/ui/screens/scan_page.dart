// import 'package:flutter/material.dart';
// import 'package:plant_app/constants.dart';

// class ScanPage extends StatefulWidget {
//   const ScanPage({super.key});

//   @override
//   State<ScanPage> createState() => _ScanPageState();
// }

// class _ScanPageState extends State<ScanPage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//               top: 30,
//               left: 20,
//               right: 20,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 20),
//                       child: Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           color: Constants.primaryColor.withOpacity(.15),
//                         ),
//                         child: Icon(
//                           Icons.close,
//                           color: Constants.primaryColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       debugPrint("favorite");
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 20),
//                       child: Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           color: Constants.primaryColor.withOpacity(.15),
//                         ),
//                         child: IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.share,
//                             color: Constants.primaryColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//           Positioned(
//               top: 100,
//               right: 20,
//               left: 20,
//               child: Container(
//                 width: size.width * .8,
//                 height: size.height * .8,
//                 padding: const EdgeInsets.all(20),
              
//                       Text(
//                         'Tap to Scan',
//                         style: TextStyle(
//                           color: Constants.primaryColor.withOpacity(.80),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 20,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
