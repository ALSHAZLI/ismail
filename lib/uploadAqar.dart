import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'tap.dart';

// import 'package:mob/GUI/login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final database = FirebaseDatabase.instance.reference();

  TextEditingController _typecontroller = TextEditingController();

  TextEditingController _spacecontroller = TextEditingController();
  TextEditingController _imgcontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
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
                controller: _spacecontroller,
                decoration: InputDecoration(
                  hintText: ' ادخل المساحة ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'عذرا الرجاء ادخال  المساحة';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                textAlign: TextAlign.right,
                controller: _imgcontroller,
                decoration: InputDecoration(
                  hintText: ' ادخل الصورة ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'عذرا الرجاء ادخال صورة العقار';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                textAlign: TextAlign.right,
                controller: _pricecontroller,
                decoration: InputDecoration(
                  hintText: ' ادخل السعر ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'عذرا الرجاء ادخال  سعر العقار';
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
                        "price": _pricecontroller.text,
                        "img": _imgcontroller.text,
                        "location": _locationcontroller.text,
                        "space": _spacecontroller.text,
                        "time": DateTime.now().millisecondsSinceEpoch
                      };
                      await database
                          .child('orders')
                          .push()
                          .set(nextOrder)
                          .then((value) => print('order write sucsessfly'))
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
