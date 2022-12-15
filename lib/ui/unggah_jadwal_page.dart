import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mykrs_projek/util/color_textstyle.dart';

import '../bloc/jdu/jdu_bloc.dart';
import '../widget/botom_widget.dart';
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
    return BlocConsumer<JduBloc, JduState>(
      listener: (context, state) {
        if (state is POSTJduEror) {
          print("eror at state postJDu eror ${state.text}");
        } else if (state is POSTJduSuccess) {
          context.read<JduBloc>().add(GetJDU());
        }
      },
      builder: (context, state) {
        if (state is POSTJduLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: SingleChildScrollView(
            controller: controller,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(children: [
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

                  Positioned(
                    top: 127,
                    left: 470,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kata unggah file
                        Text(
                          "Unggah file jadwal mata kuliah dalam bentuk .xlxs",
                          style: subPageStlye.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            OutlinedButton(
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
                                  const Icon(
                                    Icons.file_upload_outlined,
                                    size: 22,
                                    color: darkBlueColors,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Jadwal.xlsx",
                                    style: dropDownTextStyle,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                alignment: Alignment.center,
                                fixedSize: const Size(124, 32),
                                side: const BorderSide(color: darkBlueColors),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              onPressed: () async {
                                await getFile(context);
                              },
                              child: Text(
                                "Unggah",
                                style: dropDownTextStyle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        //KATA konfirmasi
                        Text(
                          "Konfirmasi jika Jadwal mata kuliah sudah benar",
                          style: subPageStlye.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        // Button konfirmasi
                        OutlinedButton(
                          onPressed: () async => await _showDialog(context),
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
                        )
                      ],
                    ),
                  ),
                ]),
                Container(
                  width: lebar,
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
                  height: 700,
                  color: darkBlueColors,
                  child: Center(
                    child: BlocBuilder<JduBloc, JduState>(
                      builder: (context, state) {
                        if (state is GEtJduLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is GETJduEror) {
                          return Text(state.text);
                        } else if (state is GETJduSuccess) {
                          return Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  width: lebar,
                                  height: 45,
                                  //HEADER COLUMN 1 TABEL
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
                                  child: ListView.builder(
                                    itemCount: state.dataJDU.length,
                                    itemBuilder: (context, index) {
                                      var data = state.dataJDU[index];
                                      String hari = "";
                                      switch (
                                          data.waktuJadwalUser![index].hari) {
                                        case 1:
                                          hari = "Senin";
                                          break;
                                        case 2:
                                          hari = "Selasa";
                                          break;
                                        case 3:
                                          hari = "Rabu";
                                          break;
                                        case 4:
                                          hari = "Kamis";
                                          break;
                                        case 5:
                                          hari = "Jumat";
                                          break;
                                      }
                                      String? jamMatkul =
                                          "${data.waktuJadwalUser![0].jamMulai} - ${data.waktuJadwalUser![0].jamAkhir}";
                                      return SizedBox(
                                        width: lebar,
                                        height: 40,
                                        child: Row(
                                          children: [
                                            dataTable(
                                                data.tahunKurikulum!, index),
                                            dataTable(hari, index),
                                            dataTable(jamMatkul, index),
                                            dataTable(data.kode, index),
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
                                                      "${data.mataKuliah}",
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
                                            dataTable(data.kelas, index),
                                            dataTable(data.sks, index,
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
                                                    "0/30",
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
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ))
                            ],
                          );
                        }
                        return Text(
                          "SILAKAN UPLOAD FILE EXEL DULU",
                          style: whitetitleStyle,
                        );
                      },
                    ),
                  ),
                ),
                const GradienColor(),
                const BottomWidget(),
              ],
            ),
          ),
        );
      },
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
          const Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 12,
            color: whiteColor,
          )
        ],
      ),
    );

Widget dataTable(
  var kata,
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
            "$kata",
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

// fungsi untuk upload file
Future getFile(BuildContext context) async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ["xlsx"],
  );
  print("file berhasil didapatkan");
  if (result == null) return;

  final file = result.files.first;
  print("name : ${file.name}");
  print("type : ${file.extension}");

  //File fileExel =  File.fromRawPath(file.bytes!);
  context.read<JduBloc>().add(PostJDU(file));
  print("menuju ke jdu bloc");
  //print("file akan di return");
  //return file;
}
