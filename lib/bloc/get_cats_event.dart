part of 'get_cats_bloc.dart';

@immutable
abstract class GetCatsEvent {}

class GetCatsPhoto extends GetCatsEvent{
  final String? number;

  GetCatsPhoto({this.number});
}