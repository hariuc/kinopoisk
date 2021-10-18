import 'package:json_annotation/json_annotation.dart';

import 'package:kinopoisk/model/country.dart';
import 'package:kinopoisk/model/genre.dart';

part 'film.g.dart';

@JsonSerializable()
class Film {
  final int kinopoiskId;
  final String imdbId;
  final String nameRu;
  final String? nameEn;
  final String nameOriginal;
  final String posterUrl;
  final String posterUrlPreview;
  final int reviewsCount;
  final double ratingGoodReview;
  final int ratingGoodReviewVoteCount;
  final double ratingKinopoisk;
  final int ratingKinopoiskVoteCount;
  final double ratingImdb;
  final int ratingImdbVoteCount;
  final double ratingFilmCritics;
  final int ratingFilmCriticsVoteCount;
  final double? ratingAwait;
  final int ratingAwaitCount;
  final double? ratingRfCritics;
  final int ratingRfCriticsVoteCount;
  final String webUrl;
  final int year;
  final int filmLength;
  final String slogan;
  final String description;
  final String shortDescription;
  final String? editorAnnotation;
  final bool isTicketsAvailable;
  final String? productionStatus;

  final int? startYear;
  final int? endYear;
  final bool serial;
  final bool shortFilm;
  final bool completed;
  final bool has3D;
  final bool hasImax;

  List<Country> countries;
  List<Genre> genres;

  Film(
      this.kinopoiskId,
      this.imdbId,
      this.nameRu,
      this.nameEn,
      this.nameOriginal,
      this.posterUrl,
      this.posterUrlPreview,
      this.reviewsCount,
      this.ratingGoodReview,
      this.ratingGoodReviewVoteCount,
      this.ratingKinopoisk,
      this.ratingKinopoiskVoteCount,
      this.ratingImdb,
      this.ratingImdbVoteCount,
      this.ratingFilmCritics,
      this.ratingFilmCriticsVoteCount,
      this.ratingAwait,
      this.ratingAwaitCount,
      this.ratingRfCritics,
      this.ratingRfCriticsVoteCount,
      this.webUrl,
      this.year,
      this.filmLength,
      this.slogan,
      this.description,
      this.shortDescription,
      this.editorAnnotation,
      this.isTicketsAvailable,
      this.productionStatus,
      this.startYear,
      this.endYear,
      this.serial,
      this.shortFilm,
      this.completed,
      this.has3D,
      this.hasImax,
      this.countries,
      this.genres);

  factory Film.fromJson(Map<String, dynamic> json) =>
      _$FilmFromJson(json);

  Map<String, dynamic> toJson() => _$FilmToJson(this);
}
