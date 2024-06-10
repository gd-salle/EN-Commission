import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 150),
          // Menu Items
          Divider(thickness: 1),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            onTap: () {
              // Handle onTap
            },
          ),
          Divider(thickness: 1),
          ListTile(
            leading: Icon(Icons.monitor),
            title: Text(
              'Material Monitoring',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            onTap: () {
              // Handle onTap
            },
          ),
          Divider(thickness: 1),
          ListTile(
            leading: Icon(Icons.receipt_outlined),
            title: Text(
              'Material Transfer Slip',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Handle onTap
            },
          ),
          Divider(thickness: 1),
          ListTile(
            leading: Icon(Icons.request_page_outlined),
            title: Text(
              'Requisition Form',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Handle onTap
            },
          ),
          Spacer(),
          Divider(thickness: 1),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              'About',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Handle onTap
            },
          ),
          Divider(thickness: 1),
          ListTile(
            leading: Icon(Icons.exit_to_app), // Add logout icon
            title: Text(
              'Sign Out',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            onTap: () {
              // Handle onTap
            },
          ),
          Divider(thickness: 1),

        ],
      ),
    );
  }
}
