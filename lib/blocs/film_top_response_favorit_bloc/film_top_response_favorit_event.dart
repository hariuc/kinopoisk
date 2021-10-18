import 'package:kinopoisk/model/film_top_response.dart';

abstract class FilmTopResponseFavoritEvent {}

class FilmTopResponseFavoritLoadEvent extends FilmTopResponseFavoritEvent {}

class FilmTopResponseFavoritAddEvent extends FilmTopResponseFavoritEvent {
  final FilmTopResponse filmTopResponse;

  FilmTopResponseFavoritAddEvent({required this.filmTopResponse});
}

class FilmTopResponseFavoritDeleteEvent extends FilmTopResponseFavoritEvent {
  final FilmTopResponse filmTopResponse;

  FilmTopResponseFavoritDeleteEvent({required this.filmTopResponse});
}
