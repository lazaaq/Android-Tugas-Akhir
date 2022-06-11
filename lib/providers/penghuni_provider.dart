import 'package:flutter/material.dart';
import './../models/penghuni_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PenghuniProvider extends ChangeNotifier {
  List<PenghuniModel> _data = [];
  List<PenghuniModel> get dataPenghuni => _data;

  Future<List<PenghuniModel>> getPenghuni() async {
    final url = 'https://mykostapp.000webhostapp.com/penghuni.php';
    // final url = 'http://192.168.56.69/disa-api/penghuni.php';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _data = result.map<PenghuniModel>((json) => PenghuniModel.fromJson(json)).toList();
      return _data;
    } else {
      throw Exception();
    }
  }

  //ADD DATA
  Future<bool> storePenghuni(String nama, String asal, String kampus, String kamar, String no_hp) async {
    final url = 'https://mykostapp.000webhostapp.com/penghuni.php';
    // final url = 'http://192.168.56.69/disa-api/penghuni.php';
    final response = await http.post(Uri.parse(url), body: {
      'nama': nama,
      'asal': asal,
      'kampus': kampus,
      'kamar': kamar,
      'no_hp': no_hp,
    });

    final result = json.decode(response.body);
    if (result['status'] == 1) {
      notifyListeners();
      return true;
    }
    return false;
  }

  // SHOW DATA
  Future<PenghuniModel> findPenghuni(int id) async { // id ini harusnya integer keknya
    return _data.firstWhere((i) => i.id == id);
  }

  // UPDATE DATA
  Future<bool> updatePenghuni(int id, String nama, String asal, String kampus, String kamar, String no_hp) async {
    final url = 'https://mykostapp.000webhostapp.com/penghuni.php?id_update=' + id.toString();
    // final url = 'http://192.168.56.69/disa-api/penghuni.php?id_update=' + id.toString();

    final response = await http.post(Uri.parse(url), body: {
      'nama': nama,
      'asal': asal,
      'kampus': kampus,
      'kamar': kamar,
      'no_hp': no_hp,
    });

    final result = json.decode(response.body);
    if (result['status'] == 1) {
      notifyListeners();
      return true;
    }
    return false;
  }

  // DELETE DATA
  Future<bool> deletePenghuni(int id) async {
    final url = 'https://mykostapp.000webhostapp.com/penghuni.php?id_delete=' + id.toString();
    // final url = 'http://192.168.56.69/disa-api/penghuni.php?id_delete=' + id.toString();
    final response = await http.post(Uri.parse(url));

    final result = json.decode(response.body);
    if (result['status'] == 1) {
      notifyListeners();
      return true;
    }
    return false;
  }
}