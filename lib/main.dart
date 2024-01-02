import 'package:flutter/material.dart';

import 'home_page.dart';
import 'orders_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MMDC Control Center',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        home: const IndexNavigation());
  }
}

class IndexNavigation extends StatefulWidget {
  const IndexNavigation({super.key});

  @override
  State<IndexNavigation> createState() => _IndexNavigationState();
}

class _IndexNavigationState extends State<IndexNavigation> {
  int _selectedIndex = 0;
  String _title = 'MMDC Control Center';

  void _passedFunction(String input) {
    // Print the input to the console
    // if (kDebugMode) {
    print(input);
    // }

    // Show a dialog with the input
    // showDialog(
    //     context: context,
    //     builder: (_) => Dialog(
    //           child: Container(
    //               width: 300,
    //               height: 200,
    //               color: Colors.amberAccent,
    //               child: Center(
    //                   child: Text(
    //                 input,
    //                 style: const TextStyle(fontSize: 24),
    //               ))),
    //         ));
  }

  final List<(BottomNavigationBarItem, Widget)> _widgetOptions = [
    (
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const HomePage()
    ),
    (
      const BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Orders'),
      OrdersPage()
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setTile(String title) {
    setState(() {
      _title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex].$2,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _widgetOptions.map((e) => e.$1).toList(),
        selectedIconTheme: const IconThemeData(color: Colors.black),
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        backgroundColor: Colors.yellow,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
