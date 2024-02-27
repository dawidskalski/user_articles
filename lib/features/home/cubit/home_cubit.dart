import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_articles/app/core/enums.dart';
import 'package:user_articles/domain/models/author_model.dart';
import 'package:user_articles/domain/repositories/authors_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.authorsRepository})
      : super(
          const HomeState(
            results: [],
            status: Status.loading,
            errorMessage: null,
          ),
        );

  final AuthorsRepository authorsRepository;

  Future<void> start() async {
    try {
      final response = await authorsRepository.getAuthorModels();
      emit(
        HomeState(
          results: response,
          status: Status.success,
          errorMessage: null,
        ),
      );
    } catch (error) {
      emit(
        HomeState(
          results: [],
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
