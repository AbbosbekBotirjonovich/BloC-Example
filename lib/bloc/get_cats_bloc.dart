import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial1/model/model.dart';
import 'package:bloc_tutorial1/repository/get_cats_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'get_cats_event.dart';

part 'get_cats_state.dart';

class GetCatsBloc extends Bloc<GetCatsEvent, GetCatsState> {
  final GetCatRepo repo;
  GetCatsBloc({required this.repo}) : super(GetCatsInitial()) {
    on<GetCatsPhoto>((event, emit) async {
      emit(GetCatsLoading());
      final result = await repo.getCatsData(event.number ?? "1");
      emit(GetCatsSuccess(data: result));
    });
  }
}
