class CardData {
  String? noOrder;
  int? idOrder;
  int? idTransporter;
  int? idShipper;
  String? tglPengiriman;
  String? statusPengiriman;
  String? tglMuat;
  dynamic qty;
  dynamic bobotBarang;
  dynamic panjangBarang;
  dynamic lebarBarang;
  dynamic tinggiBarang;
  dynamic kategoriBarang;
  int? harga;
  String? namaPengirim;
  String? policeNo;
  String? brand;
  String? picFilePath;
  int? capacity;
  String? jenisKendaraan;
  int? idVehicle;
  String? provAsal;
  String? kabAsal;
  String? provTujuan;
  String? kabTujuan;
  int? idDriver;
  int? status;

  CardData(
      {this.noOrder,
      this.idOrder,
      this.idTransporter,
      this.idShipper,
      this.tglPengiriman,
      this.statusPengiriman,
      this.tglMuat,
      this.qty,
      this.bobotBarang,
      this.panjangBarang,
      this.lebarBarang,
      this.tinggiBarang,
      this.kategoriBarang,
      this.harga,
      this.namaPengirim,
      this.policeNo,
      this.brand,
      this.picFilePath,
      this.capacity,
      this.jenisKendaraan,
      this.idVehicle,
      this.provAsal,
      this.kabAsal,
      this.provTujuan,
      this.kabTujuan,
      this.idDriver,
      this.status});

  CardData.fromJson(Map<String, dynamic> json) {
    noOrder = json['no_order'];
    idOrder = json['id_order'];
    idTransporter = json['id_transporter'];
    idShipper = json['id_shipper'];
    tglPengiriman = json['tgl_pengiriman'];
    statusPengiriman = json['status_pengiriman'];
    tglMuat = json['tgl_muat'];
    qty = json['qty'];
    bobotBarang = json['bobot_barang'];
    panjangBarang = json['panjang_barang'];
    lebarBarang = json['lebar_barang'];
    tinggiBarang = json['tinggi_barang'];
    kategoriBarang = json['kategori_barang'];
    harga = json['harga'];
    namaPengirim = json['nama_pengirim'];
    policeNo = json['police_no'];
    brand = json['brand'];
    picFilePath = json['pic_file_path'];
    capacity = json['capacity'];
    jenisKendaraan = json['jenis_kendaraan'];
    idVehicle = json['id_vehicle'];
    provAsal = json['prov_asal'];
    kabAsal = json['kab_asal'];
    provTujuan = json['prov_tujuan'];
    kabTujuan = json['kab_tujuan'];
    idDriver = json['id_driver'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['no_order'] = noOrder;
    data['id_order'] = idOrder;
    data['id_transporter'] = idTransporter;
    data['id_shipper'] = idShipper;
    data['tgl_pengiriman'] = tglPengiriman;
    data['status_pengiriman'] = statusPengiriman;
    data['tgl_muat'] = tglMuat;
    data['qty'] = qty;
    data['bobot_barang'] = bobotBarang;
    data['panjang_barang'] = panjangBarang;
    data['lebar_barang'] = lebarBarang;
    data['tinggi_barang'] = tinggiBarang;
    data['kategori_barang'] = kategoriBarang;
    data['harga'] = harga;
    data['nama_pengirim'] = namaPengirim;
    data['police_no'] = policeNo;
    data['brand'] = brand;
    data['pic_file_path'] = picFilePath;
    data['capacity'] = capacity;
    data['jenis_kendaraan'] = jenisKendaraan;
    data['id_vehicle'] = idVehicle;
    data['prov_asal'] = provAsal;
    data['kab_asal'] = kabAsal;
    data['prov_tujuan'] = provTujuan;
    data['kab_tujuan'] = kabTujuan;
    data['id_driver'] = idDriver;
    data['status'] = status;
    return data;
  }
}
