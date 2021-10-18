import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/blocs/film_top_response_bloc/film_top_response_event.dart';
import 'package:kinopoisk/blocs/film_top_response_bloc/film_top_response_state.dart';
import 'package:kinopoisk/services/repository.dart';

class FilmTopResponseBloc
    extends Bloc<FilmTopResponseEvent, FilmTopResponseState> {
  final Repository repository;

  FilmTopResponseBloc({required this.repository})
      : super(FilmTopResponseLoadingState());

  @override
  Stream<FilmTopResponseState> mapEventToState(
      FilmTopResponseEvent event) async* {
    yield FilmTopResponseLoadingState();

    if (event is FilmTopResponseLoadEvent) {
      try {
        final filmsList = await repository.getTopFilmsFromServer();
        yield FilmTopResponseLoadedState(filmsList: filmsList);
      } catch (e) {
        yield FilmTopResponseErrorState();
      }
    }
  }
}
