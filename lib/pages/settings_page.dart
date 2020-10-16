import 'package:flutter/material.dart';
import 'package:leimo/widgets/drawer.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Stack(
        children: [
          Center(
            child: Image.asset('assets/piotr-cichosz-uo8fBSwxk28-unsplash.jpg'),
          )
        ],
      )
    );
  }
}
