// ignore_for_file: prefer_const_constructors

import 'package:big_test/helper/app_scale.dart';
import 'package:flutter/material.dart';

import '../../model/details_model.dart';

class ItemDetails extends StatefulWidget {
  final DetailModel? model;
  const ItemDetails({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Detail Pesanan",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Color(0xff00209D),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade400,
        actions: [
          SizedBox(
            width: context.deviceWidth() * 0.14,
          ),
        ],
      ),
      body: SafeArea(
        child: ItemDetailsBody(model: widget.model),
      ),
    );
  }
}

class ItemDetailsBody extends StatefulWidget {
  final DetailModel? model;
  const ItemDetailsBody({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemDetailsBody> createState() => _ItemDetailsBodyState();
}

class _ItemDetailsBodyState extends State<ItemDetailsBody> {
  List<Penerima> listPenerima = [];
  List<DetailBarang> listBarang = [];
  @override
  void initState() {
    if (widget.model?.penerima?.isNotEmpty == true) {
      if (widget.model?.penerima is List) {
        for (var item in widget.model!.penerima!) {
          listPenerima.add(item);
        }
      }
    }
    if (listPenerima.isNotEmpty) {
      for (var item in listPenerima) {
        if (item.detailBarang?.isNotEmpty == true) {
          for (var items in item.detailBarang!) {
            listBarang.add(items);
          }
        }
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Column(
                    children: [
                      Container(
                        height: context.deviceWidth() * 0.3,
                        width: context.deviceWidth() * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Builder(builder: (context) {
                          return Image.network(
                            widget.model?.detail?.imageTruck ?? "",
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 24,
                              );
                            },
                            fit: BoxFit.fill,
                          );
                        }),
                      ),
                      Text(
                        'Detail Kendaraan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.scaleFont(10),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#${(widget.model?.detail?.noOrder ?? "-")}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: context.scaleFont(12),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff2955FF),
                            ),
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            (widget.model?.detail?.kabAsal ?? "-").trim().replaceAll("Kota ", ""),
                            style: TextStyle(
                              color: Color(0xff00209D),
                              fontWeight: FontWeight.bold,
                              fontSize: context.scaleFont(12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFFB800),
                            ),
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            (widget.model?.detail?.kabTujuan ?? "-").trim().replaceAll("Kota ", ""),
                            style: TextStyle(
                              color: Color(0xff00209D),
                              fontWeight: FontWeight.bold,
                              fontSize: context.scaleFont(12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Tanggal Pengiriman',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: context.scaleFont(12),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        (widget.model?.detail?.tglPengiriman ?? "-"),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Color(0xff47BDFF),
                          fontSize: context.scaleFont(12),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Term Of Payment',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: context.scaleFont(12),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        (widget.model?.detail?.tipeLayanan ?? "-"),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff47BDFF),
                          fontStyle: FontStyle.italic,
                          fontSize: context.scaleFont(12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Jenis Kendaraan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.scaleFont(10),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: context.scaleFont(10),
                        ),
                        Text(
                          (widget.model?.detail?.jenisKendaraan ?? "-"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.scaleFont(10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Muatan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.scaleFont(10),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: context.scaleFont(10),
                        ),
                        Text(
                          "${((widget.model?.detail?.capacity ?? 0) / 1000).toString()} Ton",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.scaleFont(10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Tipe Pengiriman',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.scaleFont(10),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: context.scaleFont(10),
                        ),
                        Text(
                          (widget.model?.detail?.tipePengiriman ?? "-"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.scaleFont(10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.scaleFont(10),
                      ),
                    ),
                    Text(
                      (widget.model?.detail?.statusPengiriman ?? "-"),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.scaleFont(12),
                        color: Color(0xff47BDFF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 4),
                child: Text(
                  'Alamat Pengirim',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: context.scaleFont(10),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      (widget.model?.pengirim?.alamat ?? '-'),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.scaleFont(12),
                      ),
                    ),
                    Text(
                      'Nama   : ${widget.model?.pengirim?.namaPengirim ?? '-'}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.scaleFont(10),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      'Kontak : ${widget.model?.pengirim?.noHp ?? '-'}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.scaleFont(10),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  (widget.model?.pengirim?.kec ?? '-'),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: context.scaleFont(12),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 4),
                child: Text(
                  'Alamat Penerima',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: context.scaleFont(10),
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: listPenerima.isNotEmpty ? listPenerima.length : 1,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, i) {
              return penerimaCard(
                listPenerima[i],
              );
            },
          ),
          // penerimaCard(context),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 4),
                child: Text(
                  'Detail Barang',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: context.scaleFont(10),
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: listBarang.isNotEmpty ? listBarang.length : 1,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, i) {
              return barangCard(
                listBarang[i],
              );
            },
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 4),
                child: Text(
                  'Pengemudi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: context.scaleFont(10),
                  ),
                ),
              ),
            ],
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: context.deviceWidth() * 0.3,
                  width: context.deviceWidth() * 0.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xff47BDFF),
                    ),
                  ),
                  child: Builder(builder: (context) {
                    return Image.network(
                      widget.model?.detail?.image ?? "",
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 24,
                        );
                      },
                      fit: BoxFit.fill,
                    );
                  }),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.model?.detail?.namaDriver ?? "-",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.scaleFont(12),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.model?.detail?.emailDriver ?? "-",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.scaleFont(10),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.model?.detail?.nohpDriver ?? "-",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.scaleFont(12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32, bottom: 4),
                child: Text(
                  'Catatan',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: context.scaleFont(16),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: double.maxFinite,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.model?.detail?.catatan ?? "-",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: context.scaleFont(12),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: double.maxFinite,
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Tarif Pengiriman',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.scaleFont(10),
                      ),
                    ),
                    Text(
                      (widget.model?.detail?.totalHarga ?? 0).toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.scaleFont(16),
                        fontStyle: FontStyle.italic,
                        color: Color(0xffFFB800),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xff00209D),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                  child: Text(
                    "Lihat Surat Jalan",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: context.scaleFont(12),
                      color: Color(0xff00209D),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget barangCard(DetailBarang model) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Kategori: ${(model.jenisBarang ?? "-")}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: context.scaleFont(10),
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Jumlah: ${(model.qty ?? "-").toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: context.scaleFont(10),
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Bobot(Kg/pcs): ${(model.bobotBarang ?? "-").toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: context.scaleFont(10),
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Panjang(cm/pcs): ${(model.panjang ?? "-").toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: context.scaleFont(10),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 54,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Lebar(cm/pcs): ${(model.lebar ?? "-").toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: context.scaleFont(10),
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Tinggi(cm): ${(model.tinggi ?? "-").toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: context.scaleFont(10),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget penerimaCard(Penerima? model) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                model?.alamat ?? "-",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: context.scaleFont(12),
                ),
              ),
              Text(
                'Nama   : ${(model?.namaPenerima ?? "-")}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: context.scaleFont(10),
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Kontak : ${(model?.noHp ?? "-")}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: context.scaleFont(10),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            model?.kec ?? "-",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: context.scaleFont(12),
            ),
          ),
        ],
      ),
    );
  }
}
