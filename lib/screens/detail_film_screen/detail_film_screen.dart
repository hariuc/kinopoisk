import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/blocs/film_bloc/film_bloc.dart';
import 'package:kinopoisk/blocs/film_bloc/film_event.dart';
import 'package:kinopoisk/blocs/film_bloc/film_state.dart';
import 'package:kinopoisk/blocs/film_top_response_favorit_bloc/film_top_response_favorit_bloc.dart';
import 'package:kinopoisk/blocs/film_top_response_favorit_bloc/film_top_response_favorit_event.dart';
import 'package:kinopoisk/common_widgets/common_error_widget.dart';
import 'package:kinopoisk/common_widgets/common_indicator.dart';
import 'package:kinopoisk/model/film.dart';
import 'package:kinopoisk/services/utils.dart';
import 'package:kinopoisk/model/film_top_response.dart';

class DetailFilmScreen extends StatefulWidget {
  final FilmTopResponse filmTopResponse;

  const DetailFilmScreen({required this.filmTopResponse, Key? key})
      : super(key: key);

  @override
  _DetailFilmScreenState createState() => _DetailFilmScreenState();
}

class _DetailFilmScreenState extends State<DetailFilmScreen> {
  final _textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  final _textStyleFilmDescription =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  @override
  void initState() {
    BlocProvider.of<FilmBloc>(context)
        .add(FilmLoadEvent(idFilm: widget.filmTopResponse.filmId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _createAppBar(),
        body: _createBody(),
      );

  AppBar _createAppBar() => AppBar(
        title: const Text(''),
      );

  Widget _createBody() =>
      BlocBuilder<FilmBloc, FilmState>(builder: (context, state) {
        if (state is FilmLoadingState) {
          return CommonIndicator();
        }

        if (state is FilmLoadedState) {
          return _createDetailCardFilm(state);
        }

        return const CommonErrorWidget(errorText: 'errorText');
      });

  Widget _createDetailCardFilm(FilmLoadedState state) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _createImageChild(state.film.posterUrl),
            _createFilmDescriptionChild(state.film),
          ],
        ),
      );

  Widget _createImageChild(String imgPath) => Container(
        child: Image.network(
          imgPath,
          fit: BoxFit.fill,
        ),
      );

  Widget _createFilmDescriptionChild(Film film) => Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    film.nameRu,
                    style: _textStyle,
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<FilmTopResponseFavoritBloc>(context).add(
                          FilmTopResponseFavoritAddEvent(
                              filmTopResponse: widget.filmTopResponse));
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
              Text(film.slogan),
              _getSizedBox(),
              const Text(
                'О фильме',
                style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              _getSizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Год производства'),
                  Text(
                    film.year.toString(),
                    style: _textStyleFilmDescription,
                  ),
                ],
              ),
              _getSizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Страна'),
                  Text('${Utils.parseCountryList(list: film.countries)}'),
                ],
              ),
              _getSizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Жанр'),
                  Text('${Utils.parseGenreList(list: film.genres)}'),
                ],
              ),
              _getSizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Слоган'),
                  Text(
                    film.slogan,
                    style: _textStyleFilmDescription,
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget _getSizedBox() => const SizedBox(
        height: 8.0,
      );
}
