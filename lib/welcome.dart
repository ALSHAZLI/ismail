import 'package:flutter/material.dart';

class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: Container(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "جوالي العقارية",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "منصة إالكترونية لعقارات السودان",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CircleAvatar(
                backgroundColor: Colors.blueGrey.shade50,
                backgroundImage: AssetImage('assets/3.png'),
                radius: 70.0,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "   استعرض العقارات المتوفرة في مناطق السودان",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              Text(
                "      مرحبا بك  ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Register');
                    },
                    child: Text(
                      "سجل الان",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Login');
                    },
                    child: Text(
                      " قم بالدخول",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
