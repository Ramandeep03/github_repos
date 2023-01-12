import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
 static push(BuildContext context, {required Widget screen}) {
    var route = Platform.isAndroid
        ? MaterialPageRoute(builder: (_) => screen)
        : CupertinoPageRoute(builder: (_) => screen);
    Navigator.push(context, route);
  }

  static pushReplacement(BuildContext context, {required Widget screen}) {
    var route = Platform.isAndroid
        ? MaterialPageRoute(builder: (_) => screen)
        : CupertinoPageRoute(builder: (_) => screen);
    Navigator.pushReplacement(context, route);
  }
}
