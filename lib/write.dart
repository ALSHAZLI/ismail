import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class WriteExamples extends StatefulWidget {
  const WriteExamples({Key? key}) : super(key: key);

  @override
  _WriteExamplesState createState() => _WriteExamplesState();
}

class _WriteExamplesState extends State<WriteExamples> {
  final database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    final dayleySpechialRlf = database.child('van/');
    return Scaffold(
      appBar: AppBar(
        title: Text('write example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await dayleySpechialRlf.set({
                        "desc": "vaaandeeek9999999",
                        "price": 8.9,
                        "img": "https://pbs.twimg.com/media/E5o2hDoX0AEBBuZ.jpg"
                      });
                      print('scusess writing');
                    } catch (e) {
                      print('ther is error ${e}');
                    }
                  },
                  child: Text('set to database'))
            ],
          ),
        ),
      ),
    );
  }
}
