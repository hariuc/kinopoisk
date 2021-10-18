
import 'package:kinopoisk/database/database_helper.dart';
import 'package:kinopoisk/database/film_top_response_table_setting.dart';
import 'package:kinopoisk/model/film_top_response.dart';

class FilmDBAPI {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  Future<List<FilmTopResponse>> getAllFavoritFilmTopResponse() async {
    var dbClient = await databaseHelper.database;
    
    var films = await dbClient.rawQuery(
            FilmTopResponseTableSetting.sqlQueryGetAllFilms());
            
    List<FilmTopResponse> filmsList = films.isNotEmpty
        ? films.map((e) {
            return FilmTopResponse.fromJson(e);
          }).toList()
        : [];
    return filmsList;
  }

  Future<int> insertFilm(FilmTopResponse filmTopResponse) async {
    var dbClient = await databaseHelper.database;
    var i = filmTopResponse.toJson();
    var result =
        await dbClient.insert(FilmTopResponseTableSetting.tableName, i);
    return result;
  }

  Future<int> deleteFilm(FilmTopResponse filmTopResponse) async {
    var dbClient = await databaseHelper.database;
    return await dbClient.delete(FilmTopResponseTableSetting.tableName,
        where: '${FilmTopResponseTableSetting.filmId} = ?',
        whereArgs: [filmTopResponse.filmId]);
  }
}
