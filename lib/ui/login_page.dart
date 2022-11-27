import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mykrs_projek/util/color_textstyle.dart';
import 'package:mykrs_projek/widget/top_navbar.dart';

import '../bloc/auth/auth_bloc.dart';
import 'daftar_jadwal_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nimTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool isObscure = true;
  @override
  void dispose() {
    _passwordTextController.dispose();
    _nimTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const DaftarJadwalPage()));
          } else if (state is AuthEror) {
            print(state.text);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [
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
                    width: 30,
                  ),
                  Text("Jadwal", style: appBarStyle),
                  const SizedBox(
                    width: 50,
                  ),
                  Text("Plan", style: appBarStyle),
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
              Positioned(
                top: 100,
                left: 116,
                child: Image.asset(
                  "assets/login-image.png",
                  height: 490,
                  width: 490,
                ),
              ),
              Positioned(
                  top: 89,
                  left: 780,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang 👋",
                        style: titlePageStlye,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Silahkan masuk terlebih dahulu\nuntuk membuat Plan KRS Anda",
                        style: subPageStlye.copyWith(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "NIM",
                        style: loginSubPageStlye,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 5),
                        height: 50,
                        width: 450,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all()),
                        child: TextField(
                          controller: _nimTextController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Masukkan NIM",
                            hintStyle: subPageStlye.copyWith(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Password",
                        style: loginSubPageStlye,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 5),
                        height: 50,
                        width: 450,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all()),
                        child: TextField(
                          controller: _passwordTextController,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Masukkan Password",
                              hintStyle: subPageStlye.copyWith(fontSize: 20),
                              suffixIcon: IconButton(
                                color: lightgreyColor,
                                onPressed: () => setState(() {
                                  isObscure = !isObscure;
                                }),
                                icon: Icon(isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 450,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Lupa Password?",
                            style: lilteBluestlye,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),

                      // button login
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(450, 50),
                              backgroundColor: lightBlueColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          onPressed: () {
                            context.read<AuthBloc>().add(Login(
                                nim: _nimTextController.text,
                                password: _passwordTextController.text));
                          },
                          child: Text(
                            "Masuk",
                            style: buttonWhiteStlye,
                            textAlign: TextAlign.center,
                          )),

                          // Kata buat akun
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: SizedBox(
                          height: 45,
                          width: 450,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Belum punya akun? ",
                                  style: subPageStlye.copyWith(fontSize: 16)),
                              Text(
                                "Buat Akun",
                                style: lilteBluestlye,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}
