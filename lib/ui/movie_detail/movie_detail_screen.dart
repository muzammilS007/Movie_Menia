
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_menia/ui/movie_detail/movie_detail_viewmodel.dart';
import 'package:movie_menia/utils/extensions.dart';
import 'package:movie_menia/utils/navegation_helper.dart';
import 'package:stacked/stacked.dart';

import '../../utils/constants.dart';
import '../player/youtube_player_screen.dart';

class MovieDetailScreen extends StatelessWidget {
  String? posterimg;
  int? id;

  MovieDetailScreen({Key? key, this.posterimg,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return ViewModelBuilder<MovieDetailViewModel>.reactive(
      onModelReady: (v){
        v.getMoviesDetail(id);
      },
        viewModelBuilder: () => MovieDetailViewModel(),
        builder: (cntx, viewmodel, child) {
          return Scaffold(
            body: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    decoration: ShapeDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                "$POSTER_IMAGE_PATH${viewmodel.movieDetail?.backdropPath}"),
                            fit: BoxFit.fill),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(0))),
                    width: queryData.size.width,
                    height: queryData.size.height/1.8,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 22,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () => {
                                        Navigator.pop(context)
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    "Watch",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Column(
                                children: [
                                  Text(
                                    "${viewmodel.movieDetail?.title}",
                                    style: TextStyle(
                                        color: Colors.amberAccent, fontSize: 22),
                                  ),
                                  SizedBox.fromSize(
                                    size: Size(10.0, 10.0),
                                  ),
                                  Text(
                                    "${viewmodel.movieDetail?.status}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox.fromSize(
                                    size: Size(8.0, 8.0),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all<Size?>(
                                          Size(queryData.size.width / 2,
                                              queryData.size.height / 18)),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.lightBlue),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () => {},
                                    child: Text("Get Tickets"),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all<Size?>(
                                          Size(queryData.size.width / 2,
                                              queryData.size.height / 18)),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            side: BorderSide(
                                                color: Colors.lightBlue)),
                                      ),
                                    ),
                                    onPressed: () => {
                                      YoutubePlayerScreen(movieId: id,).pushNavigation(context)
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox.fromSize(
                                          size: Size(20.0, 20.0),
                                        ),
                                        Icon(Icons.play_arrow),
                                        Text(
                                          "Watch Trailer",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: queryData.size.height*0.6,
                  child: Container (
                    margin: EdgeInsets.only(left: 8,right: 8),
                    padding: const EdgeInsets.all(8.0),
                    width: queryData.size.width,
                    child:  Column (
                      children:[

                         Align(alignment: Alignment.topLeft,child: Padding(
                           padding: const EdgeInsets.only(bottom: 8),
                           child: Text ("Genre",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16), textAlign: TextAlign.left),
                         )),

                        Row(children:  [

                          Text ("Fictions" ,style: TextStyle(backgroundColor: Colors.blue,color: Colors.white),).textChips(Colors.blue),
                          SizedBox(width: 5,),
                          Text ("Horror", style: TextStyle(backgroundColor: Colors.red,color: Colors.white),).textChips(Colors.red),
                          SizedBox(width: 5,),
                          Text ("Action", style: TextStyle(backgroundColor: Colors.green,color: Colors.white),).textChips(Colors.green),
                          SizedBox(width: 5,),
                          Text ("Adventure", style: TextStyle(backgroundColor: Colors.orange,color: Colors.white),).textChips(Colors.orange),
                        ],),

                         Align(alignment: Alignment.topLeft,child: Padding(
                           padding: const EdgeInsets.only(bottom: 8,top: 16),
                           child: Text ("Overview",style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16), textAlign: TextAlign.left),
                         )),
                         Text ("${viewmodel.movieDetail?.overview}", textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
    ;
  }
}
