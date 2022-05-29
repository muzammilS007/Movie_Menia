import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_menia/ui/home/home_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../movie_detail/movie_detail_screen.dart';
import '../watch/watch_screen.dart';
import '../watch/widget/movie_item_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        builder: (cntx, viewmodel, chlid) {
          return Container(
            color: Color.fromARGB(255, 46, 39, 57),
            child: SafeArea(
              left: false,
              right: false,
              bottom: false,
              child: Scaffold(
                body: viewmodel.buildScreens()[viewmodel.index],
                bottomNavigationBar: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 46, 39, 57),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(27),
                          topRight: Radius.circular(27))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => {viewmodel.onTap(0)},
                                iconSize: 30,
                                icon: Icon(
                                  Icons.apps,
                                  color: viewmodel.index == 0
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                "Dashboard",
                                style: TextStyle(
                                    color: viewmodel.index == 0
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => {viewmodel.onTap(1)},
                                iconSize: 30,
                                icon: Icon(
                                  Icons.video_library,
                                  color: viewmodel.index == 1
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                "Watch",
                                style: TextStyle(
                                    color: viewmodel.index == 1
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => {
                                  viewmodel.onTap(2),
                                },
                                iconSize: 30,
                                icon: Icon(
                                  Icons.folder,
                                  color: viewmodel.index == 2
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                "Media Libray",
                                style: TextStyle(
                                    color: viewmodel.index == 2
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => {viewmodel.onTap(3)},
                                iconSize: 30,
                                icon: Icon(
                                  Icons.format_list_numbered,
                                  color: viewmodel.index == 3
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                "More",
                                style: TextStyle(
                                    color: viewmodel.index == 3
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
