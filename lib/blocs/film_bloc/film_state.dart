abstract class FilmState {}

class FilmLoadingState extends FilmState {}

class FilmLoadedState extends FilmState {
  final film;

  FilmLoadedState({required this.film});
}

class FilmErrorState extends FilmState {}
