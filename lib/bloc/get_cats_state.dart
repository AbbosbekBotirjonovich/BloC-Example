part of 'get_cats_bloc.dart';

@immutable
abstract class GetCatsState {}

class GetCatsInitial extends GetCatsState {}
class GetCatsLoading extends GetCatsState {}
class GetCatsSuccess extends GetCatsState {
  final List<Model> data;
  GetCatsSuccess({required this.data});
}
class GetCatsError extends GetCatsState {}
