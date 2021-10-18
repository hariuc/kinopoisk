import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/blocs/film_top_response_bloc/film_top_response_bloc.dart';
import 'package:kinopoisk/blocs/film_top_response_bloc/film_top_response_event.dart';
import 'package:kinopoisk/blocs/film_top_response_bloc/film_top_response_state.dart';
import 'package:kinopoisk/common_widgets/common_error_widget.dart';
import 'package:kinopoisk/common_widgets/common_indicator.dart';
import 'package:kinopoisk/common_widgets/film_card_element.dart';


class FilmsListWidget extends StatefulWidget {
  const FilmsListWidget({Key? key}) : super(key: key);

  @override
  _FilmsListWidgetState createState() => _FilmsListWidgetState();
}

class _FilmsListWidgetState extends State<FilmsListWidget> {
  @override
  void initState() {
    BlocProvider.of<FilmTopResponseBloc>(context)
        .add(FilmTopResponseLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FilmTopResponseBloc, FilmTopResponseState>(
          builder: (context, state) {
        if (state is FilmTopResponseLoadingState) {
          return const CommonIndicator();
        }

        if (state is FilmTopResponseLoadedState) {
          return _createFilmTopResponseList(state: state);
        }

        return const CommonErrorWidget(errorText: 'errorText');
      });

  Widget _createFilmTopResponseList(
          {required FilmTopResponseLoadedState state}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: state.filmsList.length,
            itemBuilder: (context, index) =>
                _createCardElement(state: state, index: index)),
      );

  Widget _createCardElement(
          {required FilmTopResponseLoadedState state, required int index}) =>
      FilmCardElement(filmTopResponse: state.filmsList[index]);

}
