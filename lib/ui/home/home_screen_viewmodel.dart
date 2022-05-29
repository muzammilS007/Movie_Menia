import 'package:flutter/material.dart';
import 'package:movie_menia/ui/dashboard/dashboard_screen.dart';
import 'package:movie_menia/ui/watch/watch_screen.dart';

import '../media_libray/media_libray_screen.dart';
import '../more/more_screen.dart';

class HomeScreenViewModel with ChangeNotifier{
  int index = 1;

  List<Widget> buildScreens() {
    return [
      DashboardScreen(),
      WatchScreen(),
      MediaLibrayScreen(),
      MoreScreen(),
    ];
  }


  void onTap(int index) {
    this.index = index;
    notifyListeners();

  }
}