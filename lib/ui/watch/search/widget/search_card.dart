import 'package:flutter/material.dart';

import '../search_screen_viewmodel.dart';


class SearchCard extends StatelessWidget {
  final Function(String)? reqWidget;
   Function()? close;
  final SearchScreenViewModel? screenViewModel;
  SearchCard({Key? key, this.reqWidget,this.screenViewModel,this.close}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.all(
            Radius.circular(22.0),
          ),
        ),
        child: TextField(
          onChanged:(value) {
            reqWidget!(value);
          } ,
          /*     onSubmitted: (value) {
            reqWidget(value ?? "");
          },*/

          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder:  InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "Search Tv , movies ..",
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            suffixIcon:  IconButton(
              onPressed: ()=>{
                close!(),
                screenViewModel?.searchText.textEditingController.text="",
              },
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            hintStyle: const TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          maxLines: 1,
          controller: screenViewModel?.searchText.textEditingController,
        ),
      ),
    );
  }
}





/*

*/
