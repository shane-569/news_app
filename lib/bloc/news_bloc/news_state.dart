import 'package:equatable/equatable.dart';
import 'package:new_app/models/response_model/news_response_model.dart';

class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

// ignore: must_be_immutable
class NewsFetchSuccessState extends NewsState {
  NewsResponseModel newsResponseModel;
  NewsFetchSuccessState(this.newsResponseModel);
}

// ignore: must_be_immutable
class NewsUpErrorState extends NewsState {
  String? message;
  NewsUpErrorState({this.message});
}
