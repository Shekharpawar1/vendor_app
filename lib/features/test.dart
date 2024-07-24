// import 'package:flutter/material.dart';
//
// class PaymentModal extends StatelessWidget {
//   final TextEditingController resController;
//   final TextEditingController dateController;
//   final TextEditingController folioController;
//   final TextEditingController masterTypeController;
//   final TextEditingController masterController;
//   final TextEditingController amountController;
//   final TextEditingController commentController;
//
//   const PaymentModal({
//     Key? key,
//     required this.resController,
//     required this.dateController,
//     required this.folioController,
//     required this.masterTypeController,
//     required this.masterController,
//     required this.amountController,
//     required this.commentController,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: SingleChildScrollView(
//         child: Container(
//           width: double.maxFinite,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 padding: EdgeInsets.all(12.0),
//                 margin: EdgeInsets.only(bottom: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GuestInfoRow(label: 'Res / Vou no.', textController: resController),
//                     SizedBox(height: 8.0),
//                     GuestInfoRow(label: 'Date', textController: dateController),
//                     SizedBox(height: 8.0),
//                     GuestInfoRow(label: 'Folio', textController: folioController),
//                   ],
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 padding: EdgeInsets.all(12.0),
//                 margin: EdgeInsets.only(bottom: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GuestInfoRow(label: 'Master Type', textController: masterTypeController),
//                     SizedBox(height: 8.0),
//                     GuestInfoRow(label: 'Master', textController: masterController),
//                     SizedBox(height: 16.0),
//                     GuestInfoRow(label: 'Amount', textController: amountController),
//                   ],
//                 ),
//               ),
//               TextField(
//                 controller: commentController,
//                 maxLines: null, // Allows for multiline input
//                 decoration: InputDecoration(
//                   hintText: 'Enter your comment here',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   contentPadding: EdgeInsets.all(12.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       actions: <Widget>[
//         ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Cancel'),
//         ),
//         SizedBox(width: 20),
//         ElevatedButton(
//           onPressed: () {
//             if (Formkey.currentState!.validate()) {
//               Formkey.currentState?.dispose();
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Processing Data')),
//               );
//               Navigator.pop(context); // Remove modal after processing
//             }
//           },
//           child: Text('Submit'),
//         ),
//       ],
//     );
//   }
// }
//
// // Example of using the PaymentModal in your showDialog
// showPaymentModal(BuildContext context) {
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (context) {
//       return PaymentModal(
//         resController: ResController,
//         dateController: DateController,
//         folioController: FolioController,
//         masterTypeController: MasterTypeController,
//         masterController: MasterController,
//         amountController: AmountController,
//         commentController: commentController,
//       );
//     },
//   );
// }
