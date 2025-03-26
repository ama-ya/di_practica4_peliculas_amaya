import 'package:flutter/material.dart';

AppBar appBarWidget(String titulo) {
  return AppBar(
    title: Text(titulo,
        style: TextStyle(
          color: const Color(0xFF212C31),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )),
    backgroundColor: Color(0xFFE4EAEC),
    centerTitle: true,
  );
}
