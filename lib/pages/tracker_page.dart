import 'package:flutter/material.dart';
import '../models/exchange.dart';
import '../utilities/database_helper.dart';
import '../widgets/drawer.dart';
import '../utilities/coin_data.dart';

class TrackerPage extends StatefulWidget {
  final Cryptocurrency;
  final Fiatcurrency;

  TrackerPage({this.Cryptocurrency, this.Fiatcurrency});

  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  String val = '?';
  List _exchanges;
  var db = new DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addExchange(widget.Cryptocurrency, widget.Fiatcurrency);
  }

  void _addExchange(String Cryptocurrency, String Fiatcurrency) async
  {

    val = await CoinData().getCoinData(Cryptocurrency, Fiatcurrency);
    await db.saveMoney(Exchange(Cryptocurrency, Fiatcurrency, val));
    _exchanges = await db.getAllMoney();
  }

  /*_deleteExchange(int id, int index) async {
    debugPrint("Deleted Item!");

    await db.deleteMoney(id);
    setState(() {
      _exchanges.removeAt(index);
    });
  }*/
  
  /*void call()
  {
    Future.delayed(Duration(seconds: 4), (){
      _updateExchange(Exchange exchange, int index){
       Exchange newItemUpdated = Exchange.fromMap(
                  {"cryptocurrency": Exchange.cryptocurrency,
                    "value" : val,
                    "fiatcurrency": Exchange.fiatcurrency,
                    "id" : item.id
                  });
                   await db.updateMoney(newItemUpdated);
      }
    });
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Tracker'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: ListView.builder(
            itemCount: _exchanges.length,
            itemBuilder: (_ , int position){
              return Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('1', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green[900],
                              width: 2
                          )
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "${Exchange.fromMap(_exchanges[position]).cryptocurrency}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                    Text("=   ${Exchange.fromMap(_exchanges[position]).value}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green[900],
                              width: 2
                          )
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "${Exchange.fromMap(_exchanges[position]).fiatcurrency}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Icon(Icons.remove_circle_outline,
                        color: Colors.green[900],
                      ),
                      //onTap: _deleteExchange(Exchange.fromMap(_exchanges[position]).id, position),
                    )
                  ],
                ),
              );
            }),
      ),
      );
  }
}
