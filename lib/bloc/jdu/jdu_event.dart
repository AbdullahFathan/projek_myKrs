part of 'jdu_bloc.dart';

@immutable
abstract class JduEvent {}

class PostJDU extends JduEvent{
  PlatformFile exel;
  String  name;
  String email;

  PostJDU(this.exel, this.name, this.email);
}

class GetJDU extends JduEvent{}
