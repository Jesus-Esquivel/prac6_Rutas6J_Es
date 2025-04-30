import 'package:flutter/material.dart';
import 'package:esquivelrutas/pagina_uno.dart';
import 'package:esquivelrutas/pagina_dos.dart';
import 'package:esquivelrutas/pagina_tres.dart';
import 'package:esquivelrutas/pagina_cuatro.dart';
import 'package:esquivelrutas/pagina_cinco.dart';
import 'package:esquivelrutas/pagina_seis.dart';
import 'package:esquivelrutas/pagina_siete.dart';

void main() => runApp(MiRutasApp());

class MiRutasApp extends StatelessWidget {
  const MiRutasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const PantallaUno(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/pantalla2': (context) =>
            const PantallaDos(), // Make sure you have PantallaDos
        '/pantalla3': (context) =>
            const PantallaTres(), // Make sure you have PantallaTres
        '/pantalla4': (context) =>
            const PantallaCuatro(), // Make sure you have PantallaCuatro
        '/pantalla5': (context) =>
            const PantallaCinco(), // Make sure you have PantallaCinco
        '/pantalla6': (context) =>
            const PantallaSeis(), // Make sure you have PantallaSeis
        '/pantalla7': (context) => const PantallaSiete()
      },
    );
  }
}
