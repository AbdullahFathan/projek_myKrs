
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:mykrs_projek/repository/jdu_repository.dart';


part 'jdu_event.dart';
part 'jdu_state.dart';

class JduBloc extends Bloc<JduEvent, JduState> {
  JduBloc() : super(JduInitial()) {
    on<PostJDU>((event, emit) async {
      print("berhasil masuk ke jdu bloc");
      
      try{
        var response = await JDU().postJDU(event.exel, event.name, event.email);
        print("response ke jdu sudah masuk fungsi");

      response ? emit(JduSuccess()) : emit(JduEror("Tidak berhasil Upload file"));
      print("response jdu bloc berhasil di dapatkan");
      } catch(eror){
        emit(JduEror(eror.toString()));
        print("POST JDU fail [jdu_bloc.dart] = ${eror.toString()}");
      }
    });
  }
}
