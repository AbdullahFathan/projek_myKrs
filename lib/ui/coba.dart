import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/jdu/jdu_bloc.dart';
import '../util/color_textstyle.dart';


class CobaPage extends StatefulWidget {
  const CobaPage({super.key});

  @override
  State<CobaPage> createState() => _CobaPageState();
}

class _CobaPageState extends State<CobaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            alignment: Alignment.center,
            fixedSize: const Size(124, 32),
            side: const BorderSide(color: darkBlueColors),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () => context.read<JduBloc>().add(GetJDU()),
          child: Text(
            "Unggah",
            style: dropDownTextStyle,
          ),
        ),
      ),
    );
  }
}

Future getFile2(BuildContext context) async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ["xlsx"],
    onFileLoading: (p0) => print(p0),
  );
  print("file berhasil didapatkan");
  if (result == null) return;

  final file = result.files.first;
  print("name : ${file.name}");
  print("type : ${file.extension}");
  print(file.bytes);
  

  //File fileExel =  File.fromRawPath(file.bytes!);
  context
      .read<JduBloc>()
      .add(PostJDU(file));
  print("menuju ke jdu bloc");
  //print("file akan di return");
  //return file;
}
