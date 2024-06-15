import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';

final GlobalKey containerKey = GlobalKey();

class RequisitionReceiptScreen extends StatelessWidget {


  Future<void> _captureAndSaveScreenshot() async {
    // Capture the container as an image
    RenderRepaintBoundary boundary = containerKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0); // Use higher pixel ratio for better quality
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      Uint8List pngBytes = byteData.buffer.asUint8List();
      final String serverUrl = 'http://10.0.2.2/property_REST_API/save_screenshot.php'; // Replace with your Laragon server URL

      var response = await http.post(Uri.parse(serverUrl), body: pngBytes);
      if (response.statusCode == 200) {
        print('Screenshot saved successfully on your PC');
      } else {
        print('Failed to save screenshot on your PC');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> requisitionData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopDesign(),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    RepaintBoundary(
                      key: containerKey,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.grey[200],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        'Requisition Receipt',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Property Management Office',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 40, thickness: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'No:',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '${requisitionData['no']}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date:',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '${requisitionData['selectedDate'] != null ? requisitionData['selectedDate'].toString().split(' ')[0] : 'N/A'}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInfoRow('Department:', requisitionData['department']),
                                _buildInfoRow('Quantity:', requisitionData['qty']),
                                _buildInfoRow('Unit:', requisitionData['unit']),
                                _buildInfoRow('Items:', requisitionData['items']),
                                _buildInfoRow('Purpose:', requisitionData['purpose']),
                                _buildInfoRow('Requisition By:', requisitionData['requisitionBy']),
                                Divider(),
                                Text(
                                  'Recommended By',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, decoration: TextDecoration.underline),
                                ),
                                SizedBox(height: 10),
                                _buildInfoRow('Department Head:', requisitionData['departmentHead']),
                                _buildInfoRow('Approved Date:', requisitionData['approvedDate'] != null ? requisitionData['approvedDate'].toString().split(' ')[0] : 'N/A'),
                                _buildInfoRow('Recipient:', requisitionData['recipient']),
                                _buildInfoRow('Recipient Date:', requisitionData['recipientDate'] != null ? requisitionData['recipientDate'].toString().split(' ')[0] : 'N/A'),
                                _buildInfoRow('Issued By:', requisitionData['issuedBy']),
                              ],
                            ),
                          ],
                        ),
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
                              onPressed: _captureAndSaveScreenshot,
                              child: Text(
                                'Download',
                                style: TextStyle(color: Colors.white),
                              ),
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
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
