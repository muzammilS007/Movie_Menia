import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_menia/network/model/movies_detail.dart';

import '../../network/api_client.dart';

class MovieDetailViewModel with ChangeNotifier {
  MovieDetail? movieDetail;

  getMoviesDetail(id) {
    var dio = Dio();
    var apiclient = RestClient(dio);
    apiclient.getMoviesDetail(id).then((value) => {
          movieDetail = value,
      print(movieDetail?.toJson().toString()),
          notifyListeners()
        });
  }
}
