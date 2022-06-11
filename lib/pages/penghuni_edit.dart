import 'package:my_kost/pages/penghuni.dart';
import 'package:flutter/material.dart';
import 'package:my_kost/providers/penghuni_provider.dart';
import 'package:provider/provider.dart';

class PenghuniEdit extends StatefulWidget {
  final int id;
  PenghuniEdit({required this.id});

  @override
  _PenghuniEditState createState() => _PenghuniEditState();
}

class _PenghuniEditState extends State<PenghuniEdit> {
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _asal = TextEditingController();
  final TextEditingController _kampus = TextEditingController();
  final TextEditingController _kamar = TextEditingController();
  final TextEditingController _no_hp = TextEditingController();
  bool _isLoading = false;

  final snackbarKey = GlobalKey<ScaffoldState>();

  FocusNode asalNode = FocusNode();
  FocusNode kampusNode = FocusNode();
  FocusNode kamarNode = FocusNode();
  FocusNode noHpNode = FocusNode();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<PenghuniProvider>(context, listen: false).findPenghuni(widget.id).then((response) {
        _nama.text = response.nama;
        _asal.text = response.asal;
        _kampus.text = response.kampus;
        _kamar.text = response.kamar;
        _no_hp.text = response.no_hp;
      });
    });
    super.initState();
  }

  void submit(BuildContext context) {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PenghuniProvider>(context, listen: false)
          .updatePenghuni(widget.id, _nama.text, _asal.text, _kampus.text, _kamar.text, _no_hp.text)
          .then((res) {
        if (res) {
          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
        } else {
          var snackbar = SnackBar(content: Text('Ops, Error. Hubungi Admin'),);
          snackbarKey.currentState?.showSnackBar(snackbar);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: snackbarKey,
      appBar: AppBar(
        title: Text('Edit Penghuni'),
        actions: <Widget>[
          TextButton(
            child: _isLoading
                ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
                : Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () => submit(context),
          )
        ],
      ),
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
                  ),
                ),
                hintText: 'Nama Lengkap',
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(asalNode);
              },
            ),
            TextField(
              controller: _asal,
              focusNode: asalNode,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'Gaji',
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(kampusNode);
              },
            ),
            TextField(
              controller: _kampus,
              focusNode: kampusNode,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'Gaji',
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(kampusNode);
              },
            ),
            TextField(
              controller: _kamar,
              focusNode: kamarNode,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'Gaji',
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(kamarNode);
              },
            ),
            TextField(
              controller: _no_hp,
              focusNode: noHpNode,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'Umur',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
