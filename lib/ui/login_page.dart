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
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Center(
                child: Container(
                  width: 400,
                  height: 400,
                  padding: const EdgeInsets.only(top: 50, left: 25),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: tabelColor2,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Silakan masuk ke akun anda ",
                        style: appBarStyle,
                      ),

                      //username user
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _nimTextController,
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: subPageStlye,
                          ),
                          style: dropDownTextStyle,
                        ),
                      ),
                      const SizedBox(height: 10),

                      //Password user
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _passwordTextController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: subPageStlye,
                          ),
                          style: dropDownTextStyle,
                        ),
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(Login(
                                nim: _nimTextController.text,
                                password: _passwordTextController.text));
                          },
                          child: Text(
                            "LOGIN",
                            style: appBarStyle,
                          ))
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }
}
