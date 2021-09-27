import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/bloc/news_bloc/news_bloc.dart';
import 'package:new_app/bloc/news_bloc/news_event.dart';
import 'package:new_app/bloc/news_bloc/news_state.dart';
import 'package:new_app/widgets/app_bar.dart';
import 'package:new_app/widgets/app_error.dart';
import 'package:new_app/widgets/app_search.dart';
import 'package:new_app/widgets/news_card_view.dart';

class NewView extends StatefulWidget {
  const NewView({Key? key}) : super(key: key);

  @override
  _NewViewState createState() => _NewViewState();
}

class _NewViewState extends State<NewView> {
  NewsUpBloc? newsUpBloc;
  TextEditingController searchTextController = new TextEditingController();
  @override
  void initState() {
    newsUpBloc = BlocProvider.of<NewsUpBloc>(context);
    newsUpBloc!.add(NewsEventFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(
        appBarName: 'News',
        isLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppSearchBar(
              searchText: searchTextController,
              onPressed: () {},
              suffixIcon: GestureDetector(
                  onTap: () {
                    searchTextController.text = "";
                  },
                  child: const Icon(Icons.close)),
            ),
          ),
          Expanded(child: Center(
            child:
                BlocBuilder<NewsUpBloc, NewsState>(builder: (context, state) {
              if (state is NewsInitialState) {
                return Platform.isIOS
                    ? CupertinoActivityIndicator()
                    : CircularProgressIndicator();
              } else if (state is NewsLoadingState) {
                return Platform.isIOS
                    ? CupertinoActivityIndicator()
                    : CircularProgressIndicator();
              } else if (state is NewsFetchSuccessState) {
                return Builder(builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          Divider(),
                          Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                newsUpBloc!.add(NewsEventFetchEvent());
                              },
                              child: ListView.builder(
                                  itemCount:
                                      state.newsResponseModel.articles!.length,
                                  itemBuilder: (context, index) {
                                    return NewsCardView(
                                        author: state.newsResponseModel
                                            .articles![index].source!.name!,
                                        title: state.newsResponseModel
                                            .articles![index].title!,
                                        description: state.newsResponseModel
                                            .articles![index].description!,
                                        url: state.newsResponseModel
                                            .articles![index].url!,
                                        urlToImage: state.newsResponseModel
                                            .articles![index].urlToImage!,
                                        content: "",
                                        press: () {});
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              } else if (state is NewsUpErrorState)
                return AppErrorWidget(
                  barrierDismissible: false,
                  onApplyClick: () {
                    SchedulerBinding.instance!.addPostFrameCallback((_) {});
                  },
                );
              return Scaffold();
            }),
          ))
        ],
      ),
    );
  }
}
