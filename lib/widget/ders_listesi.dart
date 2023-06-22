import 'package:flutter/material.dart';
import 'package:flutter_yeni_proje/constants/app_constants.dart';
import 'package:flutter_yeni_proje/helper/data_helper.dart';
import 'package:flutter_yeni_proje/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({required this.onElemanCikarildi, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEkleneDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onElemanCikarildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                          (tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(1),
                        ),
                      ),
                      subtitle: Text(
                          '${tumDersler[index].krediDegeri} Kredi , Not değeri ${tumDersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Text(
            'Lütfen ders ekleyin.',
            style: Sabitler.baslikStyle,
            selectionColor: Colors.black,
          ));
  }
}
