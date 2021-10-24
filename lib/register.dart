import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'tap.dart';

// import 'package:mob/GUI/login.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    
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
                  hintText: 'pleas inter your Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'pleas inter valid Email';
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
                  hintText: 'Enter your password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'pleas inter valid password';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  child: Text(
                    'login',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade700,
                  ),
                  onPressed: () async {
                    try {
                      

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
