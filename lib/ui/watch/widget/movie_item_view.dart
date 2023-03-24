import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_menia/network/model/movies_list.dart';

import '../../../utils/constants.dart';

Widget movieItemUI(BuildContext context,String? posterimg , String? title) {
  MediaQueryData queryData;
  queryData = MediaQuery.of(context);

  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20,top: 20),
    decoration: ShapeDecoration(
        image:  DecorationImage(
            image:  CachedNetworkImageProvider("$POSTER_IMAGE_PATH$posterimg" ),
            fit: BoxFit.fitWidth),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20))),
    width: queryData.size.width,
    height: queryData.size.height / 4.5,
    child:  Align(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "$title",
            style: TextStyle(color: Colors.white,fontSize: 22),
          ),
        ),
      ),
      alignment: Alignment.bottomLeft,
    ),
  );
}
