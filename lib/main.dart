import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/bloc/news_bloc/news_bloc.dart';
import 'package:new_app/bloc/news_bloc/news_state.dart';
import 'package:new_app/repository/app_repo.dart';
import 'package:new_app/views/news_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsUpBloc(NewsInitialState(), Repository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewView(),
      ),
    );
  }
}
