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
import '../screens/view_monitoring_screen.dart';
import '../models/material_transfer_slip.dart';
import '../models/material_sheet.dart';

class AppRoutes {
  static const String loginPage = '/login';
  static const String registrationPage = '/register';
  static const String landingPage = '/';
  static const String aboutPage = '/about';
  static const String materialMonitoringPage = '/material_monitoring';
  static const String materialAddPage = '/material_add';
  static const String materialTransferSlipPage = '/material-transfer-slip-form';
  static const String requisitionFormScreen = '/requisition_form';
  static const String requisitionReceiptScreen = '/requisition_receipt';

  static const String materialTransferSlipForm = '/material-transfer-slip-form';
  static const String materialTransferSlipReceipt = '/material-transfer-slip-receipt';

  static const String materialMonitoringScreen = '/materialMonitoring';
  static const String viewMonitoringScreen = '/viewMonitoring';
  static const String materialTransferSlipFormScreen = '/materialTransferSlipForm';
  
    static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case materialTransferSlipForm:
        return MaterialPageRoute(builder: (_) => MaterialTransferSlipFormScreen());
      case materialTransferSlipReceipt:
        final slip = settings.arguments as MaterialTransferSlip;
        return MaterialPageRoute(builder: (_) => MaterialTransferSlipReceiptScreen(slip: slip));
      case AppRoutes.requisitionReceiptScreen:
        final requisitionData = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => RequisitionReceiptScreen(),
          settings: RouteSettings(arguments: requisitionData),
        );
      case materialMonitoringScreen:
        return MaterialPageRoute(builder: (_) => MaterialMonitoringScreen());
      case viewMonitoringScreen:
        final materialSheet = settings.arguments as MaterialSheet;
        return MaterialPageRoute(builder: (_) => ViewMonitoringScreen(materialSheet: materialSheet));
      case materialTransferSlipFormScreen:
        return MaterialPageRoute(builder: (_) => MaterialTransferSlipFormScreen());
      default:
        return MaterialPageRoute(builder: (_) => MaterialTransferSlipFormScreen());
    }
  }
  
  static final routes = <String, WidgetBuilder>{
    loginPage: (context) => LoginScreen(),
    registrationPage: (context) => RegistrationScreen(),
    landingPage: (context) => LandingPage(),
    aboutPage: (context) => AboutPage(),
    materialMonitoringPage: (context) => MaterialMonitoringScreen(),
    materialAddPage: (context) => MaterialAddScreen(),
    materialTransferSlipPage: (context) => MaterialTransferSlipFormScreen(),
    requisitionFormScreen:(context) => RequisitionFormScreen(),
    requisitionReceiptScreen:(context) => RequisitionReceiptScreen(),
    // viewMonitoringScreen:(context) => ViewMonitoringScreen(),
  };


}
