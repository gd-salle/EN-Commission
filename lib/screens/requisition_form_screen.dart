import 'package:flutter/material.dart';
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';
import '../widgets/date_picker.dart';
import '../routes/app_routes.dart';

class RequisitionFormScreen extends StatelessWidget {
  final TextEditingController noController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController itemsController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController requisitionByController = TextEditingController();
  final TextEditingController departmentHeadController = TextEditingController();
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController issuedByController = TextEditingController();
  
  DateTime? selectedDate;
  DateTime? approvedDate;
  DateTime? recipientDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopDesign(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/unc_logo.png',
                            height: 50,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'UNIVERSITY OF NUEVA CACERES',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'Requisition Form',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Property Management Office',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  controller: noController,
                                  decoration: InputDecoration(
                                    labelText: 'No:',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: DatePickerField(
                                  onChanged: (date) {
                                    selectedDate = date;
                                  },
                                  placeholder: 'Date:',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: departmentController,
                            decoration: InputDecoration(
                              labelText: 'Department:',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  controller: qtyController,
                                  decoration: InputDecoration(
                                    labelText: 'QTY:',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  controller: unitController,
                                  decoration: InputDecoration(
                                    labelText: 'Unit:',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: itemsController,
                            maxLines: 3,
                            decoration: InputDecoration(
                              labelText: 'Items:',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: purposeController,
                            decoration: InputDecoration(
                              labelText: 'Purpose:',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: requisitionByController,
                            decoration: InputDecoration(
                              labelText: 'Requisition By:',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Recommended by:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: departmentHeadController,
                                  decoration: InputDecoration(
                                    labelText: 'Department Head',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: DatePickerField(
                                  onChanged: (date) {
                                    approvedDate = date;
                                  },
                                  placeholder: 'Approved Date',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: recipientController,
                                  decoration: InputDecoration(
                                    labelText: 'Recipient',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: DatePickerField(
                                  onChanged: (date) {
                                    recipientDate = date;
                                  },
                                  placeholder: 'Recipient Date',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: issuedByController,
                            decoration: InputDecoration(
                              labelText: 'Issued by',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.requisitionReceiptScreen,
                                  arguments: {
                                    'no': noController.text,
                                    'selectedDate': selectedDate,
                                    'department': departmentController.text,
                                    'qty': qtyController.text,
                                    'unit': unitController.text,
                                    'items': itemsController.text,
                                    'purpose': purposeController.text,
                                    'requisitionBy': requisitionByController.text,
                                    'departmentHead': departmentHeadController.text,
                                    'approvedDate': approvedDate,
                                    'recipient': recipientController.text,
                                    'recipientDate': recipientDate,
                                    'issuedBy': issuedByController.text,
                                  },
                                );
                              },
                              child: Text('Print', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomDesign(),
          ],
        ),
      ),
    );
  }
}
