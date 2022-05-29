import 'package:flutter/material.dart';
import 'package:movie_menia/ui/player/youtube_player_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';


class YoutubePlayerScreen extends StatelessWidget {
  int? movieId;

  YoutubePlayerScreen({Key? key, this.movieId}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ViewModelBuilder<YoutubePlayerViewModel>.reactive(
        onModelReady: (v)=>{
          v.getMoviesDetail(movieId),
        },
          viewModelBuilder: () => YoutubePlayerViewModel(),
          builder: (cntx, viewmodel, chile) {
            return Container(
              color: Colors.black,
              child: SafeArea(
                left: false,
                right: false,
                bottom: false,
                child: _buildYtbView(viewmodel),
              ),
            );
          }),
    );
  }

  _buildYtbView(YoutubePlayerViewModel youtubePlayerViewModel) {
    return AspectRatio(
      aspectRatio: 18 / 8,
      child: youtubePlayerViewModel.ytbPlayerController != null
          ? YoutubePlayerIFrame(controller: youtubePlayerViewModel.ytbPlayerController)
          : Center(child: CircularProgressIndicator()),
    );
  }


}
