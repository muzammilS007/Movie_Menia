import 'package:flutter/material.dart';

extension MoveToDestinationAndRemoveStack on Text {
  Widget textChips(MaterialColor colors) {
    return Container(
      child: this,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: colors),
      padding: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 6.0),
    );
  }
}
