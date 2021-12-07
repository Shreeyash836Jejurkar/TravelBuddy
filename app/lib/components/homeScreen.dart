import 'package:app/components/screens/initialScreen.dart';
import 'package:app/components/utilities/navigationButtons.dart';
import 'package:flutter/material.dart';
import 'package:radial_button/widget/circle_floating_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.translate),
          title: Text("TravelBuddy"),
          backgroundColor: Colors.deepPurple),
      body: initialScreen(),
      floatingActionButton: CircleFloatingButton.floatingActionButton(
          items: itemsActionBar,
          color: Colors.deepPurple,
          icon: Icons.menu,
          duration: Duration(milliseconds: 250),
          curveAnim: Curves.easeInOut),
    );
  }
}
