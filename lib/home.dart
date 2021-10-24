import 'package:flutter/material.dart';
import 'package:flutter_application_100000/login.dart';
import 'package:flutter_application_100000/welcome.dart';
import 'newtap.dart';
import 'uploadAqar.dart';
// import 'admin.dart';

import 'read.dart';
import 'write.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("fimely worck"),
                SizedBox(height: 6, width: MediaQuery.of(context).size.width),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReadExamples()),
                      );
                    },
                    child: Text('read Example')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WriteExamples()),
                      );
                    },
                    child: Text('Write Example')),
                       ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login()),
                      );
                    },
                    child: Text('LOGIN')),
                    ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Hello()),
                      );
                    },
                    child: Text('Welcome Page')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Depart()),
                      );
                    },
                    child: Text('Depart Example')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text('Admin upload Page'))
              ],
            ),
          )),
    );
  }
}
