import 'package:block_practice/config/theme/app_themes.dart';
import 'package:block_practice/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:block_practice/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/daily_news/presentation/pages/home/daily_news.dart';
import 'injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => s1()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}

