import 'package:flutter/material.dart';

import '../util/color_textstyle.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              color: darkBlueColors,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Text(
                      "Get Started",
                      style: whitetitleStyle,
                    ),
                    const SizedBox(height: 30,),
                    //TOMBOL
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //TOMBOL JADWAL
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(222, 57),
                              backgroundColor:
                                  const Color(0xff3598DB).withOpacity(0.25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          onPressed: () {},
                          child: Text(
                            "Jadwal",
                            style: whitetitleStyle.copyWith(fontSize: 32),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        //Tombol plan
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(222, 57),
                              backgroundColor:
                                  const Color(0xff3598DB).withOpacity(0.25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          onPressed: () {},
                          child: Text(
                            "Plan",
                            style: whitetitleStyle.copyWith(fontSize: 32),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        // tombol bantuan
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(222, 57),
                              backgroundColor:
                                  const Color(0xff3598DB).withOpacity(0.25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          onPressed: () {},
                          child: Text(
                            "Bantuan",
                            style: whitetitleStyle.copyWith(fontSize: 32),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Text(
                      "Developed by BCC Team © 2022",
                      style: whiteSubtitle,
                    ),
                  ],
                ),
              ),
            );
  }
}