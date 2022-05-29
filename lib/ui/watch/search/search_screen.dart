import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_menia/network/model/movies_list.dart';
import 'package:movie_menia/ui/watch/search/search_screen_viewmodel.dart';
import 'package:movie_menia/ui/watch/search/widget/search_card.dart';
import 'package:movie_menia/ui/watch/search/widget/search_item_view.dart';
import 'package:movie_menia/utils/navegation_helper.dart';
import 'package:stacked/stacked.dart';

import '../../movie_detail/movie_detail_screen.dart';

class SearchScreen extends StatelessWidget {
  Function()? closeClick;
  MoviesList? moviesList;

  SearchScreen({Key? key, this.closeClick, this.moviesList}) : super(key: key);
  var newlist;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchScreenViewModel>.reactive(
      onModelReady: (v){
        v.init(moviesList?.results);
      },
        viewModelBuilder: () => SearchScreenViewModel(),
        builder: (cntx, viewmodel, child) {
          return WillPopScope(
            onWillPop: () async {
              closeClick!();
              return false;
            },
            child: SafeArea(
                child: Column(
              children: [
                SearchCard(
                  screenViewModel: viewmodel,
                  reqWidget: (txt) => {
                    if(txt.isNotEmpty)
                      {

                      newlist = moviesList?.results?.where((element) => element.title!.toLowerCase().contains(txt.toLowerCase())),
                        viewmodel.setFilter(newlist)

                    }
                    else{
                      viewmodel.init(moviesList?.results)
                    }
                  },
                  close: () {
                    viewmodel.init(moviesList?.results);

                  },
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: viewmodel.filterResult?.length,
                        itemBuilder: (cntx, index) {
                          return InkWell(
                            onTap: (){
                              MovieDetailScreen(id: viewmodel.filterResult?[index].id,).pushNavigation(context);
                            },
                            child: searchItemView(
                                context,
                                viewmodel.filterResult![index].title,
                                viewmodel.filterResult![index].posterPath),
                          );
                        }))
              ],
            )),
          );
        });
  }
}
