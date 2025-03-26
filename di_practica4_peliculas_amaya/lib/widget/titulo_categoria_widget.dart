import 'package:flutter/material.dart';

Padding tituloCategoriaWidget(String categoria) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      width: 400,
      child: Text(
        categoria,
        style: TextStyle(
            color: const Color(0xFF607D8B), fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
    ),
  );
}