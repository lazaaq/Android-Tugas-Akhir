import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        //automaticallyImplyLeading: true
        elevation: 0.0, // for elevation
        titleSpacing: 0.0, // if you want remove title spacing with back button
        title:  Center(
          child: Text(
            'MyKost',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Text('+'), onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PenghuniAdd()));
      },),
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<PenghuniProvider>(context, listen: false).getPenghuni(),
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.all(10),
          child: FutureBuilder(
            future: Provider.of<PenghuniProvider>(context, listen: false).getPenghuni(),
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
                    return GestureDetector(
                      onTap: () => seeDetails(context, data.dataPenghuni[i]),
                      child: Card(
                        elevation: 8,
                        child: ListTile(
                          title: Text(data.dataPenghuni[i].nama),
                          subtitle: Text('Asal : ${data.dataPenghuni[i].asal}'),
                          trailing: Text('Kampus : ${data.dataPenghuni[i].kampus}'),
                        ),
                        color: Colors.white,
                      ),
                    );
                  });
                },
              );
            }
          ),
        ),
      ),
    );
  }

  void seeDetails(BuildContext context, PenghuniModel penghuni) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PenghuniDetail(penghuni: penghuni,)));
  }
}
