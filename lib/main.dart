import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'views/merchant_dashboard_view.dart';

void main() {
  runApp(const AtlasMerchantApp());
}

class AtlasMerchantApp extends StatelessWidget {
  const AtlasMerchantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATLAS Marchand',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MerchantDashboardView(),
    );
  }
}
