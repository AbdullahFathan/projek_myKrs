import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mykrs_projek/models/data_dummy.dart';
import 'package:mykrs_projek/util/color_textstyle.dart';
import 'package:path_provider/path_provider.dart';


import '../bloc/jdu/jdu_bloc.dart';
import '../widget/botom_widget.dart';
import '../widget/file_upload.dart';
import '../widget/top_navbar.dart';

class UnggahJadwalPage extends StatefulWidget {
  const UnggahJadwalPage({super.key});

  @override
  State<UnggahJadwalPage> createState() => _UnggahJadwalPageState();
}
late PlatformFile exelJDu;
class _UnggahJadwalPageState extends State<UnggahJadwalPage> {
  final header = [
    "Tahun Kurikulum",
    "Hari",
    "Jam",
    "Kode MK",
    "Nama MK",
    "Kelas",
    "SKS",
    "Peminat"
  ];
  final ScrollController controller = ScrollController();
  

  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Stack(
              children: [
                HeaderWeb(isAnotherCircle: true),
                //TITLE WEB
                Positioned(
                  top: 60,
                  left: 420,
                  child: Text(
                    "Unggah Jadwal Mata Kuliah",
                    style: titlePageStlye,
                  ),
                ),
                // UNGGAH FILE SECTION
                Positioned(
                  top: 220,
                  left: 470,
                  child: Text(
                    "Konfirmasi jika Jadwal mata kuliah sudah benar",
                    style: subPageStlye.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // BUTTON UPLOAD FILE
                Positioned(
                    left: 470,
                    top: 175,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 20),
                        fixedSize: const Size(300, 32),
                        side: const BorderSide(color: darkBlueColors),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.file_upload_outlined,
                            size: 22,
                            color: darkBlueColors,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Jadwal.xlx",
                            style: dropDownTextStyle,
                          )
                        ],
                      ),
                    )),
                // BUTTON UPLOAD UNGGAH
                Positioned(
                    left: 800,
                    top: 175,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        alignment: Alignment.center,
                        fixedSize: const Size(124, 32),
                        side: const BorderSide(color: darkBlueColors),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(
                         type: FileType.custom,
                         allowedExtensions: ["xlsx"]
                        );
                        if (result == null) return;

                        final file = result.files.first;
                        final fileByte = file.bytes;
                        //exelJDu =  File.fromRawPath(fileByte!);
                        exelJDu =  file;
                        
                       print("name : ${file.name}");
                       print("type : ${file.extension}");
                        
                      },
                      child: Text(
                        "Unggah",
                        style: dropDownTextStyle,
                      ),
                    )),
                //TULISAN KONFIRMASI
                Positioned(
                  top: 140,
                  left: 470,
                  child: Text(
                    "Unggah file jadwal mata kuliah dalam bentuk .xlxs",
                    style: subPageStlye.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                //TOMBOL KONFIRMASI
                Positioned(
                    left: 470,
                    top: 260,
                    child: OutlinedButton(
                      onPressed: () => _showDialog(context),
                      style: OutlinedButton.styleFrom(
                          alignment: Alignment.center,
                          fixedSize: const Size(452, 32),
                          side: const BorderSide(color: darkBlueColors),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        "Konfirmasi",
                        style: dropDownTextStyle,
                      ),
                    )),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
              height: 700,
              color: darkBlueColors,
              child: Center(
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: lebar,
                        height: 45,
                        // HEADER COLUMN 1 TABEL
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _rowPertama("Tahun Kurikulum"),
                            _rowPertama("Hari"),
                            _rowPertama("Jam"),
                            _rowPertama("Kode MK"),
                            _rowPertama("Nama MK"),
                            _rowPertama("Kelas"),
                            _rowPertama("SKS"),
                            _rowPertama("Peminat"),
                          ],
                        )),
                    Container(
                        width: lebar,
                        height: 550,
                        color: whiteColor,
                        child: ListView.builder(
                          itemCount: allDataMatkul.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: lebar,
                              height: 40,
                              child: Row(
                                children: [
                                  _dataTable(allDataMatkul[index].tahunKurikulm,
                                      index),
                                  _dataTable(allDataMatkul[index].hari, index),
                                  _dataTable(allDataMatkul[index].jam, index),
                                  _dataTable(
                                      allDataMatkul[index].kodeMK, index),
                                  //Nama matkul
                                  Container(
                                    width: 170,
                                    height: 50,
                                    color: (index % 2 == 0)
                                        ? tabelColor2
                                        : whiteColor,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            allDataMatkul[index].namaMK,
                                            style: tableTextStyle,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.create,
                                              size: 12,
                                            )),
                                      ],
                                    ),
                                  ),
                                  _dataTable(allDataMatkul[index].kelas, index),
                                  _dataTable(allDataMatkul[index].sks, index,
                                      pading: 25),
                                  Container(
                                    width: 146,
                                    height: 50,
                                    color: (index % 2 == 0)
                                        ? tabelColor2
                                        : whiteColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          allDataMatkul[index].peminat,
                                          style: tableTextStyle,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.create,
                                              size: 12,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ))
                  ],
                ),
              ),
            ),
            const GradienColor(),
            const BottomWidget(),
          ],
        ),
      ),
    );
  }
}

// HEADER ROW KE 1 PADA TABEL MK
Widget _rowPertama(String kata) => Container(
      width: 170,
      height: 40,
      color: lightBlueColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            kata,
            style: whiteSubtitle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 12,
            color: whiteColor,
          )
        ],
      ),
    );

Widget _dataTable(
  String kata,
  int index, {
  double pading = 45,
}) =>
    Container(
      width: 170,
      height: 50,
      color: (index % 2 == 0) ? tabelColor2 : whiteColor,
      padding: EdgeInsets.only(right: pading),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            kata,
            style: tableTextStyle,
          ),
          const SizedBox(
            width: 2,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.create,
                size: 12,
              )),
        ],
      ),
    );

Future _showDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(
          "Yakin untuk mengkonfirmasi?",
          style: appBarStyle.copyWith(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        content: Text(
          "Pastikan jadwal yang Anda unggah sudah benar.",
          textAlign: TextAlign.center,
          style:
              subPageStlye.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          //TOMBOL BATAL
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
                alignment: Alignment.center,
                fixedSize: const Size(132, 32),
                side: const BorderSide(color: darkBlueColors),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text(
              "Batal",
              style: dropDownTextStyle,
            ),
          ),

          // TOMBOL KONFIRMASI
          OutlinedButton(
            onPressed: () {
              context.read<JduBloc>().add(
              PostJDU(exelJDu, "DAFFA MANO: JAKLMIASMD", "daff@daffa.com"));
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
                backgroundColor: darkBlueColors,
                alignment: Alignment.center,
                fixedSize: const Size(132, 32),
                side: const BorderSide(color: darkBlueColors),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text(
              "Konfirmasi",
              style: whiteSubtitle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      );
    },
  );
}


