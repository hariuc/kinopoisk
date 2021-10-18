import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/blocs/film_bloc/film_bloc.dart';
import 'package:kinopoisk/blocs/film_top_response_bloc/film_top_response_bloc.dart';
import 'package:kinopoisk/blocs/film_top_response_favorit_bloc/film_top_response_favorit_bloc.dart';

import 'package:kinopoisk/screens/main_screen/main_screen.dart';

import 'package:kinopoisk/services/repository.dart';

void main() => runApp(KinopoiskApp());

class KinopoiskApp extends StatelessWidget {
  final repository = Repository();

  KinopoiskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilmTopResponseBloc>(
            create: (context) => FilmTopResponseBloc(repository: repository)),
        BlocProvider<FilmBloc>(
            create: (context) => FilmBloc(repository: repository)),
        BlocProvider<FilmTopResponseFavoritBloc>(
            create: (context) =>
                FilmTopResponseFavoritBloc(repository: repository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }
}
