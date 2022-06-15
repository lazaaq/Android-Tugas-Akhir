import 'package:flutter/material.dart';
import 'package:my_kost/models/penghuni_model.dart';
import 'package:my_kost/pages/penghuni_edit.dart';
import 'package:my_kost/providers/penghuni_provider.dart';
import 'package:provider/provider.dart';

class MyButton extends StatelessWidget {
  get borderRadius => BorderRadius.circular(8.0);
  PenghuniModel penghuni;
  MyButton({required this.penghuni});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PenghuniEdit(
                id: penghuni.id,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(0.0),
          height: MediaQuery.of(context).size.width * .13,//MediaQuery.of(context).size.width * .08,
          width: MediaQuery.of(context).size.width,//MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
          ),
          child: Row(
            children: <Widget>[
              LayoutBuilder(builder: (context, constraints) {
                return Container(
                  height: constraints.maxHeight,
                  width: constraints.maxHeight,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: borderRadius,
                  ),
                  child: Center(
                      child: Text(
                        penghuni.kamar,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Poppins'
                        ),
                      )
                  ),
                );
              }),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                  ),
                  child: Text(
                    penghuni.nama,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.green
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