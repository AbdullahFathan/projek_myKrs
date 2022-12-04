import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mykrs_projek/ui/daftar_jadwal_page.dart';
import 'package:mykrs_projek/ui/login_page.dart';
import 'package:mykrs_projek/ui/pilih_jadwal_page.dart';
import 'package:mykrs_projek/ui/plan_jadwal_page.dart';
import 'package:mykrs_projek/ui/rekomen_jadwal_page.dart';
import 'package:mykrs_projek/ui/unggah_jadwal_page.dart';

import '../bloc/auth/auth_bloc.dart';
import '../util/color_textstyle.dart';
import 'plan_jadwal_widget.dart';

List<String> jadwalRoute = ["Daftar Jadwal", "Tambah Jadwal"];

List<String> planRoute = ["Plan Jadwal", "Pilih Jadwal", "Rekomendasi"];

class HeaderWeb extends StatefulWidget {
  bool isAnotherCircle;
  HeaderWeb({this.isAnotherCircle = false});

  @override
  State<HeaderWeb> createState() => _HeaderWebState();
}

class _HeaderWebState extends State<HeaderWeb> {
  @override
  Widget build(BuildContext context) {
  
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.52,
      child: Stack(
        children: [
          //Gambar lingkarang kiri
          widget.isAnotherCircle
              ? Image.asset(
                  "assets/lingkarang4.png",
                  width: 470,
                  height: 340,
                  alignment: Alignment.topLeft,
                )
              : Image.asset(
                  "assets/lingkarang2.png",
                  width: 638,
                  height: 638,
                  alignment: Alignment.topLeft,
                ),
          // Gambar lingkarang kanan di tombol masuk
          Positioned(
            right: -25,
            child: Image.asset(
              "assets/lingkarang3.png",
              width: 398,
              height: 398,
              alignment: Alignment.topRight,
            ),
          ),
          // Text header awal
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              RichText(
                  text: TextSpan(
                      text: "My",
                      style: logoStyle.copyWith(color: orangeColors),
                      children: [
                    TextSpan(
                        text: "KRS",
                        style: logoStyle.copyWith(
                          color: darkBlueColors,
                        ))
                  ])),
              const SizedBox(
                width: 50,
              ),
              SizedBox(
                  height: 34,
                  width: 140,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      icon: const Visibility(
                        visible: false,
                        child: Icon(Icons.arrow_downward),
                      ),
                      hint: SizedBox(
                        child: Row(
                          children: [
                            Text(
                              "Jadwal",
                              style: appBarStyle,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                      items: jadwalRoute
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: routeTextStyle,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        switch (value) {
                          case "Daftar Jadwal":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>  DaftarJadwalPage()));
                            break;
                          case "Tambah Jadwal":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const UnggahJadwalPage()));
                            break;
                        }
                      },
                      itemHeight: 40,
                      dropdownWidth: 150,
                    ),
                  )),
              const SizedBox(
                width: 50,
              ),
              SizedBox(
                  height: 34,
                  width: 140,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      icon: const Visibility(
                        visible: false,
                        child: Icon(Icons.arrow_downward),
                      ),
                      hint: SizedBox(
                        child: Row(
                          children: [
                            Text(
                              "Plan",
                              style: appBarStyle,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                      items: planRoute
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: routeTextStyle,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        switch (value) {
                          case "Plan Jadwal":
                          
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>  PlanJadwalPage(planWidget: PlanJadwalWidget(),)));
                            break;
                          
                          case "Pilih Jadwal":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const PilihJadwalPage()));
                            break;
                          case "Rekomendasi":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RekomenJadwalPage()));
                            break;
                        }
                      },
                      itemHeight: 40,
                      dropdownWidth: 150,
                    ),
                  )),
             
              const SizedBox(
                width: 50,
              ),
              Text("Bantuan", style: appBarStyle),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
          //Tombol masuk biru
          Align(
            alignment: Alignment.topRight,
            child: LoginButton(),
          ),
        ],
      ),
    );
  }
}

class WelcomSection extends StatelessWidget {
  bool isShow;
  WelcomSection({this.isShow = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeaderWeb(),

        //PUNCH LINE
        Padding(
          padding: const EdgeInsets.only(left: 197, top: 252),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Buat Jadwalmu",
                style: titlePageStlye,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "MyKRS lebih dari excel atau tabel\nAtur MyKRS sesuai dengan planmu",
                style: subPageStlye.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 24,
              ),
              ButtonPlan(),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Dipercaya Oleh:",
                style: subPageStlye.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                "assets/BCC-logo.png",
                height: 37,
                width: 98,
              )
            ],
          ),
        ),

        //GAMBAR KALENDER + ORANG
        isShow
            ? Positioned(
                right: 70,
                top: 170,
                child: Image.asset(
                  "assets/kalender.png",
                  width: 410,
                  height: 450,
                ),
              )
            : Container()
      ],
    );
  }
}

Widget logoMyKRS() => RichText(
        text: TextSpan(
            text: "My",
            style: logoStyle.copyWith(color: orangeColors),
            children: [
          TextSpan(
              text: "KRS",
              style: logoStyle.copyWith(
                color: darkBlueColors,
              ))
        ]));

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 35, top: 10, bottom: 10),
        width: 118,
        height: 27,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: lightBlueColor),
        child: Center(child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              Text(
                "Keluar",
                style: buttonWhiteStlye,
              );
            }
            return Text(
              "Masuk",
              style: buttonWhiteStlye,
            );
          },
        )),
      ),
    );
  }
}

class ButtonPlan extends StatelessWidget {
  const ButtonPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 230,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: lightBlueColor),
        child: Center(
          child: Text(
            "Buat Plan KRS",
            style: buttonWhiteStlye,
          ),
        ),
      ),
    );
  }
}
