// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ExpacerAppBar extends AppBar {
  final bool estaNahome;
  String? texto;
  ExpacerAppBar(
      {Key? key,
      double elevation = 2,
      required this.estaNahome,
      required texto})
      : super(
            key: key,
            elevation: elevation,
            centerTitle: false,
            automaticallyImplyLeading: estaNahome ? false : true,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(texto),
                  const SizedBox(
                    width: 20,
                  ),
                ]));
}
