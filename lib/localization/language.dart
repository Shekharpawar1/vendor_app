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
  String get lblBottomAppBar1;
  String get lblBottomAppBar2;
  String get lblBottomAppBar3;
  String get lblBottomAppBar4;


  String get HomeGridTitle1;
  String get HomeGridTitle2;
  String get HomeGridTitle3;
  String get HomeGridTitle4;


  String get HomeCount;

  String get Hometitle1;

  String get HomeTitle1content1;
  String get HomeTitle1content2;
  String get HomeTitle1content3;
  String get HomeTitle1content4;

  String get Hometitle2;
  String get Hometitle2subContent2;

  String get lblBookingChannel;


  String get lblCritique;
  String get lblCritiquesubtitle;
  String get lblrating1;
  String get lblrating2;
  String get lblrating3;
  String get lblCritiquesubtitle1;
  String get lblCritiquesubtitle2;

  String get lblCritiquesubtitle3;
  String get lblReviewTitle;

}
