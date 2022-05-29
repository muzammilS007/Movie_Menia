import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_menia/network/model/movie_trailer_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../network/api_client.dart';

class YoutubePlayerViewModel with ChangeNotifier{
  MovieTrailersUrl? movieTrailersUrl;
   YoutubePlayerController? ytbPlayerController;

  getMoviesDetail(id) {
    var dio = Dio();
    var apiclient = RestClient(dio);
    apiclient.getMoviesTrailerUrl(id).then((value) => {
      movieTrailersUrl = value,
      print( movieTrailersUrl?.results![0].key),
      init(),
      notifyListeners()
    });
  }

  init()
  {
    setOrientation([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    String? youtubeId = movieTrailersUrl?.results![0].key;
    ytbPlayerController = YoutubePlayerController(
      initialVideoId: youtubeId!,
      params: YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
/*    WidgetsBinding.instance!.addPostFrameCallback((_) {



    });*/
  }

  setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  void dispose() {
    setOrientation([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ytbPlayerController?.close();
    super.dispose();
  }
}