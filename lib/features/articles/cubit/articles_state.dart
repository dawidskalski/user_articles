part of 'articles_cubit.dart';

@freezed
class ArticlesState with _$ArticlesState {
  const factory ArticlesState({
    required List<ArticleModel> results,
    required Status status,
    required String? errorMessage,
  }) = _ArticlesState;
}
