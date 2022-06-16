import 'package:flutter/material.dart';
import 'package:my_kost/providers/penghuni_provider.dart';
import 'package:provider/provider.dart';

class PenghuniAdd extends StatelessWidget {
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _asal = TextEditingController();
  final TextEditingController _kampus = TextEditingController();
  final TextEditingController _kamar = TextEditingController();
  final TextEditingController _no_hp = TextEditingController();

  void submit(BuildContext context) {
    Provider.of<PenghuniProvider>(context, listen: false)
        .storePenghuni(_nama.text, _asal.text, _kampus.text, _kamar.text, _no_hp.text)
        .then((res) {
      if(res) {
        Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      } else {
        // ALERT
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Penghuni'),
        actions: <Widget>[
        TextButton(
          child: Icon(Icons.save, color: Colors.white,),
          onPressed: () => submit(context),
        )
      ]),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _nama,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  )
                ),
                labelText: 'Nama Lengkap'
              ),
            ),
            TextField(
              controller: _asal,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      )
                  ),
                  labelText: 'Asal Kota'
              ),
            ),
            TextField(
              controller: _kampus,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      )
                  ),
                  labelText: 'Asal Kampus'
              ),
            ),
            TextField(
              controller: _kamar,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      )
                  ),
                  labelText: 'Nomor Kamar'
              ),
            ),
            TextField(
              controller: _no_hp,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      )
                  ),
                  labelText: 'Nomor Handphone'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
