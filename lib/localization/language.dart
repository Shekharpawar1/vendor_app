import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class BaseLanguage {
  static BaseLanguage of(BuildContext context) => Localizations.of<BaseLanguage>(context, BaseLanguage)!;

  String get lblLogin;
  String get lblFormHint1;
  String get lblFormHint2;
  String get lblFormHint3;
  String get lblAds;
  String get lblDash;

}
