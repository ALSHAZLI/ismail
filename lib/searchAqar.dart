import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'tap.dart';

// import 'package:mob/GUI/login.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final database = FirebaseDatabase.instance.reference();

  TextEditingController _typecontroller = TextEditingController();
  TextEditingController _locationcontroller = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    final dayleySpechialRlf = database.child('dayleySpechial/');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Center(child: Text('حساب جديد')),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                textAlign: TextAlign.right,
                controller: _typecontroller,
                decoration: InputDecoration(
                  hintText: 'نوع العقار',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'عذرا الرجاء ادخال نوع العقار';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                textAlign: TextAlign.right,
                controller: _locationcontroller,
                decoration: InputDecoration(
                  hintText: ' ادخل الموقع ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'عذرا الرجاء ادخال موقع العقار ';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  child: Text(
                    ' new Aqar ',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade700,
                  ),
                  onPressed: () async {
                    try {
                      final nextOrder = <String, dynamic>{
                        "type": _typecontroller.text,
                      };
                      await database
                          .child('orders')
                          .orderByChild("type")
                          .equalTo("_typecontroller")
                          .once()
                          .then((value) => print('order write sucsessfly${nextOrder}'))
                          .catchError(
                              (error) => print('false to write order${error}'));

                      print('scusess writing');

                      // ignore: unnecessary_null_comparison

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Depart()),
                      );
                    } catch (e) {
                      print('ther is error ${e}');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
