import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Botones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: [
                _titulos(),
                _botonesRedondeados(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottonNavigatorBart(context),
    );
  }

  Widget _fondoApp() {
    final gradiante = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(00, 0.4),
              end: FractionalOffset(00, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ])),
    );

    final cajaRosada = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ],
          ),
        ),
      ),
    );
    return Stack(
      children: [
        gradiante,
        Positioned(
          top: -100,
          left: -80,
          child: cajaRosada,
        )
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Classify transaction',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Classify this transaction into a particular category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottonNavigatorBart(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(
                color: Color.fromRGBO(116, 117, 152, 1.0),
              ),
            ),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bubble_chart), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: ''),
        ],
      ),
    );
  }

  Widget _botonesRedondeados() {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(
                Colors.blue, Icons.ac_unit_outlined, 'General'),
            _crearBotonRedondeado(
                Colors.purpleAccent, Icons.arrow_back, 'General'),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.orange, Icons.access_alarm, 'General'),
            _crearBotonRedondeado(Colors.red, Icons.shop, 'General'),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.green, Icons.insert_chart, 'General'),
            _crearBotonRedondeado(
                Colors.yellow, Icons.access_alarm_rounded, 'General'),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(
                Colors.blueGrey, Icons.enhance_photo_translate, 'General'),
            _crearBotonRedondeado(Colors.greenAccent, Icons.cloud, 'General'),
          ],
        ),
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icono, String texto) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 180.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  radius: 35.0,
                  backgroundColor: color,
                  child: Icon(
                    icono,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                Text(texto, style: TextStyle(color: color)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
