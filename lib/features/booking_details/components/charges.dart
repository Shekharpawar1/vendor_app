import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/helper/colors.dart';
import '../../../utils/helper/styles.dart';

// Define the form keys
final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

// Define the text controllers
TextEditingController ResController = TextEditingController();
TextEditingController DateController = TextEditingController();
TextEditingController FolioController = TextEditingController();
TextEditingController MasterTypeController = TextEditingController();
TextEditingController MasterController = TextEditingController();
TextEditingController AmountController = TextEditingController();
TextEditingController commentController = TextEditingController();
TextEditingController QuantityController = TextEditingController();
TextEditingController DiscountController = TextEditingController();
TextEditingController TaxInclusiveController = TextEditingController();

void showPaymentScreen() {
  Get.to(() => PaymentScreen(
    resController: ResController,
    dateController: DateController,
    folioController: FolioController,
    masterTypeController: MasterTypeController,
    masterController: MasterController,
    amountController: AmountController,
    commentController: commentController,
    formKey: formKey1,
  ));
}

void showExtraChargesScreen() {
  Get.to(() => ExtraChargesScreen(
    resController: ResController,
    dateController: DateController,
    folioController: FolioController,
    masterTypeController: MasterTypeController,
    masterController: MasterController,
    amountController: AmountController,
    commentController: commentController,
    quantityController: QuantityController,
    discountController: DiscountController,
    taxInclusiveController: TaxInclusiveController,
    formKey: formKey2,
  ));
}

class PaymentScreen extends StatelessWidget {
  final TextEditingController resController;
  final TextEditingController dateController;
  final TextEditingController folioController;
  final TextEditingController masterTypeController;
  final TextEditingController masterController;
  final TextEditingController amountController;
  final TextEditingController commentController;
  final GlobalKey<FormState> formKey;

  const PaymentScreen({
    Key? key,
    required this.resController,
    required this.dateController,
    required this.folioController,
    required this.masterTypeController,
    required this.masterController,
    required this.amountController,
    required this.commentController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 80,
        title: Text('Payment', style: Text1),
        leading: InkWell(
          onTap: () {
            // Add your onTap functionality here
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionContainer(
                  children: [
                    GuestInfoRow(label: 'Res / Vou no.', textController: resController),
                    GuestInfoRow(label: 'Date', textController: dateController),
                    GuestInfoRow(label: 'Folio', textController: folioController),
                  ],
                ),
                _buildSectionContainer(
                  children: [
                    GuestInfoRow(label: 'Master Type', textController: masterTypeController),
                    GuestInfoRow(label: 'Master', textController: masterController),
                    GuestInfoRow(label: 'Amount', textController: amountController),
                  ],
                ),
                TextField(
                  controller: commentController,
                  maxLines: null,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    hintText: 'Enter your comment here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding: EdgeInsets.all(12.0),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState?.save();
                          Get.snackbar('Processing', 'Processing Data');
                          Get.back(); // Close the screen after processing
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionContainer({required List<Widget> children}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}

class ExtraChargesScreen extends StatelessWidget {
  final TextEditingController resController;
  final TextEditingController dateController;
  final TextEditingController folioController;
  final TextEditingController masterTypeController;
  final TextEditingController masterController;
  final TextEditingController amountController;
  final TextEditingController commentController;
  final TextEditingController quantityController;
  final TextEditingController discountController;
  final TextEditingController taxInclusiveController;
  final GlobalKey<FormState> formKey;

  const ExtraChargesScreen({
    Key? key,
    required this.resController,
    required this.dateController,
    required this.folioController,
    required this.masterTypeController,
    required this.masterController,
    required this.amountController,
    required this.commentController,
    required this.quantityController,
    required this.discountController,
    required this.taxInclusiveController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Extra Charges'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionContainer(
                  children: [
                    GuestInfoRow(label: 'Res / Vou no.', textController: resController),
                    GuestInfoRow(label: 'Date', textController: dateController),
                    GuestInfoRow(label: 'Folio', textController: folioController),
                  ],
                ),
                _buildSectionContainer(
                  children: [
                    GuestInfoRow(label: 'Master Type', textController: masterTypeController),
                    GuestInfoRow(label: 'Master', textController: masterController),
                    GuestInfoRow(label: 'Qty', textController: quantityController),
                    GuestInfoRow(label: 'Discount', textController: discountController),
                    GuestInfoRow(label: 'Amount', textController: amountController),
                    GuestInfoRow(label: 'Tax', textController: taxInclusiveController),
                  ],
                ),
                TextField(
                  controller: commentController,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter your comment here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding: EdgeInsets.all(12.0),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState?.save();
                          Get.snackbar('Processing', 'Processing Data');
                          Get.back(); // Close the screen after processing
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionContainer({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class GuestInfoRow extends StatelessWidget {
  final String label;
  final TextEditingController textController;

  const GuestInfoRow({
    Key? key,
    required this.label,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '$label',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            ':',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child:TextField(
            controller: textController,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.purpleAccent.withOpacity(0.7),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: 'Enter $label',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            ),
          ),

        ),
      ],
    );
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Text("$label"),
    //     Text(':'),
    //     SizedBox(width: 8.0), // Space between label and TextField
    //     Expanded(
    //       child: TextField(
    //         controller: textController,
    //         decoration: InputDecoration(
    //           hintText: 'Enter $label',
    //           border: InputBorder.none,
    //           contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}

