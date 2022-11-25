import 'package:flutter/material.dart';
import 'package:mykrs_projek/util/color_textstyle.dart';
import 'package:mykrs_projek/widget/top_navbar.dart';

class PlanJadwalPage extends StatefulWidget {
  const PlanJadwalPage({super.key});

  @override
  State<PlanJadwalPage> createState() => _PlanJadwalPageState();
}

class _PlanJadwalPageState extends State<PlanJadwalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColors,
      body: Stack(
        children: [
          //Gambar lingkarang kiri
          Image.asset(
            "assets/lingkarang5.png",
            width: 570,
            height: 538,
            alignment: Alignment.topLeft,
          ),
          Positioned(
            top: 35,
            left: -75,
            child: Image.asset(
              "assets/lingkarang7.png",
              width: 410,
              height: 410,
            ),
          ),
          // Gambar lingkarang kanan di tombol masuk
          Positioned(
            right: -25,
            child: Image.asset(
              "assets/lingkarang6.png",
              width: 398,
              height: 398,
              alignment: Alignment.topRight,
            ),
          ),
          Positioned(
            right: -25,
            child: Image.asset(
              "assets/lingkarang8.png",
              width: 298,
              height: 298,
              alignment: Alignment.topRight,
            ),
          ),

          Positioned(
            top: 87,
            left: 460,
              child: Text(
            "Plan Jadwal Mata Kuliah",
            style: whitetitleStyle,
          )),
          // Text header awal
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              RichText(
                  text: TextSpan(
                      text: "My",
                      style: logoStyle.copyWith(color: whiteColor),
                      children: [
                    TextSpan(
                        text: "KRS",
                        style: logoStyle.copyWith(
                          color: orangeColors,
                        ))
                  ])),
              const SizedBox(
                width: 100,
              ),
              Text("Jadwal", style: appBarStyle.copyWith(color: whiteColor)),
              const SizedBox(
                width: 50,
              ),
              Text("Plan", style: appBarStyle.copyWith(color: whiteColor)),
              const SizedBox(
                width: 50,
              ),
              Text("Bantuan", style: appBarStyle.copyWith(color: whiteColor)),
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

          Positioned(
            top: 177,
            left: 200,
            
              child: Container(
                height: 350,
                width: 1024,
                color: orangeColors,
              )),
        ],
      ),
    );
  }
}
