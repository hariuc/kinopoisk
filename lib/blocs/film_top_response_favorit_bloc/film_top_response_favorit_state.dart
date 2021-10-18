import 'package:kinopoisk/model/film_top_response.dart';

abstract class FilmTopResponseFavoritState {}

class FilmTopResponseFavoritLoadingState extends FilmTopResponseFavoritState {}

class FilmTopResponseFavoritLoadedState extends FilmTopResponseFavoritState {
  List<FilmTopResponse> filmsList;

  FilmTopResponseFavoritLoadedState({required this.filmsList});
}

class FilmTopResponseFavoritErrorState extends FilmTopResponseFavoritState {}
