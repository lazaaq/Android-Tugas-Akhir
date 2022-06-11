class PenghuniModel {
  int id;
  String nama;
  String asal;
  String kampus;
  String kamar;
  String no_hp;

  PenghuniModel({
    required this.id,
    required this.nama,
    required this.asal,
    required this.kampus,
    required this.kamar,
    required this.no_hp
  });

  //FORMAT TO JSON
  factory PenghuniModel.fromJson(Map<String, dynamic> json) => PenghuniModel(
    id: int.parse(json['id']),
    nama: json['nama'],
    asal: json['asal'],
    kampus: json['kampus'],
    kamar: json['kamar'],
    no_hp:  json['no_hp']
  );

  //PARSE JSON
}