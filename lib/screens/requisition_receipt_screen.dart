import 'package:flutter/material.dart';
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';
import '../routes/app_routes.dart';

class RequisitionReceiptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopDesign(),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Requisition Receipt',
                                style: TextStyle(
                                  fontSize: 16,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Form
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Department, No, Date
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Department:'),
                                Row(
                                  children: [
                                    Text('No:'),
                                    SizedBox(width: 10),
                                    Text('Date:'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // QTY, Unit
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('QTY:'),
                                Text('Unit:'),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text('Items:'),
                            SizedBox(height: 10),
                            Text('Purpose:'),
                            SizedBox(height: 10),
                            Text('Requisition By:'),
                            SizedBox(height: 10),
                            Text('Recommended By:'),
                            SizedBox(height: 10),
                            Text('Recipient:'),
                            SizedBox(height: 10),
                            Text('Issued By:'),
                            SizedBox(height: 10),
                            Text('Approved:'),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text('Date/Time:'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Download Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle download action
                        },
                        child: Text('Download'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: TextStyle(fontSize: 16),
                        ),
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
