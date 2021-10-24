import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '/tap.dart';

// import 'package:mob/GUI/login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final database = FirebaseDatabase.instance.reference();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

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
                controller: _emailcontroller,
                decoration: InputDecoration(
                  hintText: 'الايميل',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'عذرا الرجاء ادخال الايميل';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                textAlign: TextAlign.right,
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  hintText: 'كلمة المرور ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'عذرا الرجاء ادخال كلمة المرور';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  child: Text(
                    'انشاء الحساب ',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade700,
                  ),
                  onPressed: () async {
                    try {
                      var result = await dayleySpechialRlf.update({
                        "desc": _emailcontroller.text,
                        "price": _passwordcontroller.text
                      });
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
