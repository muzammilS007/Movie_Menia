
import 'package:flutter/material.dart';
import 'package:movie_menia/network/model/movies_list.dart';

import '../../../utils/text_field_validator.dart';

class SearchScreenViewModel with ChangeNotifier {
  TextFieldValidator searchText = TextFieldValidator();
  List<Results>? filterResult = [];
  bool flag=true;

  init(List<Results>? realResult) {
    filterResult?.clear();
    realResult?.forEach((element) {
      filterResult?.addAll(realResult);
    });
    notifyListeners();
  }

  setFilter( results) {
    filterResult?.clear();
    filterResult?.addAll(results);
    notifyListeners();
  }


}
