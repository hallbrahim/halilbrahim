import 'package:flutter/material.dart';
import 'package:flutter_yeni_proje/constants/app_constants.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster(
      {required this.ortalama, required this.dersSayisi, super.key});

  String get _dersSayisi =>
      dersSayisi > 0 ? '$dersSayisi ders girildi' : "ders seçiniz";

  String get _ortalama =>
      // ignore: unnecessary_string_interpolations
      ortalama >= 0 ? '${ortalama.toStringAsFixed(2)}' : '0.0';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _dersSayisi,
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
        Text(
          _ortalama,
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          'ortalama',
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
      ],
    );
  }
}
