import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leimo/pages/tracker_page.dart';
import 'package:leimo/widgets/drawer.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  bool _visible = false;
  final crypto = TextEditingController();
  final fiat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Leimo'),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green[900],
                  width: 2
                ),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Text('Do you want to add a new currency?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.green[900]
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                    onPressed: () {
                      setState(() {
                        _visible = true;
                      });
                    },
                  child: Text('Yes',
                    style: TextStyle(
                      color: Colors.green[900]
                    ),
                  ),
                  elevation: 10,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 50.0,
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _visible = false;
                    });
                  },
                  child: Text('No',
                    style: TextStyle(
                    color: Colors.green[900]
                  ),
                  ),
                  elevation: 10,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green[900],
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Text('Which cryptocurrency do you want to add?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green[900]
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(
                              color: Colors.green[900],
                            ),
                            cursorColor: Colors.green[900],
                            textCapitalization: TextCapitalization.characters,
                            maxLength: 3,
                            decoration: InputDecoration(labelText: 'Cryptocurrency',hintText: 'BTC'),
                            controller: crypto,
                          ),
                          TextField(
                            textCapitalization: TextCapitalization.characters,
                            maxLength: 3,
                            controller: fiat,
                            decoration: InputDecoration(labelText: 'Fiat Currency',hintText: 'INR'),
                          ),
                          FlatButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return TrackerPage(
                                    Cryptocurrency: crypto.text,
                                    Fiatcurrency: fiat.text,
                                  );
                                }));
                              },
                              child: Text('Add Currency', style: TextStyle(fontWeight: FontWeight.bold),),
                            textColor: Colors.green[900],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
