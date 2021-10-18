import 'package:flutter/material.dart';
import 'package:kinopoisk/model/film_top_response.dart';
import 'package:kinopoisk/screens/detail_film_screen/detail_film_screen.dart';
import 'package:kinopoisk/services/utils.dart';

class FilmCardElement extends StatelessWidget {
  final FilmTopResponse filmTopResponse;

  const FilmCardElement({required this.filmTopResponse, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameRu = filmTopResponse.nameRu;
    var nameEn = filmTopResponse.nameEn ?? '';
    var year = filmTopResponse.year;
    var posterUrlPreview = filmTopResponse.posterUrlPreview;

    var countryList = filmTopResponse.countries as List;
    var genreList = filmTopResponse.genres as List;

    var srtCountry = Utils.parseCountryList(list: countryList);
    var strGenre = Utils.parseGenreList(list: genreList);

    return InkWell(
      onTap: () {
        _navigateToDetailFilm(context: context);
      },
      child: Card(
        elevation: 3.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              posterUrlPreview,
              height: 200,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameRu,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _createSizeBox(),
                  Text(
                    nameEn,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _createSizeBox(),
                  Text(srtCountry + ' * ' + strGenre),
                  _createSizeBox(),
                  Text(
                    'Год: $year',
                    style: const TextStyle(fontSize: 16),
                  ),
                  _createSizeBox(),
                  Text(
                    'Продолжительность: ${filmTopResponse.filmLength}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  _createSizeBox(),
                  Text(
                    'Рейтинг: ${filmTopResponse.rating}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToDetailFilm({required BuildContext context}) async {
    var route = MaterialPageRoute(
        builder: (context) =>
            DetailFilmScreen(filmTopResponse: filmTopResponse));
    await Navigator.push(context, route);
  }

  Widget _createSizeBox() => const SizedBox(
        height: 10,
      );
}
