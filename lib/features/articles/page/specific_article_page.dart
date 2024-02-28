import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_articles/app/core/enums.dart';
import 'package:user_articles/app/injection_container.dart';
import 'package:user_articles/domain/models/article_model.dart';
import 'package:user_articles/features/articles/cubit/articles_cubit.dart';

class SpecificArticlePage extends StatelessWidget {
  const SpecificArticlePage({Key? key, required this.model}) : super(key: key);

  final ArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: BlocProvider<ArticlesCubit>(
        create: (context) => getIt()..downloadSpecificData(id: model.id),
        child: BlocBuilder<ArticlesCubit, ArticlesState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial state'),
                );
              case (Status.loading):
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Unknown error',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
              case Status.success:
                return Center(
                  child: ListView(
                    children: [
                      for (final author in state.results) ...{
                        _DetailSpecificArticle(author: author),
                      }
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class _DetailSpecificArticle extends StatelessWidget {
  const _DetailSpecificArticle({
    Key? key,
    required this.author,
  }) : super(key: key);

  final ArticleModel author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Image(
            image: NetworkImage(author.picture),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(author.content)
        ],
      ),
    );
  }
}
