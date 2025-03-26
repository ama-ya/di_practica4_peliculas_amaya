import 'package:di_practica4_peliculas_amaya/provider/pelicula_provider.dart';
import 'package:di_practica4_peliculas_amaya/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrearPeliculaScreen extends StatelessWidget {
  const CrearPeliculaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarWidget('CREAR PELÍCULA'),
      body: SafeArea(child: const FormularioCrearPelicula()),
    );
  }
}

class FormularioCrearPelicula extends StatefulWidget {
  const FormularioCrearPelicula({
    super.key,
  });

  @override
  State<FormularioCrearPelicula> createState() =>
      _FormularioCrearPeliculaState();
}

class _FormularioCrearPeliculaState extends State<FormularioCrearPelicula> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final titulo = TextEditingController();
  final descripcion = TextEditingController();
  final anyo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(36.0),
          children: <Widget>[
            tituloTextFormField(),
            SizedBox(height: 16),
            descripcionTextFormField(),
            SizedBox(height: 16),
            anyoTextFormField(),
            SizedBox(height: 16),
            botonCrearPelicula(),
          ],
        ),
      ),
    );
  }

  TextFormField tituloTextFormField() {
    return TextFormField(
      controller: titulo,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'El campo no puede estar vacío';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        labelText: 'Título',
      ),
    );
  }

  TextFormField descripcionTextFormField() {
    return TextFormField(
      controller: descripcion,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'El campo no puede estar vacío';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        labelText: 'Descripción',
      ),
    );
  }

  TextFormField anyoTextFormField() {
    return TextFormField(
      controller: anyo,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          // TO-DO:
          // Validar para que sólo se pueda poner un número de 4 cifras
          return 'El campo no puede estar vacío';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        labelText: 'Año',
      ),
    );
  }

  Widget botonCrearPelicula() {
    final provider = context.watch<PeliculaProvider>();
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            provider.crearPelicula(titulo.text, descripcion.text, anyo.text);

            titulo.text = "";
            descripcion.text = "";
            anyo.text = "";
            // TO-DO:
            // Mostrar diálogo informando que se ha creado la película.
          }
        },
        child: const Text('Crear Película'),
      ),
    );
  }
}

  // TO-DO:
  // int? valorSeleccionado;
  // DropdownButton generoDropdownButton() {
