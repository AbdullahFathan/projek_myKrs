import 'package:flutter/material.dart';
import 'package:mykrs_projek/ui/plan_jadwal_page.dart';


import '../models/data_dummy.dart';
import '../util/color_textstyle.dart';
import '../widget/drop_down_jadwal.dart';
import '../widget/plan_jadwal_widget.dart';
import '../widget/top_navbar.dart';

class PilihJadwalPage extends StatefulWidget {
  const PilihJadwalPage({super.key});

  @override
  State<PilihJadwalPage> createState() => _PilihJadwalPageState();
}

class _PilihJadwalPageState extends State<PilihJadwalPage> {
  final ScrollController _controller = ScrollController();
  final ScrollController _controllermain = ScrollController();
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _controllermain,
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
                    jarak: const SizedBox(
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
                    jarak: const SizedBox(
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
                    jarak: const SizedBox(
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
                    jarak: const SizedBox(
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
                    jarak: const SizedBox(
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
                    jarak: const SizedBox(
                      width: 75,
                    ),
                  ),
                ),
              ],
            ),
            Container(
                height: 284,
                width: lebar,
                padding: const EdgeInsets.only(top: 20, left: 60, right: 60),
                color: tabelColor2,
                child: SingleChildScrollView(
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    dividerThickness: 0,
                    horizontalMargin: 0,
                    columnSpacing: 0,
                    columns: [
                      DataColumn(
                          label:
                              BoxColumn(kata: "Tahun Kurikulum", width: 145)),
                      DataColumn(label: BoxColumn(kata: "hari", width: 145)),
                      DataColumn(label: BoxColumn(kata: "Jam", width: 145)),
                      DataColumn(label: BoxColumn(kata: "Kode MK", width: 145)),
                      DataColumn(label: BoxColumn(kata: "Nama MK", width: 206)),
                      DataColumn(label: BoxColumn(kata: "Kelas", width: 145)),
                      DataColumn(label: BoxColumn(kata: "SKS", width: 88)),
                      DataColumn(label: BoxColumn(kata: "Peminat", width: 120)),
                      DataColumn(
                          label: Container(
                        height: 40,
                        width: 106,
                        color: lightBlueColor,
                        child: Center(
                          child: Text(
                            "Pilih Jadwal",
                            style: whiteSubtitle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )),
                    ],
                    rows: getRow(allDataMatkul),
                  ),
                )),
            const GradienColor(),
            Container(
              width: lebar,
              height: 620,
              color: darkBlueColors,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Plan Jadwal Mata Kuliah",
                        style: whitetitleStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PlanJadwalPage(
                                        planWidget: PlanJadwalWidget(),
                                      ))),
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: whiteColor,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35),
                    child: PlanJadwalWidget(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BoxColumn extends StatelessWidget {
  String kata;
  double width;

  BoxColumn({
    Key? key,
    required this.kata,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: width,
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
        ));
  }
}

getRow(List<DataMatkul> data) => data
    .asMap()
    .map((i, DataMatkul item) => MapEntry(
        i,
        DataRow(cells: [
          DataCell(BoxRow(
            kata: item.tahunKurikulm,
            index: i,
            width: 145,
          )),
          DataCell(BoxRow(kata: item.hari, index: i, width: 145)),
          DataCell(BoxRow(kata: item.jam, index: i, width: 145)),
          DataCell(BoxRow(kata: item.kodeMK, index: i, width: 145)),
          DataCell(BoxRow(kata: item.namaMK, index: i, width: 206)),
          DataCell(BoxRow(kata: item.kelas, index: i, width: 145)),
          DataCell(BoxRow(kata: item.sks, index: i, width: 88)),
          DataCell(BoxRow(kata: item.peminat, index: i, width: 120)),
          DataCell(
            Container(
                height: 45,
                width: 106,
                color: lightBlueColor,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: whiteColor,
                  ),
                )),
          )
        ])))
    .values
    .toList();

class BoxRow extends StatelessWidget {
  String kata;
  int index;
  double width;

  BoxRow({
    Key? key,
    required this.kata,
    required this.index,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      color: index % 2 == 0 ? whiteColor : tabelColor2,
      child: Center(
        child: Text(
          kata,
          style: tableTextStyle,
        ),
      ),
    );
  }
}
