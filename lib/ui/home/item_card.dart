// ignore_for_file: prefer_const_constructors

import 'package:big_test/helper/app_scale.dart';
import 'package:flutter/material.dart';

import '../../model/card_model.dart';

class ItemsCard extends StatefulWidget {
  final Function(CardData) onDetail;
  final CardData model;
  const ItemsCard({
    required this.onDetail,
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemsCard> createState() => _ItemsCardState();
}

class _ItemsCardState extends State<ItemsCard> {
  CardData? model;
  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff2955FF),
                    ),
                    width: 16,
                    height: 16,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    (model?.kabAsal ?? "-").trim().replaceAll("Kota ", ""),
                    style: TextStyle(
                      color: Color(0xff00209D),
                      fontWeight: FontWeight.bold,
                      fontSize: context.scaleFont(12),
                    ),
                  ),
                ],
              ),
              Text(
                '-',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: context.scaleFont(14),
                ),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFB800),
                    ),
                    width: 16,
                    height: 16,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    (model?.kabTujuan ?? "-").trim().replaceAll("Kota ", ""),
                    style: TextStyle(
                      color: Color(0xff00209D),
                      fontWeight: FontWeight.bold,
                      fontSize: context.scaleFont(12),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          // Text("Status : ${(paging.totalData ?? 0)}"),
          Text(
            "Status : ${(model?.statusPengiriman ?? "-")}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.scaleFont(12),
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Tanggal Pengiriman : ${(model?.tglPengiriman ?? "-")}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.scaleFont(12),
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Jenis Truck : ${(model?.jenisKendaraan ?? "-")}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.scaleFont(10),
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => widget.onDetail(model ?? CardData()),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffFFA800),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 72,
                      vertical: 4,
                    ),
                    child: Text(
                      "Detail",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
