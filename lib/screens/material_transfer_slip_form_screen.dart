import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';
import '../widgets/date_picker.dart';
import '../models/material_transfer_slip.dart';
import '../routes/app_routes.dart';

class MaterialTransferSlipFormScreen extends StatefulWidget {
  @override
  _MaterialTransferSlipFormScreenState createState() => _MaterialTransferSlipFormScreenState();
}

class _MaterialTransferSlipFormScreenState extends State<MaterialTransferSlipFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _numberController;

  DateTime _selectedDate = DateTime.now();
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _quantityController = TextEditingController();
  final _unitController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _purposeController = TextEditingController();
  final _requestedByController = TextEditingController();
  final _approvedByController = TextEditingController();
  final _receivedByController = TextEditingController();
  final _returnedByController = TextEditingController();
  final _notedByController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController(text: generateRandomNumber().toString());
  }

  // Function to generate a random 5-digit number
  int generateRandomNumber() {
    Random random = Random();
    return 10000 + random.nextInt(90000); // Generate a random 5-digit number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopDesign(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/unc_logo.png',
                    height: 50,
                  ),
                  SizedBox(width: 10),
                  Column(
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
                        'Material Transfer Slip Form',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextFormField(
                              controller: _numberController,
                              enabled: false,
                              decoration: InputDecoration(
                                labelText: 'No:',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a number';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            flex: 1,
                            child: DatePickerField(
                              onChanged: (date) {
                                _selectedDate = date;
                              },
                              placeholder: 'Date:',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _fromController,
                        decoration: InputDecoration(
                          labelText: 'From:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a sender';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _toController,
                        decoration: InputDecoration(
                          labelText: 'To:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a receiver';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextFormField(
                              controller: _quantityController,
                              decoration: InputDecoration(
                                labelText: 'Quantity:',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a quantity';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            flex: 1,
                            child: TextFormField(
                              controller: _unitController,
                              decoration: InputDecoration(
                                labelText: 'Unit:',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a unit';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Description:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _purposeController,
                        decoration: InputDecoration(
                          labelText: 'Purpose:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a purpose';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _requestedByController,
                        decoration: InputDecoration(
                          labelText: 'Requested By:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter who requested';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _approvedByController,
                        decoration: InputDecoration(
                          labelText: 'Approved By:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter who approved';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _receivedByController,
                        decoration: InputDecoration(
                          labelText: 'Received By:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter who received';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _returnedByController,
                        decoration: InputDecoration(
                          labelText: 'Returned By:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter who returned';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _notedByController,
                        decoration: InputDecoration(
                          labelText: 'Noted By:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter who noted';
                          }
                          return null;
                        },
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
                                  if (_formKey.currentState!.validate()) {
                                    final slip = MaterialTransferSlip(
                                      number: _numberController.text,
                                      date: _selectedDate,
                                      from: _fromController.text,
                                      to: _toController.text,
                                      quantity: _quantityController.text,
                                      unit: _unitController.text,
                                      description: _descriptionController.text,
                                      purpose: _purposeController.text,
                                      requestedBy: _requestedByController.text,
                                      approvedBy: _approvedByController.text,
                                      receivedBy: _receivedByController.text,
                                      returnedBy: _returnedByController.text,
                                      notedBy: _notedByController.text,
                                    );

                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.materialTransferSlipReceipt,
                                      arguments: slip,
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
            ),
            BottomDesign(),
          ],
        ),
      ),
    );
  }
}
