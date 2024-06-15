import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import '../widgets/top_design.dart';
import '../widgets/bottom_design.dart';
import '../models/material_transfer_slip.dart';

final GlobalKey containerKey = GlobalKey();

class MaterialTransferSlipReceiptScreen extends StatelessWidget {
  final MaterialTransferSlip slip;

  const MaterialTransferSlipReceiptScreen({Key? key, required this.slip}) : super(key: key);

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopDesign(),
            SizedBox(height: 10),
            Expanded(
              child: RepaintBoundary(
                key: containerKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Container(
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
                                        'Material Transfer Slip Receipt',
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
                                Text(
                                  'No: ${slip.number}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Date: ${slip.date.toLocal().toString().split(' ')[0]}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            _buildInfoRow('From:', slip.from),
                            _buildInfoRow('To:', slip.to),
                            _buildInfoRow('Quantity:', slip.quantity),
                            _buildInfoRow('Unit:', slip.unit),
                            _buildInfoRow('Description:', slip.description),
                            _buildInfoRow('Purpose:', slip.purpose),
                            _buildInfoRow('Requested By:', slip.requestedBy),
                            _buildInfoRow('Approved By:', slip.approvedBy),
                            _buildInfoRow('Received By:', slip.receivedBy),
                            _buildInfoRow('Returned By:', slip.returnedBy),
                            _buildInfoRow('Noted By:', slip.notedBy),
                          ],
                        ),
                      ),
                    ],
                  ),
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
