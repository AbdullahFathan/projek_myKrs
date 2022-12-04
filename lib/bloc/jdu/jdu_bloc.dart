


import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:mykrs_projek/repository/jdu_repository.dart';


part 'jdu_event.dart';
part 'jdu_state.dart';

class JduBloc extends Bloc<JduEvent, JduState> {
  JduBloc() : super(JduInitial()) {
    on<PostJDU>((event, emit) async {
      
      try{
        var response = await JDU().postJDU(event.exel, event.name, event.email);

      response ? emit(JduSuccess()) : emit(JduEror("Tidak berhasil Upload file"));
      } catch(eror){
        emit(JduEror(eror.toString()));
        print("POST JDU fail [jdu_bloc.dart] = ${eror.toString()}");
      }
    });
  }
}
