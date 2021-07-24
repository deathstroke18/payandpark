import 'package:flutter/material.dart';

setSearchParam(String vno) {
  List<String> vnoSearchList = [];
  String temp = "";
  for (int i = 0; i < vno.length; i++) {
    temp = temp + vno[i];
    vnoSearchList.add(temp);
  }
  return vnoSearchList;
}