import 'package:flutter/material.dart';
import '../services/material_sheet_api_service.dart';
import '../models/material_sheet.dart';
import '../routes/app_routes.dart';
import '../widgets/bottom_design.dart';
import '../widgets/top_design.dart';

class MaterialMonitoringScreen extends StatefulWidget {
  @override
  _MaterialMonitoringScreenState createState() => _MaterialMonitoringScreenState();
}

class _MaterialMonitoringScreenState extends State<MaterialMonitoringScreen> {
  late Future<List<MaterialSheet>> futureMaterialSheets;

  @override
  void initState() {
    super.initState();
    futureMaterialSheets = MaterialSheetApiService.fetchMaterialSheets();
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
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FutureBuilder<List<MaterialSheet>>(
                  future: futureMaterialSheets,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No material sheets found.'));
                    }

                    final materialSheets = snapshot.data!;

                    return Table(
                      border: TableBorder(
                        horizontalInside: BorderSide(width: 1, color: Colors.grey), // Only horizontal lines
                        bottom: BorderSide(width: 1, color: Colors.grey), // Bottom line
                      ),
                      columnWidths: {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1.5),
                        2: FlexColumnWidth(1.5),
                        3: FlexColumnWidth(1),
                      },
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Date', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Department', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Laboratory', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Action', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                        ...materialSheets.map((materialSheet) => TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(materialSheet.date, style: TextStyle(),textAlign: TextAlign.center,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(materialSheet.department, style: TextStyle(),textAlign: TextAlign.center,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(materialSheet.laboratory, style: TextStyle(),textAlign: TextAlign.center,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    // Handle view icon press
                                  },
                                  icon: Icon(Icons.visibility),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        )).toList(),
                      ],
                    );
                  },
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
                        Navigator.pushNamed(context, AppRoutes.materialAddPage);
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
