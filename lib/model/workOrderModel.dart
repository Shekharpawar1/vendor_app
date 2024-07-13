class WorkOrder2 {
  final int id;
  final String orderNumber;
  final String category;
  final String unitRoom; // Assuming unit/room is combined here
  final String blockFromDate;
  final String blockToDate;
  final String priority;
  final String assignedTo;
  final String status;
  final String deadline;
  final String description;

  WorkOrder2({
    required this.id,
    required this.orderNumber,
    required this.category,
    required this.unitRoom,
    required this.blockFromDate,
    required this.blockToDate,
    required this.priority,
    required this.assignedTo,
    required this.status,
    required this.deadline,
    required this.description,
  });

  factory WorkOrder2.fromJson(Map<String, dynamic> json) => WorkOrder2(
    id: json['id'],
    orderNumber: json['orderNumber'],
    category: json['category'],
    unitRoom: json['unitRoom'],
    blockFromDate: json['blockFromDate'],
    blockToDate: json['blockToDate'],
    priority: json['priority'],
    assignedTo: json['assignedTo'],
    status: json['status'],
    deadline: json['deadline'],
    description: json['description'],
  );
}