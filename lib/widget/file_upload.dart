import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:mykrs_projek/util/color_textstyle.dart';

class FileUpload extends StatefulWidget {
  const FileUpload({super.key});

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  late DropzoneViewController controller;
  bool isHover = false;
  bool isAccept = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: lightgreyColor.withOpacity(0.5),
      child: Stack(
        children: [
          DropzoneView(
            onCreated: (controller) => this.controller = controller,
            onHover: () {
              setState(() {
                isHover = true;
              });
            },
            onLeave: () {
              setState(() {
                isHover = false;
              });
            },
            onDrop: acceptFile,
          ),
          Center(
            child: Container(
              width: 500,
              height: 500,
              color: isHover ? Colors.greenAccent : lightBlueColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.cloud_upload,
                    size: 80,
                    color: whiteColor,
                  ),
                  Text(
                    "Drop xlxs FIle Here",
                    style: whiteSubtitle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: isHover
                            ? Colors.greenAccent.withOpacity(0.7)
                            : lightBlueColor.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    onPressed: () async {
                      final event = await controller.pickFiles();
                      if (event.isEmpty) return;
                      acceptFile(event.first);
                    },
                    child: Text(
                      "Seacrh file form folder",
                      style: whiteSubtitle,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 90,
            right: 450,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                size: 25,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future acceptFile(dynamic event) async {
    final name = event.name;
    final fileType = await controller.getFileMIME(event);
   
    print("name : $name");
    print("File Type : $fileType");

    setState(() {
      isHover = false;
    });
    if (!fileType
        .contains("vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              "Tipe file salah, silakan upload file xlxs",
              style: appBarStyle.copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              //TOMBOL oke
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                    alignment: Alignment.center,
                    fixedSize: const Size(132, 32),
                    side: const BorderSide(color: darkBlueColors),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text(
                  "Oke",
                  style: dropDownTextStyle,
                ),
              ),

             
            ],
          );
        },
      );
    }
  }
}
