/// Status : 200
/// Message : "Berhasil Menampilkan Semua DataBook Buku"
/// data : [{"BukuID":4,"Deskripsi":"Buku ini sangat mengerikan banget loh,awas boss","CoverBuku":"http://192.168.43.21:8001/storage/images/coverbook/Miraculous.jpeg","Judul":"Miraculous","Penulis":"Anisa Ramadani","Penerbit":"Deland","TahunTerbit":"2024","JumlahHalaman":"214","Rating":0,"Total_ulasan":0,"Created At":"24 Apr 2024 15:58:27","JumlahRating":0,"JumlahPeminjam":0},{"BukuID":3,"Deskripsi":"Buku ini sangat mengerikan banget loh,awas boss","CoverBuku":"http://192.168.43.21:8001/storage/images/coverbook/Harry Potter.jpeg","Judul":"Harry Potter","Penulis":"Anisa Ramadani","Penerbit":"Deland","TahunTerbit":"2024","JumlahHalaman":"214","Rating":0,"Total_ulasan":0,"Created At":"24 Apr 2024 15:56:27","JumlahRating":0,"JumlahPeminjam":0}]

class ResponseBook {
  ResponseBook({
      this.status, 
      this.message, 
      this.data,});

  ResponseBook.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBook.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataBook>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// BukuID : 4
/// Deskripsi : "Buku ini sangat mengerikan banget loh,awas boss"
/// CoverBuku : "http://192.168.43.21:8001/storage/images/coverbook/Miraculous.jpeg"
/// Judul : "Miraculous"
/// Penulis : "Anisa Ramadani"
/// Penerbit : "Deland"
/// TahunTerbit : "2024"
/// JumlahHalaman : "214"
/// Rating : 0
/// Total_ulasan : 0
/// Created At : "24 Apr 2024 15:58:27"
/// JumlahRating : 0
/// JumlahPeminjam : 0

class DataBook {
  DataBook({
      this.bukuID, 
      this.deskripsi, 
      this.coverBuku, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.jumlahHalaman, 
      this.rating, 
      this.totalUlasan, 
      this.createdAt, 
      this.jumlahRating, 
      this.jumlahPeminjam,});

  DataBook.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    deskripsi = json['Deskripsi'];
    coverBuku = json['CoverBuku'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    jumlahHalaman = json['JumlahHalaman'];
    rating = json['Rating'];
    totalUlasan = json['Total_ulasan'];
    createdAt = json['Created At'];
    jumlahRating = json['JumlahRating'];
    jumlahPeminjam = json['JumlahPeminjam'];
  }
  int? bukuID;
  String? deskripsi;
  String? coverBuku;
  String? judul;
  String? penulis;
  String? penerbit;
  String? tahunTerbit;
  String? jumlahHalaman;
  int? rating;
  int? totalUlasan;
  String? createdAt;
  int? jumlahRating;
  int? jumlahPeminjam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Deskripsi'] = deskripsi;
    map['CoverBuku'] = coverBuku;
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['TahunTerbit'] = tahunTerbit;
    map['JumlahHalaman'] = jumlahHalaman;
    map['Rating'] = rating;
    map['Total_ulasan'] = totalUlasan;
    map['Created At'] = createdAt;
    map['JumlahRating'] = jumlahRating;
    map['JumlahPeminjam'] = jumlahPeminjam;
    return map;
  }

}