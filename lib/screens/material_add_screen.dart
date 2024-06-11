import 'package:flutter/material.dart';
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';
import '../widgets/date_picker.dart';

class MaterialAddScreen extends StatefulWidget {
  @override
  _MaterialAddScreenState createState() => _MaterialAddScreenState();
}

class _MaterialAddScreenState extends State<MaterialAddScreen> {
  String _selectedDate = '';
  String _selectedAcquisitionDate = '';

  @override
  Widget build(BuildContext context) {

    String currentDate = DateTime.now().toString().substring(0,10);
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
                          fontSize: 16,
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
                    DropdownButtonFormField<String>(
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Department 1',
                          child: Text('Department 1'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Department 2',
                          child: Text('Department 2'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Department 3',
                          child: Text('Department 3'),
                        ),
                        // Add more departments as needed
                      ],
                      onChanged: (String? value) {
                        // Handle department selection
                      },
                      decoration: InputDecoration(
                        hintText: 'Department',
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
                      decoration: InputDecoration(
                        hintText: 'Description',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'P.O Number',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Account Code',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Account Name',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
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
                      decoration: InputDecoration(
                        hintText: 'Location',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Unit Price',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Total',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Remarks',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
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
                          onPressed: () {
                            // Handle Add button press
                          },
                          child: Text('Add',style: TextStyle(color: Colors.white),),
                          
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
                          child: Text('Cancel',style: TextStyle(color: Colors.white),),
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
