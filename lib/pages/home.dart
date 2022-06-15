import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_kost/models/penghuni_model.dart';
import 'package:my_kost/pages/penghuni.dart';
import 'package:my_kost/pages/penghuni_add.dart';
import 'package:my_kost/pages/button.dart';
import 'package:my_kost/pages/penghuni_edit.dart';
import 'package:my_kost/providers/penghuni_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  String title;
  Home({this.title = 'My Kost'});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future <List<PenghuniModel>> futureData;
  // List<String> litems = ["1","2","Third","4"];

  @override
  void initState() {
    super.initState();
    futureData = getPenghuni();
    // print('builded');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        //automaticallyImplyLeading: true
        elevation: 0.0, // for elevation
        titleSpacing: 0.0, // if you want remove title spacing with back button
        title:  Center(
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text(
                "Hi, Siti!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.fromLTRB(30, 15, 0, 0),
              child: Text(
                "Ingin Ngapain?",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black54,
                  fontWeight: FontWeight.w800
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 20, 0, 0),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
                  child: IconButton(
                    icon: Image.asset('assets/images/Frame 1.png'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PenghuniAdd()));
                    },
                    iconSize: 150,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
                  child: IconButton(
                    icon: Image.asset('assets/images/Frame 2.png'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Penghuni()));
                    },
                    iconSize: 150,
                  ),
                ),
              ],
            )
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.fromLTRB(30, 15, 0, 15),
              child: Text(
                "Daftar Penghuni",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w800
                ),
              ),
            ),
          ),
          Flexible(
            child: FutureBuilder <List<PenghuniModel>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<PenghuniModel>? data = snapshot.data;
                  if (data != null) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 15),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: MyButton(penghuni: data[index]),
                              ),
                            ],
                          ),
                        );
                      }
                    );
                  }
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      )
    );
  }
}
