import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/core/storage/prefs_storage/prefs_storage.dart';
import 'package:flutter_lab/features/top_news/data/repository/models/article_entity.dart';
import 'package:flutter_lab/features/top_news/data/repository/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({required this.repository, required this.prefs})
    : super(NewsState.initial(prefs.getTopPageViewCounter()));

  final ArticleRepository repository;
  final PrefsStorage prefs;

  void incrementPageViewCounter() {
    final counter = prefs.getTopPageViewCounter();
    final updatedCounter = counter + 1;

    prefs.setTopPageViewCounter(updatedCounter);

    emit(state.copyWith(pageViewCounter: updatedCounter));
  }

  Future<void> getTopNews() async {
    try {
      emit(state.copyWith(status: NewsStatus.loading));

      final articles = await repository.getTopNews();

      emit(state.copyWith(status: NewsStatus.loaded, articles: articles));
    } catch (e) {
      emit(state.copyWith(status: NewsStatus.error));

      rethrow;
    }
  }
}
