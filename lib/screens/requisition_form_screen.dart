import 'package:flutter/material.dart';
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';
import '../widgets/date_picker.dart';
import '../routes/app_routes.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class RequisitionFormScreen extends StatefulWidget {
  @override
  _RequisitionFormScreenState createState() => _RequisitionFormScreenState();
}

class _RequisitionFormScreenState extends State<RequisitionFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
  void initState() {
    super.initState();
    noController.text = generateRandomNumber().toString();
  }

  int generateRandomNumber() {
    Random random = Random();
    return 10000 + random.nextInt(90000); 
  }

  String? _dateValidator(DateTime? date) {
    if (date == null) {
      return 'Please select a date';
    }
    return null;
  }
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
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      // Your existing form fields with TextFormField
                      // No and Date fields
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: noController,
                              enabled: false,
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
                                setState(() {
                                  selectedDate = date;
                                });
                              },
                              placeholder: 'Date:',
                              validator: _dateValidator,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // Department field
                      TextFormField(
                        controller: departmentController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter department';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Department:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      // Quantity and Unit fields
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: qtyController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter quantity';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Quantity:',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: unitController,
                              decoration: InputDecoration(
                                labelText: 'Unit:',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter unit';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // Items field
                      TextFormField(
                        controller: itemsController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter items';
                          }
                          return null;
                        },
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Items:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      // Purpose field
                      TextFormField(
                        controller: purposeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter purpose';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Purpose:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      // Requisition By field
                      TextFormField(
                        controller: requisitionByController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter requisition by';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Requisition By:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Recommended by section
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
                            child: TextFormField(
                              controller: departmentHeadController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter department head';
                                }
                                return null;
                              },
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
                                setState(() {
                                  approvedDate = date;
                                });
                              },
                              placeholder: 'Approved Date',
                              validator: (value) {
                              if (value == null) {
                                return 'Please select approved date';
                              }
                              return null;
                            },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: recipientController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter recipient';
                                }
                                return null;
                              },
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
                                setState(() {
                                  recipientDate = date;
                                });
                              },
                              placeholder: 'Recipient Date',
                              validator: (value) {
                              if (value == null) {
                                return 'Please select recipient date';
                              }
                              return null;
                            },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // Issued By field
                      TextFormField(
                        controller: issuedByController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter issued by';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Issued by',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Buttons
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.requisitionReceiptScreen,
                                      arguments: {
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
                                  }
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
                                  Navigator.pushNamed(context, AppRoutes.landingPage);
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
            ),
            BottomDesign(),
          ],
        ),
      ),
    );
  }
}
