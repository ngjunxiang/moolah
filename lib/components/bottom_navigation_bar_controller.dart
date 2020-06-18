import 'package:flutter/material.dart';

import '../screens/insurance/insurance_screen.dart';
import '../screens/investments/investments_screen.dart';
import '../screens/overview/overview_screen.dart';
import '../screens/transactions/transactions_screen.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> _pages = [
    OverviewScreen(
      key: PageStorageKey('Overview'),
    ),
    TransactionsScreen(
      key: PageStorageKey('Transactions'),
    ),
    InvestmentsScreen(
      key: PageStorageKey('Investments'),
    ),
    InsuranceScreen(
      key: PageStorageKey('Insurance'),
    ),
  ];
  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Theme.of(context).scaffoldBackgroundColor,
        selectedLabelStyle: Theme.of(context).textTheme.subtitle1,
        unselectedLabelStyle: Theme.of(context).textTheme.subtitle2,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_compact),
            title: const Text('Overview'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_atm),
            title: const Text('Transactions'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: const Text('Investments'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            title: const Text('Insurance'),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: _pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
