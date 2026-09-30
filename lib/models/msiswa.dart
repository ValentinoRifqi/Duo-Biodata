class SiswaModel {
  int? id;
  String nis;
  String nama;
  String tplahir;
  String tglahir; // format: yyyy-MM-dd
  String kelamin;
  String agama;
  String alamat;

  SiswaModel({
    this.id,
    required this.nis,
    required this.nama,
    required this.tplahir,
    required this.tglahir,
    required this.kelamin,
    required this.agama,
    required this.alamat,
  });

  factory SiswaModel.fromJson(Map<String, dynamic> json) {
    return SiswaModel(
      id: json['id']?.toInt(),
      nis: json['nis']?.toString() ?? '',
      nama: json['nama']?.toString() ?? '',
      tplahir: json['tplahir']?.toString() ?? '',
      tglahir: json['tglahir']?.toString() ?? '',
      kelamin: json['kelamin']?.toString() ?? '',
      agama: json['agama']?.toString() ?? '',
      alamat: json['alamat']?.toString() ?? '',
    );
  }
}