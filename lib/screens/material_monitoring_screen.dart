import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widgets/bottom_design.dart';
import '../widgets/top_design.dart';

class MaterialMonitoringScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // endDrawer: Sidebar(),
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
                child: Table(
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
                    ...List.generate(3, (index) => TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('06/11/24', style: TextStyle(),textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('College of Computer Studies', style: TextStyle(),textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('JH28', style: TextStyle(),textAlign: TextAlign.center,),
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
                    )),
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
