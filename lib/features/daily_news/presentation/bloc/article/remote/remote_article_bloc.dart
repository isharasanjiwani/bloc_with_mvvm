import 'package:block_practice/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:block_practice/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  RemoteArticlesBloc() : super(const RemoteArticlesLoading());

  void onGetArticles


}