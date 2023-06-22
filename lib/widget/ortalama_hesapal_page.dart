import 'package:flutter/material.dart';
import 'package:flutter_yeni_proje/constants/app_constants.dart';
import 'package:flutter_yeni_proje/helper/data_helper.dart';
import 'package:flutter_yeni_proje/model/ders.dart';
import 'package:flutter_yeni_proje/widget/ders_listesi.dart';
import 'ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(
          child: Text(
            Sabitler.baslikText,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    dersSayisi: DataHelper.tumEkleneDersler.length,
                    ortalama: DataHelper.ortalamaHesapla()),
              )
            ],
          ),
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index) {
                DataHelper.tumEkleneDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: _buildHarfler(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: _buildKrediler(),
                ),
              ),
              IconButton(
                onPressed: _dersEkleVeOrtalamaHesapla,
                icon: const Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.isEmpty) {
          return 'ders adını giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: 'Matematik',
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.withOpacity(0.2)),
    );
  }

  _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        onChanged: (deger) => setState(() {
          secilenHarfDegeri = deger!;
          // ignore: avoid_print
          print(deger);
        }),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }

  _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        onChanged: (deger) => setState(() {
          secilenKrediDegeri = deger!;
          // ignore: avoid_print
          print(deger);
        }),
        items: DataHelper.tumDerslerinKrediler(),
      ),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
