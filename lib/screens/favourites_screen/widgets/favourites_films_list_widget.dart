import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/blocs/film_top_response_favorit_bloc/film_top_response_favorit_bloc.dart';
import 'package:kinopoisk/blocs/film_top_response_favorit_bloc/film_top_response_favorit_event.dart';
import 'package:kinopoisk/blocs/film_top_response_favorit_bloc/film_top_response_favorit_state.dart';
import 'package:kinopoisk/common_widgets/common_error_widget.dart';
import 'package:kinopoisk/common_widgets/common_indicator.dart';
import 'package:kinopoisk/common_widgets/film_card_element.dart';

class FavouritesFilmsListWidget extends StatefulWidget {
  const FavouritesFilmsListWidget({Key? key}) : super(key: key);

  @override
  _FavouritesFilmsListWidgetState createState() => _FavouritesFilmsListWidgetState();
}

class _FavouritesFilmsListWidgetState extends State<FavouritesFilmsListWidget> {
  
  @override
  void initState() {
    BlocProvider.of<FilmTopResponseFavoritBloc>(context)
        .add(FilmTopResponseFavoritLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FilmTopResponseFavoritBloc, FilmTopResponseFavoritState>(
          builder: (context, state) {
            if (state is FilmTopResponseFavoritLoadingState) {
              return const CommonIndicator();
            }

            if (state is FilmTopResponseFavoritLoadedState) {
              return _createFilmTopResponseList(state: state);
            }

            return const CommonErrorWidget(errorText: 'errorText');
          });

  Widget _createFilmTopResponseList(
      {required FilmTopResponseFavoritLoadedState state}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: state.filmsList.length,
            itemBuilder: (context, index) =>
                _createCardElement(state: state, index: index)),
      );

  Widget _createCardElement(
      {required FilmTopResponseFavoritLoadedState state, required int index}) =>
      FilmCardElement(filmTopResponse: state.filmsList[index]);
}
