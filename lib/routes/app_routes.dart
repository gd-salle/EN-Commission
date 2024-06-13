import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/landing_screen.dart';
import '../screens/about_screen.dart';
import '../screens/material_monitoring_screen.dart';
import '../screens/material_add_screen.dart';
import '../screens/material_transfer_slip_form_screen.dart';
import '../screens/material_transfer_slip_receipt_screen.dart';
import '../screens/requisition_form_screen.dart';
import '../screens/requisition_receipt_screen.dart';

class AppRoutes {
  static const String loginPage = '/login';
  static const String registrationPage = '/register';
  static const String landingPage = '/';
  static const String aboutPage = '/about';
  static const String materialMonitoringPage = '/material_monitoring';
  static const String materialAddPage = '/material_add';
  static const String materialTransferSlipPage = '/material-transfer-slip-form';
  static const String materialTransferSlipReceiptPage = '/material-transfer-slip-receipt';
  static const String requisition_form_screen = '/requisition_form';
  static const String requisition_receipt_screen = '/requisition_receipt';
  static final routes = <String, WidgetBuilder>{
    loginPage: (context) => LoginScreen(),
    registrationPage: (context) => RegistrationScreen(),
    landingPage: (context) => LandingPage(),
    aboutPage: (context) => AboutPage(),
    materialMonitoringPage: (context) => MaterialMonitoringScreen(),
    materialAddPage: (context) => MaterialAddScreen(),
    materialTransferSlipPage: (context) => MaterialTransferSlipFormScreen(),
    materialTransferSlipReceiptPage: (context) => MaterialTransferSlipReceiptScreen(),
    requisition_form_screen:(context) => RequisitionFormScreen(),
    requisition_receipt_screen:(context) => RequisitionReceiptScreen(),

  };
}
