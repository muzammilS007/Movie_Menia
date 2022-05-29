import 'package:dio/dio.dart';
import 'package:movie_menia/network/model/movies_detail.dart';
import 'package:movie_menia/network/model/movies_list.dart';
import 'package:movie_menia/utils/constants.dart';
import 'package:retrofit/http.dart';

import '../utils/end_points.dart';
import 'model/movie_trailer_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(EndPoints.GET_UPCOMING_MOVIES)
  Future<MoviesList> getUpcomingMoviesList({
    @Query("api_key") String api_key = API_KEY,
  });

  @GET(EndPoints.GET_MOVIES_DETAIL)
  Future<MovieDetail> getMoviesDetail(
    @Path("id") id, {
    @Query("api_key") String api_key = API_KEY,
  });

  @GET(EndPoints.GET_MOVIES_TRAILER)
  Future<MovieTrailersUrl> getMoviesTrailerUrl(
    @Path("id") id, {
    @Query("api_key") String api_key = API_KEY,
  });
}
