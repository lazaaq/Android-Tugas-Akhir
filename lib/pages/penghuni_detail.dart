import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_kost/providers/penghuni_provider.dart';
import 'package:my_kost/pages/penghuni.dart';
import 'package:my_kost/pages/penghuni_edit.dart';
import 'package:my_kost/models/penghuni_model.dart';

class PenghuniDetail extends StatelessWidget {
  PenghuniModel penghuni;
  PenghuniDetail({
    required this.penghuni
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Data Penghuni'),
      ),
      body: Column(
        children: <Widget> [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Table(
              border: TableBorder.all(color: Colors.black),
              children: [
                TableRow(children: [
                  Text('Nama'),
                  Text(this.penghuni.nama),
                ]),
                TableRow(children: [
                  Text('Asal'),
                  Text(this.penghuni.asal),
                ]),
                TableRow(children: [
                  Text('Kampus'),
                  Text(this.penghuni.kampus),
                ]),
                TableRow(children: [
                  Text('Kamar'),
                  Text(this.penghuni.kamar),
                ]),
                TableRow(children: [
                  Text('No HP'),
                  Text(this.penghuni.no_hp),
                ]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextButton(
              child: Text(
                'Edit Data',
                style: TextStyle(color: Colors.black)
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              onPressed: () => editData(context, penghuni),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextButton(
              child: Text(
                  'Hapus Data',
                  style: TextStyle(color: Colors.black)
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              onPressed: () => hapusData(context),
            ),
          ),
        ]
      )
    );
  }

  void editData(BuildContext context, PenghuniModel penghuni) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PenghuniEdit(id: this.penghuni.id)));
  }

  void hapusData(BuildContext context) {
    Provider.of<PenghuniProvider>(context, listen: false)
        .deletePenghuni(this.penghuni.id)
        .then((res) {
      if(res) {
        Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      } else {
        // ALERT
      }
    });
  }
}
