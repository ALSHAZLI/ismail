import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ReadExamples extends StatefulWidget {
  const ReadExamples({Key? key}) : super(key: key);

  @override
  _ReadExamplesState createState() => _ReadExamplesState();
}

class _ReadExamplesState extends State<ReadExamples> {
  final _database = FirebaseDatabase.instance.reference();

  // String _displatText = 'Result Go here';
  // final _database = FirebaseDatabase.instance.reference();
  // @override
  // void initState() {
  //   super.initState();
  //   _actiavetListeners();
  // }

  // void _actiavetListeners() {
  //   _database.child('dayleySpechial/desc').onValue.listen((event) {
  //     final String desc = event.snapshot.value;
  //     setState(() {
  //       _displatText = 'Today\ spechal: ${desc}';
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Text(
              //     // style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              //     // textAlign: TextAlign.center,
              //     ),
              SizedBox(height: 50),
              StreamBuilder(
                stream: _database
                    .child('orders')
                    .orderByKey()
                    .limitToLast(10)
                    .onValue,
                builder: (context, snapshot) {
                  final tilesList = <ListTile>[];
                  if (snapshot.hasData) {
                    final myOrders = Map<String, dynamic>.from(
                        (snapshot.data! as Event).snapshot.value);
                     myOrders.forEach((key, value) {
                      final nextOrder = Map<String, dynamic>.from(value);
                      final orderTile = ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Details()),
                                // );
                                // Navigator.of(context)
                                //     .pushReplacementNamed('/Details');
                              },
                              child: Text(
                                nextOrder['type'],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade800),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        nextOrder['price'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.price_change,
                                        color: Colors.green.shade300,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "  م",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    nextOrder['space'],
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Icon(
                                                    Icons.space_bar,
                                                    color: Colors.blue.shade300,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                nextOrder['location'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(
                                                Icons.location_pin,
                                                color: Colors.blue.shade300,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: NetworkImage(nextOrder['img']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                      );

                      // leading: Icon(Icons.local_cafe),
                      // title: Text(nextOrder['type']),
                      // subtitle: Text(nextOrder['price']));
                      tilesList.add(orderTile);
                    });
                  }
                  return Expanded(
                      child: ListView(
                    children: tilesList,
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
