import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/bloc/news_bloc/news_event.dart';
import 'package:new_app/bloc/news_bloc/news_state.dart';
import 'package:new_app/repository/app_repo.dart';

class NewsUpBloc extends Bloc<NewsEvent, NewsState> {
  Repository repository = Repository();
  NewsUpBloc(NewsState initialState, this.repository) : super(initialState);

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsEventFetchEvent) {
      yield NewsLoadingState();
      {
        var response;
        try {
          response = await repository.getNews();
          yield NewsFetchSuccessState(response);
        } catch (e) {
          yield NewsUpErrorState(message: e.toString());
        }
      }
    }
  }
}
