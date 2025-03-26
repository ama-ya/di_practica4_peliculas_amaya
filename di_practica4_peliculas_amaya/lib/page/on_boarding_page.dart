import 'package:di_practica4_peliculas_amaya/screens/myhomepage.dart';
import 'package:di_practica4_peliculas_amaya/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Bienvenido a tu Catálogo de Peliculas!!',
          body:
              'Descubre una forma sencilla y rápida de explorar y '
              'organizar tus películas favoritas en un sólo lugar. '
              '\n\n Sigue avanzando para saber más. '
              '\n\n Espero que disfrutes mucho!!',
          image: buildImage('lib/images/camara_cine.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Catálogo',
          body:
              'En esta sección, podrás buscar cualquier película que te '
              'interese utilizando el campo de búsqueda. Podrás filtrar '
              'por género, y con solo un toque podrás ver el listado completo '
              'de películas de ese género. También podrás borrar las películas '
              'que no te interesen conservar o añadir una nueva, así como acceder '
              'a la ficha completa de cada película.',
          image: buildImage('lib/images/sala_cine.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Crear Película',
          body: '¿Quieres añadir una película a tu catálogo? '
              '\n Desde esta página puedes crear tu propia película '
              'y añadirla a tu lista personal. Sólo necesitas poner el título, '
              'una breve descripción y el año de estreno. Seleccionar el género '
              'y pulsar el botón para añadir tu película. Así de sencillo.',
          image: buildImage('lib/images/rollo_pelicula.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Ficha de Película',
          body:
              'Conoce cada detalle de tu película favorita. Al hacer clic '
              'sobre el icóno de información en una película desde el catálogo, '
              'serás dirigido a su ficha detallada. Para que lo sepas todo! '
              '\n ¿Estás preparado para empezar el viaje?',
          footer: ButtonWidget(
            text: 'Vamos!!!',
            onClicked: () => goCatalogo(context),
          ),
          image: buildImage('lib/images/sala_cine_palomitas.jpg'),
          decoration: getPageDecoration(),
        ),
      ],
      done: Text('Leído',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF212C31))),
      onDone: () => goCatalogo(context),
      showSkipButton: true,
      skip: Text('Saltar',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF212C31))),
      onSkip: () => goCatalogo(context),
      next: Icon(
        Icons.arrow_forward,
        color: Color(0xFF212C31),
      ),
      dotsDecorator: getDotDecoration(),
      animationDuration: 500,
    );
  }

  void goCatalogo(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => MyHomePage()),
    );
  }

  Widget buildImage(String path) {
    return Center(child: Image.asset(path, width: 300));
  }

  //Decoración de los puntos de Material
  DotsDecorator getDotDecoration() {
    return DotsDecorator(
      color: Color(0xFF99AEB8),
      activeColor: const Color(0xFF212C31),
      size: Size(8, 8),
      activeSize: Size(18, 8),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }

  //Decoración de página de Material
  PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 16),
      imagePadding: EdgeInsets.all(10),
      imageFlex: 2,
      bodyFlex: 3,
      footerFlex: 1,
    );
  }
}
