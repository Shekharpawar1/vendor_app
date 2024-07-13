// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class  AddWorkOrder extends StatelessWidget {
//   // final WorkOrder? workOrder;
//     AddWorkOrder({super.key,
//       // this.workOrder/
//     });
//
//     final  _formKey =GlobalKey<FormState>();
// // =  const WorkOrderCard({required this.workOrder})
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key:_formKey ,
//       child: Card(
//         elevation: 4.0,
//         margin: EdgeInsets.all(16.0),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Order No',
//                   labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Order No.';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 8.0),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Category',
//                   labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Category.';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 8.0),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Unit/Room',
//                   labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Unit/Room.';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 8.0),
//               TextFormField(
//                 maxLines: 2,
//                 decoration: InputDecoration(
//                   labelText: 'Description',
//                   labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Description.';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 8.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Block From:', // Display block from date
//                     style: TextStyle(fontSize: 12),
//                   ),
//                   Text(
//                     'Block To: ', // Display block to date
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Assigned To:', // Display assigned to
//                     style: TextStyle(fontSize: 12),
//                   ),
//                   Text(
//                     'Deadline: ', // Display deadline
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Process form data
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Processing Data')),
//                     );
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Assuming WorkOrder class and workOrders list are defined here
//
//
//
//
