import 'package:flutter/material.dart';

class TopDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 55,
            color: Colors.grey[850],
          ),
          Container(
            height: 10,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
