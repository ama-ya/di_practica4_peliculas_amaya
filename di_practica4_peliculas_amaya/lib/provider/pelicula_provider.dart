import 'package:di_practica4_peliculas_amaya/data/lista_categorias.dart';
import 'package:di_practica4_peliculas_amaya/data/lista_peliculas.dart';
import 'package:di_practica4_peliculas_amaya/models/pelicula.dart';
import 'package:flutter/material.dart';

class PeliculaProvider with ChangeNotifier {
  // Obtiene las listas desde su archivo
  final List<Pelicula> _peliculas = List.from(listaPeliculas);
  final List<String> _categorias = List.from(listaCategorias);
  
  List<Pelicula> get peliculas => _peliculas;
  List<String> get categorias => _categorias;

  void crearPelicula(String titulo, String descripcion, String anyo) {
    Pelicula p = Pelicula(
        titulo: titulo,
        sinopsis: descripcion,
        anyo: anyo,
        categoria: 'Ciencia Ficción',
        direccion: 'Director',
        imagen: 'lib/images/varios.jpg');

    peliculas.add(p);
    notifyListeners();
  }

  void borrarPelicula(Pelicula pelicula) {
    _peliculas.remove(pelicula);
    notifyListeners();
  }
}
