import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

Widget searchItemView(BuildContext context,String? title,String? img){
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 16,
    ).copyWith(
        right: 0
    ),
    child: Row(
      children: <Widget>[
        //'assets/sample/ic_avatar_1.jpg'
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10,top: 10),
          decoration: ShapeDecoration(
              image:  DecorationImage(
                  image:  CachedNetworkImageProvider("${POSTER_IMAGE_PATH}$img" ),
                  fit: BoxFit.fitWidth),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10))),
          width: 100,
          height: 100,
          child:  Text(""),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle(
                  style: Theme?.of(context).textTheme.bodyText2!,
                  child: Text("${title}"),),
              ],
            ),
          ),
        ),

      ],
    ),
  );
}

