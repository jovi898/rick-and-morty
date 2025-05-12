import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/dependency_injection/app_component.dart';
import 'package:rick_and_morty/domain/use_cases/get_character_details_use_case.dart';
import 'package:rick_and_morty/features/details/state/details/details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit()
      : super(DetailsState(details: null));

  final GetCharacterDetailsUseCase _getCharacterDetailsUseCase =
      getIt.get<GetCharacterDetailsUseCase>();

  Future<void> getDetails(int id) async {
    try {
      final response = await _getCharacterDetailsUseCase.execute(id);
      emit(state.copyWith(details: response));
    } on DioException catch (e) {
      emit(state.copyWith(errorMessage: e.message));
    }
  }
}
