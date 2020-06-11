import 'package:flutter/material.dart';
import 'package:moolah/screens/insurance/insurance_screen.dart';
import 'package:moolah/screens/investments/investments_screen.dart';

import '../screens/overview/overview_screen.dart';
import '../screens/transactions/transactions_screen.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
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

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).accentColor,
        selectedLabelStyle: Theme.of(context).textTheme.subtitle1,
        unselectedLabelStyle: Theme.of(context).textTheme.subtitle1,
        iconSize: 30,
        items: [
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
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: PageStorage(
          child: pages[_selectedIndex],
          bucket: bucket,
        ),
      ),
    );
  }
}
