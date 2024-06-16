import 'package:flutter/material.dart';

class BottomDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Container(
            height: 10,
            color: Colors.red,
          ),
          Expanded(
            child: Container(
              color: Colors.grey[850],
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'All information shown in this page are system-generated and owned by the University of Nueva Caceres. This is intended for viewing purposes only and any other use will be considered as unofficial or illegal and will be subjected to prosecution by law. This system is still under BETA stage and any erroneous / unexpected information should be reported directly to the concerned UNC departments or the UNC MIS Team for verification / correction.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 8, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
