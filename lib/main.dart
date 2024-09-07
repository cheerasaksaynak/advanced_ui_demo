import 'package:advanced_ui_demo/pages/blurry_container.dart';
import 'package:advanced_ui_demo/pages/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

void main() {
  runApp(const MainApp());
}

List<TabItem> tabItems = List.of([
  TabItem(Icons.home, "Home", Colors.blue,
      labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
  TabItem(Icons.layers, "Reports", Colors.red, circleStrokeColor: Colors.black),
  TabItem(Icons.search, "Search", Colors.orange,
      labelStyle:
          const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
  TabItem(Icons.notifications, "Notifications", Colors.cyan),
]);

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int selectedPos = 0;
  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: _buildTabContent(selectedPos),
        ),
        bottomNavigationBar: CircularBottomNavigation(
          tabItems,
          controller: _navigationController,
          selectedCallback: (selectedPos) {
            setState(() {
              this.selectedPos = selectedPos ?? 0;
            });
          },
        ),
      ),
    );
  }
}

Widget _buildTabContent(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return const Center(child: BlurContainerPage());
    case 1:
      return const Center(child: CircularSeekBarExamplePage());
    case 2:
      return const Center(
          child: Text('Search Screen',
              style: TextStyle(
                color: Colors.white,
              )));
    case 3:
      return const Center(
          child: Text('Notifications Screen',
              style: TextStyle(
                color: Colors.white,
              )));
    default:
      return const Center(
          child: Text('Hello!!!',
              style: TextStyle(
                color: Colors.white,
              )));
  }
}
