import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Confirm Logout"),
      content: Text("Are you sure you want to log out?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            // Perform logout action here
            Navigator.of(context).pop(true);
            Navigator.pushNamed(context, AppRoutes.loginPage);
          },
          child: Text("Logout"),
        ),
      ],
    );
  }
}
