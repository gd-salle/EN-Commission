import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widgets/logout_confirmation_dialog.dart';

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
              Navigator.pushNamed(context, AppRoutes.landingPage);
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
              Navigator.pushNamed(context, AppRoutes.materialMonitoringPage);
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
              Navigator.pushNamed(context, AppRoutes.materialTransferSlipPage);
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
              Navigator.pushNamed(context, AppRoutes.requisition_form_screen);
            },
          ),

          Divider(thickness: 1),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              'About',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.aboutPage);
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
              _showLogoutConfirmationDialog(context);
            },
          ),
          Divider(thickness: 1),
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutConfirmationDialog();
      },
    );
  }
}