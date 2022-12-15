import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:mykrs_projek/models/matkul_model.dart';
import 'package:mykrs_projek/repository/jdu_repository.dart';

part 'jdu_event.dart';
part 'jdu_state.dart';

class JduBloc extends Bloc<JduEvent, JduState> {
  final JDU _jdu = JDU();
  JduBloc() : super(JduInitial()) {
    on<PostJDU>((event, emit) async {
      print("berhasil masuk ke jdu bloc");

      try {
        var response = await _jdu.postJDU(event.exel);
        print("response ke jdu sudah masuk fungsi");

        if (response) {
          emit(POSTJduSuccess());
        } else {
          emit(POSTJduEror("Tidak berhasil Upload file"));
        }
        print("response jdu bloc berhasil di dapatkan");
      } catch (eror) {
        emit(POSTJduEror(eror.toString()));
        print("POST JDU fail [jdu_bloc.dart] = ${eror.toString()}");
      }
    });

    on<GetJDU>((event, emit) async {
      try {
        emit(GEtJduLoading());
        var response = await _jdu.getJDU();

        (response != null)
            ? emit(GETJduSuccess(response))
            : emit(GETJduEror("there is eror in response getjdu [jdu_bloc]"));
      } catch (e) {
        emit(GETJduEror(e.toString()));
        print("GET JDU fail [jdu_bloc.dart] = ${e.toString()}");
      }
    });
  }
}
