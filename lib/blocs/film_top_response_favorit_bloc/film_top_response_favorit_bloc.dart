import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/blocs/film_top_response_favorit_bloc/film_top_response_favorit_event.dart';
import 'package:kinopoisk/blocs/film_top_response_favorit_bloc/film_top_response_favorit_state.dart';
import 'package:kinopoisk/services/repository.dart';

class FilmTopResponseFavoritBloc
    extends Bloc<FilmTopResponseFavoritEvent, FilmTopResponseFavoritState> {
  final Repository repository;

  FilmTopResponseFavoritBloc({required this.repository})
      : super(FilmTopResponseFavoritLoadingState());

  @override
  Stream<FilmTopResponseFavoritState> mapEventToState(
      FilmTopResponseFavoritEvent event) async* {
    yield FilmTopResponseFavoritLoadingState();

    if (event is FilmTopResponseFavoritLoadEvent) {
      try {
        final filmsList = await repository.getAllFavoritFilmTopResponse();
        yield FilmTopResponseFavoritLoadedState(filmsList: filmsList);
      } catch (e) {
        yield FilmTopResponseFavoritErrorState();
      }
    }

    if (event is FilmTopResponseFavoritAddEvent) {
      try {
        await repository.insertFilm(event.filmTopResponse);
        final filmsList = await repository.getAllFavoritFilmTopResponse();
        yield FilmTopResponseFavoritLoadedState(filmsList: filmsList);
      } catch (e) {
        yield FilmTopResponseFavoritErrorState();
      }
    }

    if (event is FilmTopResponseFavoritDeleteEvent) {
      try {
        await repository.deleteFilm(event.filmTopResponse);
        final filmsList = await repository.getAllFavoritFilmTopResponse();
        yield FilmTopResponseFavoritLoadedState(filmsList: filmsList);
      } catch (e) {
        yield FilmTopResponseFavoritErrorState();
      }
    }
  }
}
