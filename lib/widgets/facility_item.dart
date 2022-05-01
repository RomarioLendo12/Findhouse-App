import 'package:bwa_findhouse/theme.dart';
import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  final String imageUrl;
  final int jumlah;
  final String nama;

  FacilityItem({this.imageUrl, this.jumlah, this.nama});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
              text: '${jumlah} ',
              style: purpleTextStyle.copyWith(fontSize: 14),
              children: [
                TextSpan(
                    text: nama, style: greyTextStyle.copyWith(fontSize: 14))
              ]),
        ),
      ],
    );
  }
}
