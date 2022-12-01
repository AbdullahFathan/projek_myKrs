part of 'jdu_bloc.dart';

@immutable
abstract class JduState {}

class JduInitial extends JduState {}

class JduSuccess extends JduState {}

class JduLoading extends JduState {}

class JduEror extends JduState {
  final String text;
  JduEror(
    this.text,
  );
}
