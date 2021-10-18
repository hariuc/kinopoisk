import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/blocs/film_bloc/film_event.dart';
import 'package:kinopoisk/blocs/film_bloc/film_state.dart';
import 'package:kinopoisk/services/repository.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final Repository repository;

  FilmBloc({required this.repository}) : super(FilmLoadingState());

  @override
  Stream<FilmState> mapEventToState(FilmEvent event) async* {
    yield FilmLoadingState();

    if (event is FilmLoadEvent) {
      try {
        final idFilm = event.idFilm;
        final film = await repository.getFilmFromServer(idFilm: idFilm);

        yield FilmLoadedState(film: film);
      } catch (e) {
        yield FilmErrorState();
      }
    }
  }
}
