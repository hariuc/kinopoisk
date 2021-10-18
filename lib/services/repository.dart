import 'package:kinopoisk/model/film.dart';
import 'package:kinopoisk/services/films_api.dart';
import 'package:kinopoisk/model/film_top_response.dart';
import 'package:kinopoisk/services/films_db_api.dart';

class Repository {
  final FilmsAPI _filmsAPI = FilmsAPI();
  final FilmDBAPI _filmDBAPI = FilmDBAPI();

  Future<List<FilmTopResponse>> getTopFilmsFromServer() async {
    var mapData = await _filmsAPI.getTopFilmsFromServer();

    var dataList = mapData['films'] as List;

    List<FilmTopResponse> filmTopResponseList = dataList.isNotEmpty
        ? dataList.map((e) => FilmTopResponse.fromJson(e)).toList()
        : [];

    return filmTopResponseList;
  }

  Future<Film> getFilmFromServer({required int idFilm}) async {
    var data = await _filmsAPI.getFilmFromServer(idFilm: idFilm.toString());

    return Film.fromJson(data);
  }

  //////////////////////////////////////////////////////////////////////////////

  Future<List<FilmTopResponse>> getAllFavoritFilmTopResponse()  async => _filmDBAPI.getAllFavoritFilmTopResponse();

  Future<int> insertFilm(FilmTopResponse filmTopResponse) => _filmDBAPI.insertFilm(filmTopResponse);

  Future<int> deleteFilm(FilmTopResponse filmTopResponse) => _filmDBAPI.deleteFilm(filmTopResponse);
}
