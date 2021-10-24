import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_100000/uploadAqar.dart';
import 'tap.dart';

// import 'package:mob/GUI/login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final database = FirebaseDatabase.instance.reference();
  final _auht = FirebaseAuth.instance;
  // late String txtname, txtpassword, txtemail, txtrole = '';
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _rolecontroller = TextEditingController();
  // final _formkey = GlobalKey<FormState>();
  // void _addUsers(String ID) {
  //   database
  //       .child(ID)
  //       .set({'name': _emailcontroller, 'role': _rolecontroller});
  // }

  void saveitm() {}

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
                  hintText: 'Enter your Password',
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
              // TextFormField(
              //   textAlign: TextAlign.right,
              //   controller: _rolecontroller,
              //   decoration: InputDecoration(
              //     hintText: 'Enter your role',
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'pleas inter valid role';
              //     }
              //   },
              // ),
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
                      UserCredential result =
                          await _auht.createUserWithEmailAndPassword(
                              email: _emailcontroller.text,
                              password: _passwordcontroller.text);
                      User? user = result.user;
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(user!.uid)
                          .set({'email': _emailcontroller.trim()});
                      // _auht
                      //     .createUserWithEmailAndPassword(
                      //         email: _emailcontroller.text,
                      //         password: _passwordcontroller.text)
                      //     .then((value) {
                      //   FirebaseFirestore.instance
                      //       .collection('Users')
                      //       .doc(value.user!.uid)
                      //       .set({'email': value.user!.email});
                      // });
                      // ignore: unnecessary_null_comparison

                      // var userID = user.uid;
                      // _addUsers(userID);
                      //admin@gmail.com
                      //pass = adminap
                      //admin2@gmail.com
                      //pass = adminis
                      //admin3@gmail.com
                      //pass = adminah

                      // await FirebaseAuth.instance
                      //     .createUserWithEmailAndPassword(
                      //         email: _emailcontroller.text,
                      //         password: _passwordcontroller.text);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );

                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Depart()),
                      //);
                      print('scusess adding user to database');

                      // ignore: unnecessary_null_comparison

                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Depart()),
                      //);
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
