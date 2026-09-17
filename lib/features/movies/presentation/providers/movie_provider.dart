import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netfilx/core/network/dio_client.dart';
import 'package:netfilx/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:netfilx/features/movies/data/repositories/movie_repository.dart';
import 'package:netfilx/features/movies/data/repositories/movie_repository_implementation.dart';
import 'package:netfilx/features/movies/domain/usecases/get_popular_movies.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>((ref) {
  final dioClient = ref.read(dioClientProvider);

  return MovieRemoteDataSource(dioClient);
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final remoteDataSource = ref.read(movieRemoteDataSourceProvider);

  return MovieRepositoryImplementation(remoteDataSource);
});

final getPopularMoviesProvider = Provider<GetPopularMovies>((ref) {
  final repository = ref.read(movieRepositoryProvider);

  return GetPopularMovies(repository);
});

final popularMoviesProvider = FutureProvider((ref) async {
  final getPopularMovies = ref.read(getPopularMoviesProvider);
  return getPopularMovies();
});
