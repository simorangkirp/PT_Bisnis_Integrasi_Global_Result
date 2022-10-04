class DetailModel {
  Detail? detail;
  Pengirim? pengirim;
  List<Penerima>? penerima;
  List<LogStatus>? logStatus;
  List<dynamic>? fotoMuatBarang;
  List<dynamic>? fotoBongkarBarang;

  DetailModel({this.detail, this.pengirim, this.penerima, this.logStatus, this.fotoMuatBarang, this.fotoBongkarBarang});

  DetailModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'] != null ? Detail.fromJson(json['detail']) : null;
    pengirim = json['pengirim'] != null ? Pengirim.fromJson(json['pengirim']) : null;
    if (json['penerima'] != null) {
      penerima = <Penerima>[];
      json['penerima'].forEach((v) {
        penerima!.add(Penerima.fromJson(v));
      });
    }
    if (json['log_status'] != null) {
      logStatus = <LogStatus>[];
      json['log_status'].forEach((v) {
        logStatus!.add(LogStatus.fromJson(v));
      });
    }
    if (json['foto_muat_barang'] != null) {
      fotoMuatBarang = <Null>[];
      json['foto_muat_barang'].forEach((v) {
        fotoMuatBarang!.add(v);
      });
    }
    if (json['foto_bongkar_barang'] != null) {
      fotoBongkarBarang = <Null>[];
      json['foto_bongkar_barang'].forEach((v) {
        fotoBongkarBarang!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (detail != null) {
      data['detail'] = detail!.toJson();
    }
    if (pengirim != null) {
      data['pengirim'] = pengirim!.toJson();
    }
    if (penerima != null) {
      data['penerima'] = penerima!.map((v) => v.toJson()).toList();
    }
    if (logStatus != null) {
      data['log_status'] = logStatus!.map((v) => v.toJson()).toList();
    }
    if (fotoMuatBarang != null) {
      data['foto_muat_barang'] = fotoMuatBarang!.map((v) => v.toJson()).toList();
    }
    if (fotoBongkarBarang != null) {
      data['foto_bongkar_barang'] = fotoBongkarBarang!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Detail {
  String? namaPerjanjian;
  int? idOrder;
  String? noOrder;
  int? idTransporter;
  int? idShipper;
  int? idTop;
  String? tglOrder;
  int? tipeSchedule;
  int? status;
  String? dateFrom;
  String? dateTo;
  int? tipeOrder;
  String? tipeLayanan;
  String? tipePengiriman;
  String? namaTransporter;
  dynamic imageTransporter;
  String? statusPengiriman;
  int? idOrderDetail;
  int? idProdukTransporter;
  String? noSuratJalan;
  String? tglPengiriman;
  int? totalHarga;
  int? harga;
  String? catatan;
  int? biayaLayananShipper;
  int? biayaLayananTransporter;
  int? ppnShipper;
  int? idDriver;
  String? namaDriver;
  String? emailDriver;
  String? nohpDriver;
  String? image;
  dynamic fotoBuktiFilepath;
  int? biayaBongkar;
  int? biayaInap;
  int? biayaKawalan;
  int? biayaAsuransi;
  int? flagRelease;
  dynamic fee;
  dynamic totalHargaToTransporter;
  int? flagInvoice;
  int? idRoute;
  int? est;
  String? kodeRoute;
  String? namaRoute;
  String? provAsal;
  String? kabAsal;
  String? provTujuan;
  String? kabTujuan;
  String? policeNo;
  String? brand;
  int? heigth;
  int? width;
  int? length;
  String? jenisKendaraan;
  int? capacity;
  String? imageTruck;
  int? jmlBayar;
  int? statusPembayaran;

  Detail(
      {this.namaPerjanjian,
      this.idOrder,
      this.noOrder,
      this.idTransporter,
      this.idShipper,
      this.idTop,
      this.tglOrder,
      this.tipeSchedule,
      this.status,
      this.dateFrom,
      this.dateTo,
      this.tipeOrder,
      this.tipeLayanan,
      this.tipePengiriman,
      this.namaTransporter,
      this.imageTransporter,
      this.statusPengiriman,
      this.idOrderDetail,
      this.idProdukTransporter,
      this.noSuratJalan,
      this.tglPengiriman,
      this.totalHarga,
      this.harga,
      this.catatan,
      this.biayaLayananShipper,
      this.biayaLayananTransporter,
      this.ppnShipper,
      this.idDriver,
      this.namaDriver,
      this.emailDriver,
      this.nohpDriver,
      this.image,
      this.fotoBuktiFilepath,
      this.biayaBongkar,
      this.biayaInap,
      this.biayaKawalan,
      this.biayaAsuransi,
      this.flagRelease,
      this.fee,
      this.totalHargaToTransporter,
      this.flagInvoice,
      this.idRoute,
      this.est,
      this.kodeRoute,
      this.namaRoute,
      this.provAsal,
      this.kabAsal,
      this.provTujuan,
      this.kabTujuan,
      this.policeNo,
      this.brand,
      this.heigth,
      this.width,
      this.length,
      this.jenisKendaraan,
      this.capacity,
      this.imageTruck,
      this.jmlBayar,
      this.statusPembayaran});

  Detail.fromJson(Map<String, dynamic> json) {
    namaPerjanjian = json['nama_perjanjian'];
    idOrder = json['id_order'];
    noOrder = json['no_order'];
    idTransporter = json['id_transporter'];
    idShipper = json['id_shipper'];
    idTop = json['id_top'];
    tglOrder = json['tgl_order'];
    tipeSchedule = json['tipe_schedule'];
    status = json['status'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    tipeOrder = json['tipe_order'];
    tipeLayanan = json['tipe_layanan'];
    tipePengiriman = json['tipe_pengiriman'];
    namaTransporter = json['nama_transporter'];
    imageTransporter = json['image_transporter'];
    statusPengiriman = json['status_pengiriman'];
    idOrderDetail = json['id_order_detail'];
    idProdukTransporter = json['id_produk_transporter'];
    noSuratJalan = json['no_surat_jalan'];
    tglPengiriman = json['tgl_pengiriman'];
    totalHarga = json['total_harga'];
    harga = json['harga'];
    catatan = json['catatan'];
    biayaLayananShipper = json['biaya_layanan_shipper'];
    biayaLayananTransporter = json['biaya_layanan_transporter'];
    ppnShipper = json['ppn_shipper'];
    idDriver = json['id_driver'];
    namaDriver = json['nama_driver'];
    emailDriver = json['email_driver'];
    nohpDriver = json['nohp_driver'];
    image = json['image'];
    fotoBuktiFilepath = json['foto_bukti_filepath'];
    biayaBongkar = json['biaya_bongkar'];
    biayaInap = json['biaya_inap'];
    biayaKawalan = json['biaya_kawalan'];
    biayaAsuransi = json['biaya_asuransi'];
    flagRelease = json['flag_release'];
    fee = json['fee'];
    totalHargaToTransporter = json['total_harga_to_transporter'];
    flagInvoice = json['flag_invoice'];
    idRoute = json['id_route'];
    est = json['est'];
    kodeRoute = json['kode_route'];
    namaRoute = json['nama_route'];
    provAsal = json['prov_asal'];
    kabAsal = json['kab_asal'];
    provTujuan = json['prov_tujuan'];
    kabTujuan = json['kab_tujuan'];
    policeNo = json['police_no'];
    brand = json['brand'];
    heigth = json['heigth'];
    width = json['width'];
    length = json['length'];
    jenisKendaraan = json['jenis_kendaraan'];
    capacity = json['capacity'];
    imageTruck = json['image_truck'];
    jmlBayar = json['jml_bayar'];
    statusPembayaran = json['status_pembayaran'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['nama_perjanjian'] = namaPerjanjian;
    data['id_order'] = idOrder;
    data['no_order'] = noOrder;
    data['id_transporter'] = idTransporter;
    data['id_shipper'] = idShipper;
    data['id_top'] = idTop;
    data['tgl_order'] = tglOrder;
    data['tipe_schedule'] = tipeSchedule;
    data['status'] = status;
    data['date_from'] = dateFrom;
    data['date_to'] = dateTo;
    data['tipe_order'] = tipeOrder;
    data['tipe_layanan'] = tipeLayanan;
    data['tipe_pengiriman'] = tipePengiriman;
    data['nama_transporter'] = namaTransporter;
    data['image_transporter'] = imageTransporter;
    data['status_pengiriman'] = statusPengiriman;
    data['id_order_detail'] = idOrderDetail;
    data['id_produk_transporter'] = idProdukTransporter;
    data['no_surat_jalan'] = noSuratJalan;
    data['tgl_pengiriman'] = tglPengiriman;
    data['total_harga'] = totalHarga;
    data['harga'] = harga;
    data['catatan'] = catatan;
    data['biaya_layanan_shipper'] = biayaLayananShipper;
    data['biaya_layanan_transporter'] = biayaLayananTransporter;
    data['ppn_shipper'] = ppnShipper;
    data['id_driver'] = idDriver;
    data['nama_driver'] = namaDriver;
    data['email_driver'] = emailDriver;
    data['nohp_driver'] = nohpDriver;
    data['image'] = image;
    data['foto_bukti_filepath'] = fotoBuktiFilepath;
    data['biaya_bongkar'] = biayaBongkar;
    data['biaya_inap'] = biayaInap;
    data['biaya_kawalan'] = biayaKawalan;
    data['biaya_asuransi'] = biayaAsuransi;
    data['flag_release'] = flagRelease;
    data['fee'] = fee;
    data['total_harga_to_transporter'] = totalHargaToTransporter;
    data['flag_invoice'] = flagInvoice;
    data['id_route'] = idRoute;
    data['est'] = est;
    data['kode_route'] = kodeRoute;
    data['nama_route'] = namaRoute;
    data['prov_asal'] = provAsal;
    data['kab_asal'] = kabAsal;
    data['prov_tujuan'] = provTujuan;
    data['kab_tujuan'] = kabTujuan;
    data['police_no'] = policeNo;
    data['brand'] = brand;
    data['heigth'] = heigth;
    data['width'] = width;
    data['length'] = length;
    data['jenis_kendaraan'] = jenisKendaraan;
    data['capacity'] = capacity;
    data['image_truck'] = imageTruck;
    data['jml_bayar'] = jmlBayar;
    data['status_pembayaran'] = statusPembayaran;
    return data;
  }
}

class Pengirim {
  int? idPickup;
  int? idOrder;
  int? idShipper;
  String? namaPengirim;
  String? noHp;
  String? alamat;
  String? prov;
  String? kab;
  String? kec;
  String? kel;
  int? kodePos;
  String? ktpPengirim;
  int? status;
  dynamic latPengirim;
  dynamic longPengirim;

  Pengirim(
      {this.idPickup,
      this.idOrder,
      this.idShipper,
      this.namaPengirim,
      this.noHp,
      this.alamat,
      this.prov,
      this.kab,
      this.kec,
      this.kel,
      this.kodePos,
      this.ktpPengirim,
      this.status,
      this.latPengirim,
      this.longPengirim});

  Pengirim.fromJson(Map<String, dynamic> json) {
    idPickup = json['id_pickup'];
    idOrder = json['id_order'];
    idShipper = json['id_shipper'];
    namaPengirim = json['nama_pengirim'];
    noHp = json['no_hp'];
    alamat = json['alamat'];
    prov = json['prov'];
    kab = json['kab'];
    kec = json['kec'];
    kel = json['kel'];
    kodePos = json['kode_pos'];
    ktpPengirim = json['ktp_pengirim'];
    status = json['status'];
    latPengirim = json['lat_pengirim'];
    longPengirim = json['long_pengirim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id_pickup'] = idPickup;
    data['id_order'] = idOrder;
    data['id_shipper'] = idShipper;
    data['nama_pengirim'] = namaPengirim;
    data['no_hp'] = noHp;
    data['alamat'] = alamat;
    data['prov'] = prov;
    data['kab'] = kab;
    data['kec'] = kec;
    data['kel'] = kel;
    data['kode_pos'] = kodePos;
    data['ktp_pengirim'] = ktpPengirim;
    data['status'] = status;
    data['lat_pengirim'] = latPengirim;
    data['long_pengirim'] = longPengirim;
    return data;
  }
}

class Penerima {
  int? idPenerima;
  int? idOrder;
  int? idShipper;
  String? namaPenerima;
  String? noHp;
  String? alamat;
  String? prov;
  String? kab;
  String? kec;
  String? kel;
  int? kodePos;
  int? status;
  String? ktpPenerima;
  List<DetailBarang>? detailBarang;

  Penerima(
      {this.idPenerima,
      this.idOrder,
      this.idShipper,
      this.namaPenerima,
      this.noHp,
      this.alamat,
      this.prov,
      this.kab,
      this.kec,
      this.kel,
      this.kodePos,
      this.status,
      this.ktpPenerima,
      this.detailBarang});

  Penerima.fromJson(Map<String, dynamic> json) {
    idPenerima = json['id_penerima'];
    idOrder = json['id_order'];
    idShipper = json['id_shipper'];
    namaPenerima = json['nama_penerima'];
    noHp = json['no_hp'];
    alamat = json['alamat'];
    prov = json['prov'];
    kab = json['kab'];
    kec = json['kec'];
    kel = json['kel'];
    kodePos = json['kode_pos'];
    status = json['status'];
    ktpPenerima = json['ktp_penerima'];
    if (json['detail_barang'] != null) {
      detailBarang = <DetailBarang>[];
      json['detail_barang'].forEach((v) {
        detailBarang!.add(DetailBarang.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id_penerima'] = idPenerima;
    data['id_order'] = idOrder;
    data['id_shipper'] = idShipper;
    data['nama_penerima'] = namaPenerima;
    data['no_hp'] = noHp;
    data['alamat'] = alamat;
    data['prov'] = prov;
    data['kab'] = kab;
    data['kec'] = kec;
    data['kel'] = kel;
    data['kode_pos'] = kodePos;
    data['status'] = status;
    data['ktp_penerima'] = ktpPenerima;
    if (detailBarang != null) {
      data['detail_barang'] = detailBarang!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailBarang {
  int? id;
  String? jenisBarang;
  dynamic berat;
  int? bobotBarang;
  String? keterangan;
  int? lebar;
  int? panjang;
  int? tinggi;
  int? nilaiBarang;
  int? qty;

  DetailBarang(
      {this.id, this.jenisBarang, this.berat, this.bobotBarang, this.keterangan, this.lebar, this.panjang, this.tinggi, this.nilaiBarang, this.qty});

  DetailBarang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenisBarang = json['jenis_barang'];
    berat = json['berat'];
    bobotBarang = json['bobot_barang'];
    keterangan = json['keterangan'];
    lebar = json['lebar'];
    panjang = json['panjang'];
    tinggi = json['tinggi'];
    nilaiBarang = json['nilai_barang'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['jenis_barang'] = jenisBarang;
    data['berat'] = berat;
    data['bobot_barang'] = bobotBarang;
    data['keterangan'] = keterangan;
    data['lebar'] = lebar;
    data['panjang'] = panjang;
    data['tinggi'] = tinggi;
    data['nilai_barang'] = nilaiBarang;
    data['qty'] = qty;
    return data;
  }
}

class LogStatus {
  String? namaStatus;
  String? tanggal;
  String? jam;

  LogStatus({this.namaStatus, this.tanggal, this.jam});

  LogStatus.fromJson(Map<String, dynamic> json) {
    namaStatus = json['nama_status'];
    tanggal = json['tanggal'];
    jam = json['jam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['nama_status'] = namaStatus;
    data['tanggal'] = tanggal;
    data['jam'] = jam;
    return data;
  }
}
