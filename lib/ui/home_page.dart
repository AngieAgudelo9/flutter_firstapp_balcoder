import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TIPO VARIABLE + NOMBRE DE MI VARIABLE  + INICIALIZAR (=)
  String title = "Este es el título";
  int count = 0;
  bool isRed = false;
  double numDecimal = 0.5;

  @override
  void initState() {
    count = 210;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Center(child: Text(title, style: TextStyle(fontSize: 32.0)))),
      body: Container(
        child: Column(
          children: [
            Spacer(),
            Text("El contador va en: ", style: TextStyle (fontSize: 32.0)),
            Center(
                child: Text(
              count.toString(),
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w800),
            )),
            Container(height: 100, color: Colors.yellow, child: Row(
              children: 
              [Spacer (),
              Container( color: Colors.green,
              width: 50,
              )],)),
            Container(
              child: 
              Spacer()),
              Container( color: Colors.lime)
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