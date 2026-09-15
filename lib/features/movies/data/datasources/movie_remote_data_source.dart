import 'package:dio/dio.dart';
import 'package:netfilx/core/constants/api_constants.dart';
import 'package:netfilx/core/network/dio_client.dart';

class MovieRemoteDataSource {
  final DioClient dioClient;

  MovieRemoteDataSource(this.dioClient);

  Future<Response> getPopularMovies() async {
    final response = await dioClient.dio.get(ApiConstants.popularMovies);
    return response;
  }
}
