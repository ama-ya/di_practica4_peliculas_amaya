import 'package:di_practica4_peliculas_amaya/models/pelicula.dart';
import 'package:di_practica4_peliculas_amaya/provider/pelicula_provider.dart';
import 'package:di_practica4_peliculas_amaya/screens/pelicula_screen.dart';
import 'package:di_practica4_peliculas_amaya/widget/app_bar_widget.dart';
import 'package:di_practica4_peliculas_amaya/widget/campo_buscar.dart';
import 'package:di_practica4_peliculas_amaya/widget/titulo_categoria_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final categoriaProvider = context.watch<PeliculaProvider>().categorias;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarWidget('CATÁLOGO'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              CampoBuscar(), // TO-DO: Hacer fijo
              BotonesCategorias(), // TO-DO: Hacer fijo
              tituloCategoriaWidget(categoriaProvider[2].toString()), // Ciencia Ficción
              ListaPeliculas(categoria: categoriaProvider[2].toString()), // Ciencia Ficción
              tituloCategoriaWidget(categoriaProvider[5].toString()), // Suspense
              ListaPeliculas( categoria: categoriaProvider[5].toString()), // Suspense
              tituloCategoriaWidget(categoriaProvider[0].toString()), // Acción
              ListaPeliculas( categoria: categoriaProvider[0].toString()), // Acción
            ],
          ),
        ),
      ),
    );
  }
}

class BotonesCategorias extends StatelessWidget {
  const BotonesCategorias({super.key});

  @override
  Widget build(BuildContext context) {

    final categoriaProvider = context.watch<PeliculaProvider>().categorias;

    return SizedBox(
      width: 350,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriaProvider.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(100.0, 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(24)),
                    side: BorderSide(
                      width: 1,
                    ),
                  ),
                ),
                onPressed: () {
                  // TO-DO
                  // Al pulsar que haga scroll hasta el TituloCategoria correspondiente
                },
                child: Text(categoriaProvider[index])),
          );
        },
      ),
    );
  }
}

class ListaPeliculas extends StatelessWidget {
  const ListaPeliculas(
      {super.key, required this.categoria});

  final String categoria;

  @override
  Widget build(BuildContext context) {

    final peliculaProvider = context.watch<PeliculaProvider>().peliculas;
    // Filtra las películas por categoría
    final peliculasFiltradas =
        peliculaProvider.where((p) => p.categoria == categoria).toList();

    return SizedBox(
      width: 350,
      height: 450,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: peliculaProvider.length,
        itemBuilder: (BuildContext context, int index) {
          // Devuelve un widget vacío en caso de índice fuera de rango
          if (index >= peliculasFiltradas.length) {
            return SizedBox.shrink();
          }
          return CardPeliculas(pelicula: peliculasFiltradas[index]);
        },
      ),
    );
  }
}

class CardPeliculas extends StatelessWidget {
  const CardPeliculas({
    super.key,
    required this.pelicula,
  });

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<PeliculaProvider>();

    return SizedBox(
      width: 200,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 275,
                    child: Image.asset(
                      pelicula.imagen,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    pelicula.titulo, maxLines: 1,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${pelicula.categoria} - ${pelicula.anyo}",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(pelicula.sinopsis,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          provider.borrarPelicula(pelicula);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PeliculaScreen(pelicula: pelicula)));

                        },
                        icon: const Icon(Icons.info),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
