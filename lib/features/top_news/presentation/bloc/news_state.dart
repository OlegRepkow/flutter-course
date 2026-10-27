part of 'news_cubit.dart';

enum NewsStatus { loading, loaded, error }

class NewsState extends Equatable {
  const NewsState({
    required this.articles,
    required this.status,
    required this.pageViewCounter,
  });

  factory NewsState.initial(int pageViewCounter) => NewsState(
    articles: const [],
    status: NewsStatus.loading,
    pageViewCounter: pageViewCounter,
  );

  final List<ArticleEntity> articles;
  final NewsStatus status;
  final int pageViewCounter;

  NewsState copyWith({
    List<ArticleEntity>? articles,
    NewsStatus? status,
    int? pageViewCounter,
  }) => NewsState(
    articles: articles ?? this.articles,
    status: status ?? this.status,
    pageViewCounter: pageViewCounter ?? this.pageViewCounter,
  );

  @override
  List<Object?> get props => [articles, status, pageViewCounter];
}
