import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:mob/GUI/login.dart';
import 'detail.dart';

class Depart extends StatefulWidget {
  @override
  _DepartState createState() => _DepartState();
}

class _DepartState extends State<Depart> {
  late String _displatImg;
  final _database = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    super.initState();
    _actiavetListeners();
  }

  void _actiavetListeners() {
    _database.child('dayleySpechial/img').onValue.listen((event) {
      final String img = event.snapshot.value;
      setState(() {
        _displatImg = img;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: new AppBar(
            //title: new Text("التصنيفات"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => LoginScreen()),
                    //     );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      Text(" خروج"),
                    ],
                  )),
            ],
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.domain_sharp),
                  child: new Text("مكاتب"),
                ),
                Tab(
                  icon: Icon(Icons.apartment),
                  child: new Text("الشقق"),
                ),
                Tab(
                  icon: Icon(Icons.house),
                  child: new Text("منازل"),
                ),
                Tab(
                  icon: Icon(Icons.cabin),
                  child: new Text("الكل"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  height: 100,
                  width: 100,
                  child: ListView.builder(
                      itemCount: 1,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return departcard();
                      }),
                ),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return officecard();
                    }),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return house();
                    }),
              ),
              Container(
                height: 100,
                width: 100,
                child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return allcatogery();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget departcard() {
    return Card(
      child: SizedBox(
        height: 1950,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              // Text(
              //     // style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              //     // textAlign: TextAlign.center,
              //     ),
              // SizedBox(height: 900),
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

  Widget officecard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "شقة للبيع",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "150.0000.000",
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
                                        Text(
                                          "  200 م",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.space_bar,
                                          color: Colors.blue.shade300,
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          "الحلفاية مربع 10",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
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
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage("assets/shoqg.jpg"), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget house() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "منزل للبيع",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "150.0000.000",
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
                                        Text(
                                          "  200 م",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.space_bar,
                                          color: Colors.blue.shade300,
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          "الحلفاية مربع 10",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
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
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage("assets/house.jpg"), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget allcatogery() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "شقة للبيع",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "150.0000.000",
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
                                        Text(
                                          "  200 م",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.space_bar,
                                          color: Colors.blue.shade300,
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          "الحلفاية مربع 10",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
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
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage("assets/shoqg.jpg"), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



      // child: Card(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       //crossAxisAlignment: CrossAxisAlignment.end,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.end,
      //                 children: [
      //                   Text(
      //                     "شقة للبيع",
      //                     style: TextStyle(
      //                         fontSize: 20,
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.blue.shade800),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.end,
      //                       children: [
      //                         Row(
      //                           children: [
      //                             Text(
      //                               "150.0000.000",
      //                               style: TextStyle(
      //                                 fontSize: 16,
      //                                 fontWeight: FontWeight.bold,
      //                               ),
      //                             ),
      //                             Icon(
      //                               Icons.price_change,
      //                               color: Colors.green.shade300,
      //                             ),
      //                           ],
      //                         ),
      //                         Row(
      //                           children: [
      //                             Row(
      //                               children: [
      //                                 Row(
      //                                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                   children: [
      //                                     Text(
      //                                       "  200 م",
      //                                       style: TextStyle(
      //                                           fontSize: 15,
      //                                           fontWeight: FontWeight.bold),
      //                                     ),
      //                                     Icon(
      //                                       Icons.space_bar,
      //                                       color: Colors.blue.shade300,
      //                                     ),
      //                                     SizedBox(
      //                                       width: 30,
      //                                     ),
      //                                     Text(
      //                                       "الحلفاية مربع 10",
      //                                       style: TextStyle(
      //                                           fontSize: 15,
      //                                           fontWeight: FontWeight.bold),
      //                                     ),
      //                                     Icon(
      //                                       Icons.location_pin,
      //                                       color: Colors.blue.shade300,
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             )
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //         Container(
      //           width: 100,
      //           height: 100,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(5),
      //             image: DecorationImage(
      //                 image: AssetImage("assets/shoqg.jpg"), fit: BoxFit.cover),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
