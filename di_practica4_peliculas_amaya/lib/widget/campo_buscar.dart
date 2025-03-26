import 'package:flutter/material.dart';

class CampoBuscar extends StatelessWidget {
  const CampoBuscar({super.key});

  @override
  Widget build(BuildContext context) {
    var labelText = 'Buscar película...';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            labelText: labelText,
            contentPadding: EdgeInsets.all(16.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          onSubmitted:(value) {
            // TO-DO:
            // Buscar en la lista de películas y que lleve a pelicula_screen de la película
            labelText = labelText;
          },
        ),
      ),
    );
  }
}
