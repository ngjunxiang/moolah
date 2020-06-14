import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moolah/components/bottom_navigation_bar_controller.dart';
import 'package:provider/provider.dart';

import './providers/transactions_provider.dart';
import './themes/style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MoolahApp());
}

class MoolahApp extends StatelessWidget {
  Widget _buildApp(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moolah!',
      theme: appTheme(),
      home: BottomNavigationBarController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TransactionsProvider(),
        ),
      ],
      child: _buildApp(context),
    );
  }
}
