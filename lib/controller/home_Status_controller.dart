import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HouseStatusController extends GetxController {
  var houseStatus = [
    {"name": "GARDEN RESTAURANT", "availability": "-NA-", "color": Colors.green},
    {"name": "LOBBY", "availability": "-NA-", "color": Colors.green},
    {"name": "LOUNGE", "availability": "-NA-", "color": Colors.green},
    {"name": "SAUNA", "availability": "-NA-", "color": Colors.green},
    {"name": "SPA", "availability": "-NA-", "color": Colors.green},
    {"name": "GYM", "availability": "-NA-", "color": Colors.red},
    {"name": "TERRACE", "availability": "-NA-", "color": Colors.white},
  ].obs;

  var otherHouseStatus = [
    {"name": "BAR", "availability": "-NA-", "color": Colors.white},
  ].obs;
}
