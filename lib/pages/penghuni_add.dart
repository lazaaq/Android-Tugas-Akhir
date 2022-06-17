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
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        elevation: 0.0,
        title: Text(
          'Kembali',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 17
          ),
        ),
        // actions: <Widget>[
        // TextButton(
        //   child: Icon(Icons.save, color: Colors.black,),
        //   onPressed: () => submit(context),
        // )]
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                'Tambah Data Penyewa',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.black54
                )
              ),
            ),
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
                height: 50,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff868383))
                  ),
                  onPressed: () => submit(context),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
