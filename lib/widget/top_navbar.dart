import 'package:flutter/cupertino.dart';

import '../util/color_textstyle.dart';

class HeaderWeb extends StatelessWidget {
  bool isAnotherCircle;
  HeaderWeb({this.isAnotherCircle = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Gambar lingkarang kiri
        isAnotherCircle ? 
        Image.asset(
                "assets/lingkarang4.png",
                width: 470,
                height: 340,
                alignment: Alignment.topLeft,
              )
        :
              Image.asset(
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
              const SizedBox(width: 30,),
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
                  const SizedBox(width: 30,),
              Text("Jadwal", style: appBarStyle),
              const SizedBox(width: 50,),
              Text("Plan", style: appBarStyle),
              const SizedBox(width: 50,),
              Text("Bantuan", style: appBarStyle),
              const SizedBox(width: 50,),
            ],
          ),
              //Tombol masuk biru
              Align(
            alignment: Alignment.topRight,
            child: LoginButton(),
          ),
      ],
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
              isShow ? Positioned(
                right:   70,
                top: 170,
                child: Image.asset(
                  "assets/kalender.png",
                  width: 410,
                  height: 450,
                ),
              ) : Container()
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
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(right: 35, top: 10, bottom: 10),
                width: 118,
                height: 27,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: lightBlueColor),
                child: Center(
                    child: Text(
                  "Masuk",
                  style: buttonWhiteStlye,
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
                            borderRadius: BorderRadius.circular(8),
                            color: lightBlueColor),
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
                  