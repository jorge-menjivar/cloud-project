import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen();

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  SettingsScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('hello'),
      ),
    );
  }
}
