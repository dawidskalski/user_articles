import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:user_articles/app/core/enums.dart';
import 'package:user_articles/domain/models/article_model.dart';
import 'package:user_articles/domain/repositories/articles_repository.dart';

part 'articles_state.dart';
part 'articles_cubit.freezed.dart';

@injectable
class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit({required this.articlesRepository})
      : super(
          const ArticlesState(
            results: [],
            status: Status.loading,
            errorMessage: null,
          ),
        );

  final ArticlesRepository articlesRepository;

  Future<void> fetchData({required int authorId}) async {
    try {
      final results = await articlesRepository.getArticlesForAuthorId(authorId);
      emit(
        ArticlesState(
          results: results,
          status: Status.success,
          errorMessage: null,
        ),
      );
    } catch (error) {
      emit(
        ArticlesState(
          results: [],
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
