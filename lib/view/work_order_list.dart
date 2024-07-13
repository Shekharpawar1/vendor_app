import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_n_food_vendor/controller/work_order_controller.dart';
import 'package:fun_n_food_vendor/helper/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../helper/styles.dart';
import 'add_work_order.dart';

class WorkOrderList extends StatefulWidget {
  final String title;

  WorkOrderList({Key? key, required this.title}) : super(key: key);

  @override
  _WorkOrderListState createState() => _WorkOrderListState();
}

class _WorkOrderListState extends State<WorkOrderList> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Initialize TabController
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose TabController when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    WorkOrderController controller=Get.put(WorkOrderController());
    final  formKey =GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: InkWell(onTap:()=>Get.back(),child: Icon(Icons.arrow_back_ios_new,color:Colors.white)),
        title: Row(
          children: [
            Text(widget.title,style:Text1), // App bar title
          ],
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () => print("Sort button pressed"), // Handle sort button tap
        //     icon: Icon(Icons.sort),
        //   ),
        //   IconButton(
        //     onPressed: () => print("Filter button pressed"), // Handle filter button tap
        //     icon: Icon(Icons.filter_list),
        //   ),
        // ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: TabBar(
            controller: _tabController, // Assign TabController
            isScrollable: true, // Make the TabBar scrollable if needed
            tabs: [
              // SizedBox(width: 20), // Add space before the first tab
              Tab(
                child: Text('HIGH',style:Text8),
              ),
              Tab(
                child: Text('MEDIUM',style:Text8),
              ),
              // dd space between tabs
              Tab(
                child: Text('LOW',style:Text8),
              ),
              // SizedBox(width: 20), // Add space after the last tab
            ],
          ),

        ),
      ),
      body: TabBarView(
        controller: _tabController, // Assign TabController
        children: [
          WorkOrderListView(priority: 'HIGH'), // Pass priority level to filter work orders
          WorkOrderListView(priority: 'MEDIUM'),
          WorkOrderListView(priority: 'LOW'),
        ],
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){
         final  _formKey=GlobalKey<FormState>();
          showAlertBox(context,_formKey);},
         // Handle add button tap
        // }
        child: Icon(Icons.add),
      ),

    );
  }

  void showPopupMenu(BuildContext context) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(0, 0, 0, 0),
      items: [
        PopupMenuItem<String>(
          value: 'Clean',
          child: Text('Clean'),
        ),
        PopupMenuItem<String>(
          value: 'Maintenance',
          child: Text('Maintenance'),
        ),
        PopupMenuItem<String>(
          value: 'Other Task',
          child: Text('Other Task'),
        ),
        PopupMenuItem<String>(
          value: 'Repair',
          child: Text('Repair'),
        ),
      ],
    ).then((value) {
      if (value != null) {
        setState(() {
          // _selectedCategory = value; // Update selected category
        });
        print('Selected: $value');
      }
    });
  }
  showAlertBox(context,_formKey) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(

          content:  SingleChildScrollView(
            child: Container(
              child: Form(
                key:_formKey ,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Order No',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Order No.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Category',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Categoyr';
                          }
                          return null;
                        },
                      ),
                  SizedBox(height: 8.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Unit/Room',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Unit/Room.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        onTap:()=>selectDate(context),
                        readOnly: true,
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: 'Block From',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Block From.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        onTap:()=>selectDate(context),
                        readOnly: true,
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: 'Block To',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Block From.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Description.';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 8.0),
                      TextFormField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: 'Assigned to',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Assigned to.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        onTap:()=>selectDate(context),
                        readOnly: true,
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: 'Deadline ',
                          labelStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Deadline.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[

            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process form data
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text('Submit'),
              ),

          ],
        );
      },
    );
  }
  Future<void> selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (picked != null && picked != now) {
      // updateDate(picked, type, context);
      // dateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }
}


class WorkOrders {
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

  WorkOrders({
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

  factory WorkOrders.fromJson(Map<String, dynamic> json) => WorkOrders(
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
// Sample work order data
List<WorkOrder> workOrders = [
  WorkOrder(
    orderNumber: "1004",
    category: "Maintenance",
    description: "AC not working",
    deadline: "07/01/2024",
    assignedTo: "PAPPU",
    enteredOn: "07/01/2024",
    updatedOn: "07/01/2024",
    priority: 'HIGH', // Add priority field
  ),
  WorkOrder(
    orderNumber: "1004",
    category: "Maintenance",
    description: "AC not working",
    deadline: "07/01/2024",
    assignedTo: "PAPPU",
    enteredOn: "07/01/2024",
    updatedOn: "07/01/2024",
    priority: 'LOW', // Add priority field
  ),
  WorkOrder(
    orderNumber: "1004",
    category: "Maintenance",
    description: "AC not working",
    deadline: "07/01/2024",
    assignedTo: "PAPPU",
    enteredOn: "07/01/2024",
    updatedOn: "07/01/2024",
    priority: 'MEDIUM', // Add priority field
  ),
  // Add more work order data objects here
];

class WorkOrder {
  final String orderNumber;
  final String category;
  final String description;
  final String deadline;
  final String assignedTo;
  final String enteredOn;
  final String updatedOn;
  final String priority; // Add priority field

  WorkOrder({
    required this.orderNumber,
    required this.category,
    required this.description,
    required this.deadline,
    required this.assignedTo,
    required this.enteredOn,
    required this.updatedOn,
    required this.priority, // Initialize priority field
  });
}

class WorkOrderListView extends StatelessWidget {
  final String priority;

  const WorkOrderListView({required this.priority});

  @override
  Widget build(BuildContext context) {
    // Filter work orders based on priority
    List<WorkOrder> filteredWorkOrders =
    workOrders.where((order) => order.priority == priority).toList();

    return ListView.builder(
      itemCount: filteredWorkOrders.length,
      itemBuilder: (context, index) {
        return WorkOrderItem(workOrder: filteredWorkOrders[index]);
      },
    );
  }
}

class WorkOrderItem extends StatelessWidget {
  final WorkOrder workOrder;

  const WorkOrderItem({required this.workOrder});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(workOrder.orderNumber, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(workOrder.description, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Assigned to: ${workOrder.assignedTo}", style: TextStyle(color: Colors.blue)),
                Text("Deadline: ${workOrder.deadline}", style: TextStyle(color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
