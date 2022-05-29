import 'package:flutter/material.dart';
import 'package:movie_menia/ui/movie_detail/movie_detail_screen.dart';
import 'package:movie_menia/ui/watch/search/search_screen.dart';
import 'package:movie_menia/ui/watch/watch_screen_viewmodel.dart';
import 'package:movie_menia/ui/watch/widget/movie_item_view.dart';
import 'package:movie_menia/utils/navegation_helper.dart';
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
          return viewmodel.index == 0
              ? Column(
              children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        const Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Watch",
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () => {viewmodel.onTap(1)},
                            icon: Icon(Icons.search),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount:
                      viewmodel.upcomingMoviesList.results?.length,
                      itemBuilder: (cntx, index) {
                        String? poster = viewmodel
                            .upcomingMoviesList.results?[index].posterPath;

                        String? tille = viewmodel
                            .upcomingMoviesList.results?[index].title;

                        int? id = viewmodel
                            .upcomingMoviesList.results?[index].id;
                        return GestureDetector(
                            onTap: () => {

                              print(id.toString()),
                              MovieDetailScreen(id: id,).pushNavigation(context)

                            },
                            child: movieItemUI(cntx, poster, tille));
                      },
                    ),
                  ),
              ],
          )
              : SearchScreen(
                 moviesList: viewmodel.upcomingMoviesList,
                  closeClick: () {
                    viewmodel.onTap(0);
                  },
                );
        });
  }
}
