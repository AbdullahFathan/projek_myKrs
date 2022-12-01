import 'package:flutter/material.dart';

import 'package:mykrs_projek/models/data_dummy.dart';
import 'package:mykrs_projek/util/color_textstyle.dart';
import 'package:mykrs_projek/widget/drop_down_jadwal.dart';
import 'package:mykrs_projek/widget/top_navbar.dart';

import '../widget/botom_widget.dart';

class DaftarJadwalPage extends StatefulWidget {
  const DaftarJadwalPage({super.key});

  @override
  State<DaftarJadwalPage> createState() => _DaftarJadwalPageState();
}

class _DaftarJadwalPageState extends State<DaftarJadwalPage> {
  List<String> dataFakultas = fakultas;
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    final ScrollController controller = ScrollController();
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Stack(
              children: [
                HeaderWeb(isAnotherCircle: true),
                // JUDUL WEB
                Positioned(
                  top: 60,
                  left: 440,
                  child: Text(
                    "Daftar Jadwal Mata Kuliah",
                    style: titlePageStlye,
                  ),
                ),
                // MILIH FAKULTAS
                Positioned(
                  top: 140,
                  left: 280,
                  child: DropDownJadwalSection(
                    data: dataFakultas,
                    kata: "Fakultas",
                    lebar: 200,
                    jarak: SizedBox(
                      width: 65,
                    ),
                  ),
                ),
                // MILIH SEMESTER
                Positioned(
                  top: 190,
                  left: 280,
                  child: DropDownJadwalSection(
                    data: semester,
                    kata: "Semester",
                    lebar: 150,
                    jarak: SizedBox(
                      width: 55,
                    ),
                  ),
                ),
                // MILIH KODE MK
                Positioned(
                  top: 240,
                  left: 280,
                  child: DropDownJadwalSection(
                    data: kodeMatkul,
                    kata: "Kode Matkul",
                    lebar: 150,
                    jarak: SizedBox(
                      width: 20,
                    ),
                  ),
                ),
                // MILIH PRODI
                Positioned(
                  top: 140,
                  left: 700,
                  child: DropDownJadwalSection(
                    data: programStudi,
                    kata: "Program Studi",
                    lebar: 350,
                    jarak: SizedBox(
                      width: 70,
                    ),
                  ),
                ),
                // MILIH TAHUN KURIKULUM
                Positioned(
                  top: 190,
                  left: 700,
                  child: DropDownJadwalSection(
                    data: tahunKurikulm,
                    kata: "Tahun Kurikulum",
                    lebar: 150,
                    jarak: SizedBox(
                      width: 40,
                    ),
                  ),
                ),
                //PILIH MK
                Positioned(
                  top: 240,
                  left: 700,
                  child: DropDownJadwalSection(
                    data: namaMatkul,
                    kata: "Nama Matkul",
                    lebar: 350,
                    jarak: SizedBox(
                      width: 75,
                    ),
                  ),
                ),
              ],
            ),
            // TABEL MK TERSEDIA
            Container(
              width: lebar,
              height: 700,
              color: darkBlueColors,
              child: Center(
                child: Column(
                  children: [
                    Container(
                        margin:
                            const EdgeInsets.only(left: 15, right: 15, top: 50),
                        width: lebar,
                        height: 45,
                        // HEADER COLUMN 1 TABEL
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            rowPertama("Tahun Kurikulum"),
                            rowPertama("Hari"),
                            rowPertama("Jam"),
                            rowPertama("Kode MK"),
                            rowPertama("Nama MK"),
                            rowPertama("Kelas"),
                            rowPertama("SKS"),
                            rowPertama("Peminat"),
                          ],
                        )),
                    Container(
                        width: lebar,
                        height: 550,
                        color: whiteColor,
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        child: ListView.builder(
                          itemCount: allDataMatkul.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: lebar,
                              height: 40,
                              child: Row(
                                children: [
                                  dataTable(allDataMatkul[index].tahunKurikulm,
                                      index),
                                  dataTable(allDataMatkul[index].hari, index),
                                  dataTable(allDataMatkul[index].jam, index),
                                  dataTable(allDataMatkul[index].kodeMK, index),
                                  dataTable(allDataMatkul[index].namaMK, index,
                                      pading: 0),
                                  dataTable(allDataMatkul[index].kelas, index),
                                  dataTable(allDataMatkul[index].sks, index),
                                  Container(
                                    width: 146,
                                    height: 40,
                                    color: (index % 2 == 0)
                                        ? tabelColor2
                                        : whiteColor,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Center(
                                        child: Text(
                                          allDataMatkul[index].peminat,
                                          style: tableTextStyle,
                                        ),
                                      ),
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
Widget rowPertama(String kata) => Container(
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
          Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 12,
            color: whiteColor,
          )
        ],
      ),
    );

Widget dataTable(
  String kata,
  int index, {
  double pading = 45,
}) =>
    Container(
      width: 170,
      height: 40,
      color: (index % 2 == 0) ? tabelColor2 : whiteColor,
      padding: EdgeInsets.only(right: pading),
      child: Center(
        child: Text(
          kata,
          style: tableTextStyle,
        ),
      ),
    );
