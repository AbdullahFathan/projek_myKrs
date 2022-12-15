part of 'jdu_bloc.dart';

@immutable
abstract class JduEvent {}

class PostJDU extends JduEvent{
  final PlatformFile exel;


  PostJDU(this.exel);
}

class GetJDU extends JduEvent{}
