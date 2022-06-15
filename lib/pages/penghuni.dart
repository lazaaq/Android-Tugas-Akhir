import 'package:flutter/material.dart';
import 'package:my_kost/api/notification_api.dart';
import 'package:my_kost/pages/penghuni_edit.dart';
import 'package:provider/provider.dart';
import './../providers/penghuni_provider.dart';
import 'package:my_kost/models/penghuni_model.dart';
import 'package:my_kost/pages/penghuni_add.dart';
import 'package:my_kost/pages/penghuni_detail.dart';

class Penghuni extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0.0, // for elevation
        titleSpacing: 0.0, // if you want remove title spacing with back button
        title:  Text(
          'Kembali',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 17
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(child: Text('+'), onPressed: () {
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PenghuniAdd()));
      // },),
      body: RefreshIndicator(
        onRefresh: () => Provider.of<PenghuniProvider>(context).getPenghuni(),
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.all(10),
          child: FutureBuilder(
            future: Provider.of<PenghuniProvider>(context, listen: false)
                .getPenghuni(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer<PenghuniProvider>(
                builder: (context, data, _) {
                  return ListView.builder(
                    itemCount: data.dataPenghuni.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PenghuniEdit(
                                id: data.dataPenghuni[i].id,
                              ),
                            ),
                          );
                        },
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (DismissDirection direction) async {
                            final bool res = await showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Konfirmasi'),
                                content: Text('Kamu Yakin?'),
                                actions: <Widget>[
                                  FlatButton(onPressed: () => Navigator.of(context).pop(true), child: Text('HAPUS'),),
                                  FlatButton(onPressed: () => Navigator.of(context).pop(false), child: Text('BATALKAN'),)
                                ],
                              );
                            });
                            return res;
                          },
                          onDismissed: (value) {
                            Provider.of<PenghuniProvider>(context, listen: false).deletePenghuni(data.dataPenghuni[i].id);
                          },
                          child: Card(
                            color: Colors.greenAccent,
                            elevation: 8,
                            child: ListTile(
                              title: Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  data.dataPenghuni[i].nama,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                              subtitle: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Asal: ${data.dataPenghuni[i].asal}',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Kampus: ${data.dataPenghuni[i].kampus}',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'No Handphone: ${data.dataPenghuni[i].no_hp}',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Text(
                                  "Kamar: ${data.dataPenghuni[i].kamar}"),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void seeDetails(BuildContext context, PenghuniModel penghuni) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PenghuniDetail(penghuni: penghuni,)));
  }
}
