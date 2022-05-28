import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_menia/network/model/movies_list.dart';

import '../../network/api_client.dart';

class WatchScreenViewModel with ChangeNotifier{

  MoviesList upcomingMoviesList = MoviesList();

  getUpComingMovies(){
    var dio = Dio();
    var apiclient = RestClient(dio);
    apiclient.getUpcomingMoviesList().then((value) => {
      upcomingMoviesList = value,
      print(value.results.toString()),
      notifyListeners()
    });

  }



}
