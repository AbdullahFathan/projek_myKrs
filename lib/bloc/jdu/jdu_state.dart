part of 'jdu_bloc.dart';

@immutable
abstract class JduState {}

class JduInitial extends JduState {}

class POSTJduSuccess extends JduState {}

class POSTJduLoading extends JduState {}

class POSTJduEror extends JduState {
  final String text;
  POSTJduEror(
    this.text,
  );
}

class GETJduSuccess extends JduState {
  List<Matkul> dataJDU;
  GETJduSuccess(
    this.dataJDU,
  );
}

class GEtJduLoading extends JduState {}

class GETJduEror extends JduState {
  final String text;

  GETJduEror(this.text);
  
}
