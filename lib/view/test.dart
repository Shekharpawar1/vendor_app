// class GuestInfoRow extends StatelessWidget {
//   final String label;
//   final TextEditingController TextController;
//   final TextStyle Text7;
//   final MyController controller;
//
//   GuestInfoRow({
//     required this.label,
//     required this.TextController,
//     required this.Text7,
//     required this.controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text("$label :"),
//         if (label == 'Country')
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 controller.showModal(context);
//                 print("getting called--------------------------------");
//               },
//               child: Container(
//                 padding: EdgeInsets.all(12.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(4.0),
//                 ),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: TextField(
//                     controller: TextController,
//                     readOnly: true,
//                     decoration: InputDecoration(
//                       hintText: 'Enter $label',
//                       hintStyle: Text7,
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.all(12.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         else
//           Expanded(
//             child: TextField(
//               controller: TextController,
//               decoration: InputDecoration(
//                 hintText: 'Enter $label',
//                 hintStyle: Text7,
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.all(12.0),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
