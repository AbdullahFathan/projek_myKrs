import 'package:flutter/material.dart';

import '../models/data_dummy.dart';
import '../util/color_textstyle.dart';

class PlanJadwalWidget extends StatefulWidget {
  const PlanJadwalWidget({super.key});

  @override
  State<PlanJadwalWidget> createState() => _PlanJadwalWidgetState();
}

class _PlanJadwalWidgetState extends State<PlanJadwalWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            // HEADER COLUMN 1 TABEL
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _rowPertama("Senin"),
                _rowPertama("Selasa"),
                _rowPertama("Rabu"),
                _rowPertama("Kamis"),
                _rowPertama("Jumat"),
              ],
            )),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _builderTabel(rekomendataSenin),
                _builderTabel(rekomendataSelasa),
                _builderTabel(rekomendataRabu),
                _builderTabel(rekomendataKamis),
                _builderTabel(rekomendataJumat),
              ],
            ))
      ],
    );
  }

  Widget _builderTabel(List<Map<String, dynamic>> data) => SizedBox(
        width: 260,
        height: 500,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                infoMakul(context);
              },
              child: Container(
                width: 260,
                height: 70,
                color: (index % 2 == 0) ? whiteColor : tabelColor2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index]['jamMK'],
                      style: tableTextStyle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      data[index]['namaMK'],
                      style: appBarStyle,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );

// HEADER ROW KE 1 PADA TABEL MK
  Widget _rowPertama(String kata) => Container(
        padding: const EdgeInsets.only(left: 10, top: 10),
        width: 260,
        height: 40,
        color: lightBlueColor,
        child: Center(
          child: Text(
            kata,
            style: whiteSubtitle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
}

Future infoMakul(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        
        children: [
          DataInfoMatkul(titleInfo: "Nama Mata Kulaih", subInfo: "Rangkaian Elektronika"),
          DataInfoMatkul(titleInfo: "Kode Mata Kuliah", subInfo: "CIF61007"),
          DataInfoMatkul(titleInfo: "SKS", subInfo: "4"),
          DataInfoMatkul(titleInfo: "Tahun Kurikulum", subInfo: "2022"),
          DataInfoMatkul(titleInfo: "Hari/Jam", subInfo: "Senin/09:00-10:00"),
          DataInfoMatkul(titleInfo: "Kelas", subInfo: "Tekkom A"),
          DataInfoMatkul(titleInfo: "Peminat", subInfo: "0/30"),
          
        ],
      ),
    ),
  );
  
}

class DataInfoMatkul extends StatelessWidget {
  String titleInfo;
  String subInfo;
   DataInfoMatkul({
    Key? key,
    required this.titleInfo,
    required this.subInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4,),
          Text(
            titleInfo,
            style: subPageStlye.copyWith(fontSize: 16),
          ),
          
          Container(
            height: 35,
            width: 300,
            margin: const EdgeInsets.only(top: 5, bottom: 10),
            padding: const EdgeInsets.only(left: 5, top: 2),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5)
            ),
          child: Text(
            subInfo,
            style: dropDownTextStyle,
          ),
          )
      ],
    );
  }
}
