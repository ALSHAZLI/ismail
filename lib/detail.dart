import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // width: ,
          // height: ,
          color: Colors.grey.shade300,
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    width: 500,
                    height: 150,
                    image: AssetImage('assets/office.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 20,
                    top: 10,
                    left: 220,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "شقة للبيع # ",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    top: 5,
                    left: 5,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/Depart');
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  height: 300,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "معلومات العقار",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade400,
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.blue.shade400,
                                thickness: 2,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "المساحة",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.space_bar,
                                size: 30,
                                color: Colors.blue.shade400,
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Text(
                                "السعر",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.price_change,
                                size: 30,
                                color: Colors.blue.shade400,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "250 م",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade400,
                                ),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                "150.0000.000",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Text(
                                  "الصالات",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.ac_unit_outlined,
                                size: 30,
                                color: Colors.blue.shade400,
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Text(
                                  " الغرف",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.room_preferences_sharp,
                                size: 30,
                                color: Colors.blue.shade400,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "5",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade400,
                                ),
                              ),
                              SizedBox(
                                width: 155,
                              ),
                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Text(
                                  " الحمامات",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.bathtub_rounded,
                                size: 30,
                                color: Colors.blue.shade400,
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                " المطابخ",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.kitchen,
                                size: 30,
                                color: Colors.blue.shade400,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade400,
                                ),
                              ),
                              SizedBox(
                                width: 155,
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "معلومات المالك",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade400,
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.blue.shade400,
                                thickness: 2,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "محمد علي عبد الشكور ",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.account_box,
                                size: 30,
                                color: Colors.blue.shade400,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "+2499524455",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.phone,
                                color: Colors.blue.shade400,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ytsa@gmail.com",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.email,
                                color: Colors.blue.shade400,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
