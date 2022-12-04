part of 'jdu_bloc.dart';

@immutable
abstract class JduEvent {}

class PostJDU extends JduEvent{
  final PlatformFile exel;
  final String  name;
  final String email;

  PostJDU(this.exel, this.name, this.email);
}

class GetJDU extends JduEvent{}
