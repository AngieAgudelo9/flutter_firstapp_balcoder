import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TIPO VARIABLE + NOMBRE DE MI VARIABLE  + INICIALIZAR (=)
  // BOLL: Falso/Verdadero
  String title = "Este es el título";
  int count = 0;
  bool mybool = true;
  double numDecimal = 0.5;

  @override
  void initState() {
    count = 210;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//MEDIAQUERY: IDENTIFICA EL TAMAÑO DEL DISPOSITIVO (HEIGHT:ALTO,WIDTH:ANCHO)
//
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    print(_height);
    print(_width);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Center(child: Text(title, style: TextStyle(fontSize: 32.0)))),
      body: Container(
        child: Column(
          children: [
            Spacer(),
            Text("El contador va en: ", style: TextStyle(fontSize: 32.0)),
            Center(
                child: Text(
              count.toString(),
              //FontWeight: grosor de la fuente.
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.yellow),
            )),

            //SPACER: ESPACIO CONTAINER:

            GestureDetector(
              onTap: () {
                print("lo undimos)");

//!mybool: Intermediación me sirve para cambios
                setState(() {
                                  mybool = !mybool;

                });




              },
              child: Container(
                width: _width * 0.8,
                height: _height * 0.1,
                color: Colors.yellow,
              ),
            ),

            Container(
                width: _width * 0.5,
                height: _height * 0.3,
                //Estoy aplicando una condicional, donde le digo true/false de unos colores en específico. 
                color: mybool ? Colors.green:  Colors.red,
                child: Icon(
                  Icons.calculate,
                  color: Colors.yellow,
                  size: 40,
                )),
            Spacer()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count = count + 1;
          });

          print(title);
          print(count);
        },
        child: Icon(Icons.calculate),
      ),
    );
  }
}
