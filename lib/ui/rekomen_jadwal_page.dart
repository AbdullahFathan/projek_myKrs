import 'package:flutter/material.dart';

import '../models/data_dummy.dart';
import '../util/color_textstyle.dart';
import '../widget/drop_down_jadwal.dart';
import '../widget/top_navbar.dart';

class RekomenJadwalPage extends StatefulWidget {
  const RekomenJadwalPage({super.key});

  @override
  State<RekomenJadwalPage> createState() => _RekomenJadwalPageState();
}

class _RekomenJadwalPageState extends State<RekomenJadwalPage> {
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
                    data: fakultas,
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
                // MILIH Jam kuliah
                Positioned(
                  top: 240,
                  left: 280,
                  child: DropDownJadwalSection(
                    data: jamKuliah,
                    kata: "Jam Kuliah",
                    lebar: 200,
                    jarak: SizedBox(
                      width: 40,
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
                //PILIH Jumlah sks
                Positioned(
                  top: 240,
                  left: 700,
                  child: DropDownJadwalSection(
                    data: jumlahSks,
                    kata: "Jumlah SKS",
                    lebar: 150,
                    jarak: SizedBox(
                      width: 100,
                    ),
                  ),
                ),
                Positioned(
                    left: 495,
                    top: 300,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          alignment: Alignment.center,
                          fixedSize: const Size(452, 32),
                          side: const BorderSide(color: darkBlueColors),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        "Generate",
                        style: dropDownTextStyle,
                      ),
                    )),
              ],
            ),
            // TABEL JADWAL REKOMEN
            Container(
              width: lebar,
              height: 700,
              color: darkBlueColors,
              padding: const EdgeInsets.only(left: 35, right: 15, top: 30),
              child: Center(
                child: Column(
                  children: [
                    Container(
                        width: lebar,
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
                    Container(
                        width: lebar,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _builderTabel(List<Map<String, dynamic>> data) => SizedBox(
      width: 260,
      height: 500,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
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
      child: Text(
        kata,
        textAlign: TextAlign.center,
        style: whiteSubtitle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
