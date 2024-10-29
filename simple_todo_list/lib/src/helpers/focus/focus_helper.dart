import 'package:flutter/material.dart';

class FocusHelper {
  FocusHelper.of(this.context);

  final BuildContext context;

  void unfocus() {
    FocusScope.of(context).unfocus();
  }
}
