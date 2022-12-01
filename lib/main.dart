import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mykrs_projek/bloc/jdu/jdu_bloc.dart';
import 'package:mykrs_projek/ui/pilih_jadwal_page.dart';


import 'bloc/auth/auth_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(IsHasLogin())),
        BlocProvider(create: (context) => JduBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PilihJadwalPage(),
      ),
    );
  }
}

/*
final result = await FilePicker.platform.pickFiles(
                         type: FileType.custom,
                         allowedExtensions: ["xlsx"]
                        );
                        if (result == null) return;

                        final file = result.files.first;
                        exelJDu = File((file.path.toString()));
                       print("name : ${file.name}");
                       print("type : ${file.extension}");
 */
