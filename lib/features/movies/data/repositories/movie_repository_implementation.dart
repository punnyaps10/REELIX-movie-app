import 'dart:convert';

import 'package:netfilx/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:netfilx/features/movies/data/models/movie_model.dart';
import 'package:netfilx/features/movies/data/repositories/movie_repository.dart';
import 'package:netfilx/features/movies/domain/entities/movie.dart';

class MovieRepositoryImplementation implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImplementation(this.remoteDataSource);

  @override
  Future<List<Movie>> getPopularMovies() async {
    final response = await remoteDataSource.getPopularMovies();
    final List results = response.data['results'];

    return results.map((json) => MovieModel.fromJson(json).toEntity()).toList();
  }
}
