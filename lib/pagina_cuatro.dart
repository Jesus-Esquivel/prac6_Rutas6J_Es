import 'package:flutter/material.dart';

class PantallaCuatro extends StatefulWidget {
  const PantallaCuatro({Key? key}) : super(key: key);

  @override
  State<PantallaCuatro> createState() => _PantallaCuatroState();
}

class _PantallaCuatroState extends State<PantallaCuatro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Agregué Scaffold para la estructura básica de la pantalla
      appBar: AppBar(
        title: const Text(
          'Pantalla 6 Esquivel', // Mantuve el título
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff3b2df8),
      ),
      body: Container(
        height: 120.0,
        width: double.infinity,
        color: Colors.blueGrey,
        child: const Align(
          alignment: Alignment.bottomLeft,
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}
