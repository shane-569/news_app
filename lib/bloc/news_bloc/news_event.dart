import 'package:equatable/equatable.dart';

class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class NewsEventFetchEvent extends NewsEvent {
  NewsEventFetchEvent();
}
