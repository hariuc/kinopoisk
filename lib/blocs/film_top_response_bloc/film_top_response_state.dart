abstract class FilmTopResponseState {}

class FilmTopResponseLoadingState extends FilmTopResponseState {}

class FilmTopResponseLoadedState extends FilmTopResponseState {
  final List<dynamic> filmsList;

  FilmTopResponseLoadedState({required this.filmsList});
}

class FilmTopResponseErrorState extends FilmTopResponseState {}
