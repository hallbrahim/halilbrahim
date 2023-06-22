import 'package:flutter/material.dart';
import 'package:flutter_yeni_proje/model/ders.dart';

class DataHelper {
  static List<Ders> tumEkleneDersler = [];

  static dersEkle(Ders ders) {
    tumEkleneDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    for (var element in tumEkleneDersler) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    }

    return toplamNot / toplamKredi;
  }

  static List<String> _tumDerslerinHarfleri() {
    return ['AA', 'BA', 'BB', 'BC', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 6;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfleri()
        .map(
          (e) => DropdownMenuItem(
            // ignore: sort_child_properties_last
            child: Text(e),
            value: _harfiNotaCevir(e),
          ),
        )
        .toList();
  }

  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKrediler() {
    return _tumKrediler()
        .map(
          (e) => DropdownMenuItem(
            value: e.toDouble(),
            child: Text(
              e.toString(),
            ),
          ),
        )
        .toList();
  }
}
