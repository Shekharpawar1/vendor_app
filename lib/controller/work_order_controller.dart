import 'package:get/get.dart';

import '../model/workOrderModel.dart';

class WorkOrderController extends GetxController{
  List workOrders = [
    Workorder(
      orderNumber: "1004",
      category: "Maintenance",
      description: "AC not working",
      deadline: "07/01/2024",
      assignedTo: "PAPPU",
      enteredOn: "07/01/2024",
      updatedOn: "07/01/2024",
      priority: 'HIGH',
    ),
    // Add more WorkOrder objects as needed
  ];

// Getter for workOrders

}


class Workorder{
  String orderNumber;
  String category;
  String description;
  String deadline;
  String assignedTo;
  String enteredOn;
  String updatedOn;
  String priority;
  Workorder({
    required this.description,
    required this.assignedTo,
    required this.priority,
    required this.category,
    required this.updatedOn,
    required this.enteredOn,
    required this.deadline,
    required this.orderNumber,



});
}