import 'package:di_practica4_peliculas_amaya/screens/catalogo_screen.dart';
import 'package:di_practica4_peliculas_amaya/screens/crear_pelicula_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined), 
            label: 'Catálogo',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add),
            icon: Icon(Icons.add_outlined), 
            label: 'Películas',
          ),
        ],
      ),
      body: [
        const CatalogoScreen(),
        const CrearPeliculaScreen(),
      ][currentPageIndex],
    );
  }
}