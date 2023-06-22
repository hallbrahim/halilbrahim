import 'package:flutter/material.dart';
import 'package:flutter_yeni_proje/constants/app_constants.dart';
import 'package:flutter_yeni_proje/widget/ortalama_hesapal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "dinamik ortalama hesapla",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Sabitler.anaRenk,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const OrtalamaHesaplaPage(),
    );
  }
}
