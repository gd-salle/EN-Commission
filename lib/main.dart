import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNC Property Management',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.loginPage,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
