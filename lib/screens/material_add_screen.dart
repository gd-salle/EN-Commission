import 'package:flutter/material.dart';
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';
import '../widgets/date_picker.dart';
import '../models/material_sheet.dart';
import '../services/material_sheet_api_service.dart';
import '../routes/app_routes.dart';
class MaterialAddScreen extends StatefulWidget {
  @override
  _MaterialAddScreenState createState() => _MaterialAddScreenState();
}

class _MaterialAddScreenState extends State<MaterialAddScreen> {
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedAcquisitionDate = DateTime.now();

  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _laboratoryController = TextEditingController();
  final TextEditingController _accountablePersonController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _poNumberController = TextEditingController();
  final TextEditingController _accountCodeController = TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _tagNumberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();
  final TextEditingController _mrNumberController = TextEditingController();

  @override
  void dispose() {
    _departmentController.dispose();
    _laboratoryController.dispose();
    _accountablePersonController.dispose();
    _qtyController.dispose();
    _unitController.dispose();
    _descriptionController.dispose();
    _poNumberController.dispose();
    _accountCodeController.dispose();
    _accountNameController.dispose();
    _tagNumberController.dispose();
    _locationController.dispose();
    _unitPriceController.dispose();
    _totalController.dispose();
    _remarksController.dispose();
    _mrNumberController.dispose();
    super.dispose();
  }

  Future<void> _addMaterialSheet() async {
  final materialSheet = MaterialSheet(
    department: _departmentController.text,
    laboratory: _laboratoryController.text,
    date: _selectedDate.toIso8601String(),
    accountablePerson: _accountablePersonController.text,
    qty: int.tryParse(_qtyController.text) ?? 0,
    unit: _unitController.text,
    description: _descriptionController.text,
    poNumber: _poNumberController.text,
    accountCode: _accountCodeController.text,
    accountName: _accountNameController.text,
    tagNumber: _tagNumberController.text,
    acquisitionDate: _selectedAcquisitionDate.toIso8601String(),
    location: _locationController.text,
    unitPrice: double.tryParse(_unitPriceController.text) ?? 0.0,
    total: double.tryParse(_totalController.text) ?? 0.0,
    remarks: _remarksController.text,
    mrNumber: _mrNumberController.text,
  );
  
  try {
    bool success = await MaterialSheetApiService.addMaterialSheet(materialSheet);
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Material sheet added successfully')));
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.materialMonitoringPage, (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add material sheet')));
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
  }
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
                        'Material Monitoring Sheet',
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
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.grey[300],
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Material Monitoring Sheet Add',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  children: [
                    TextField(
                      controller: _departmentController,
                      decoration: InputDecoration(
                        hintText: 'Department',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _laboratoryController,
                      decoration: InputDecoration(
                        hintText: 'Laboratory',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    DatePickerField(
                      onChanged: (date) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                      placeholder: 'Date',
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _accountablePersonController,
                      decoration: InputDecoration(
                        hintText: 'Accountable Person',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _qtyController,
                            decoration: InputDecoration(
                              hintText: 'QTY',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _unitController,
                            decoration: InputDecoration(
                              hintText: 'UNIT',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _poNumberController,
                      decoration: InputDecoration(
                        hintText: 'P.O Number',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _accountCodeController,
                      decoration: InputDecoration(
                        hintText: 'Account Code',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _accountNameController,
                      decoration: InputDecoration(
                        hintText: 'Account Name',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _tagNumberController,
                      decoration: InputDecoration(
                        hintText: 'Tag Number',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    DatePickerField(
                      onChanged: (date) {
                        setState(() {
                          _selectedAcquisitionDate = date;
                        });
                      },
                      placeholder: 'Acquisition Date',
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        hintText: 'Location',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _unitPriceController,
                      decoration: InputDecoration(
                        hintText: 'Unit Price',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _totalController,
                      decoration: InputDecoration(
                        hintText: 'Total',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _remarksController,
                      decoration: InputDecoration(
                        hintText: 'Remarks',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _mrNumberController,
                      decoration: InputDecoration(
                        hintText: 'MR#',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: _addMaterialSheet,
                      child: Text('Add', style: TextStyle(color: Colors.white)),
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
            BottomDesign(),
          ],
        ),
      ),
    );
  }
}
