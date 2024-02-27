part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<AuthorModel> results,
    required Status status,
    required String? errorMessage,
  }) = _HomeState;
}
