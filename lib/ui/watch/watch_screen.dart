import 'package:flutter/material.dart';
import 'package:movie_menia/ui/watch/watch_screen_viewmodel.dart';
import 'package:movie_menia/ui/watch/widget/movie_item_view.dart';
import 'package:stacked/stacked.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WatchScreenViewModel>.reactive(
        onModelReady: (v) {
          v.getUpComingMovies();
        },
        viewModelBuilder: () => WatchScreenViewModel(),
        builder: (cntx, viewmodel, chile) {
          return Scaffold(

            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(flex: 1,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Watch",style: TextStyle(fontSize: 18),),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    )
                  ],),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: viewmodel.upcomingMoviesList.results?.length,
                    itemBuilder: (cntx, index) {
                      String? poster = viewmodel.upcomingMoviesList.results?[index].posterPath;
                      String? tille = viewmodel.upcomingMoviesList.results?[index].title;
                      return movieItemUI(cntx,poster,tille);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
