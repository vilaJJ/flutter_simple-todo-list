import 'package:flutter/material.dart';

class MediaQueryHelper {
  MediaQueryHelper.of(this.context);

  final BuildContext context;

  double getHeight({double percentage = 1}) {
    return MediaQuery.sizeOf(context).height * percentage;
  }

  double getWidth({double percentage = 1}) {
    return MediaQuery.sizeOf(context).width * percentage;
  }
}
