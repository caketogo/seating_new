import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  var _user = 'simon';

  String get getUser {
    return _user;
  }
}
