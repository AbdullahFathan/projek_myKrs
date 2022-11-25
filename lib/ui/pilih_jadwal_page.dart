import 'package:flutter/material.dart';

import '../models/data_dummy.dart';
import '../util/color_textstyle.dart';
import '../widget/drop_down_jadwal.dart';
import '../widget/top_navbar.dart';

class PilihJadwalPage extends StatefulWidget {
  const PilihJadwalPage({super.key});

  @override
  State<PilihJadwalPage> createState() => _PilihJadwalPageState();
}

class _PilihJadwalPageState extends State<PilihJadwalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    "Pilih Jadwal Mata Kuliah",
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
          ],
        ),
      ),
    );
  }
}