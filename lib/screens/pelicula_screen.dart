import 'package:di_practica4_peliculas_amaya/models/pelicula.dart';
import 'package:di_practica4_peliculas_amaya/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

class PeliculaScreen extends StatelessWidget {
  const PeliculaScreen({super.key, required this.pelicula});

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarWidget('PELÍCULA'),// TO-DO: Quitar magic words
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              VistaPelicula(pelicula: pelicula),
            ],
          ),
        ),
      ),
    );
  }
}

class VistaPelicula extends StatelessWidget {
  const VistaPelicula({
    super.key,
    required this.pelicula,
  });

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            pelicula.imagen,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              pelicula.titulo,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                child: Text(
                  "${pelicula.categoria} -",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Text(
                pelicula.anyo.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                "Sinopsis",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              pelicula.sinopsis,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                "Dirección",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              pelicula.direccion,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
          ),
          SizedBox(height: 50,),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Ver reparto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
