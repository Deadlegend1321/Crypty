import 'package:flutter/material.dart';
import 'package:leimo/pages/currency_page.dart';
import 'package:leimo/pages/settings_page.dart';
import 'package:leimo/pages/tracker_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
              width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.green[900],
            child: Text(
                'Crypto',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.attach_money, size: 26,color: Colors.green[900]),
            title: Text('Currency',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return CurrencyPage();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on, size: 26,color: Colors.green[900]),
            title: Text('Tracker',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return TrackerPage();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 26,color: Colors.green[900]),
            title: Text('Settings',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return Settings();
              }));
            },
          )
        ],
      ),
    );
  }
}
