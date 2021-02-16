import 'package:flutter/material.dart';
import 'package:flutter_firstapp_balcoder/ui/second_page.dart';

class PracticaPage extends StatefulWidget {
  @override
  _PracticaPageState createState() => _PracticaPageState();
}

class _PracticaPageState extends State<PracticaPage> {
  String myName = "ANGAGUDE";
  int count = 0;
  double decimalNumer = 4.5;
  bool myBool = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    print(_height);
    print(_width);

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.yellow,
        backgroundColor: Colors.pink,
        title: Center(
            child: Text(
          "ANGAGUDE",
          style: TextStyle(color: Colors.red[100]),
        )),
      ),
      body: Container(
          color: Colors.red[100],
          child: Column(
            children: [
              Center(
                  child: Text(count.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 24.0,
                      ))),

                      GestureDetector(
                        onTap: (){
                        print("ONTAP");
                        

                        setState(() {
                          myBool = !myBool;
                        });

                        },
                        child: 
              Container(
                        height: _height * 0.10,
                  width: _width * 0.10,
                  color: myBool ?  Colors.blue : count > 2 ? Colors.black : Colors.orangeAccent ) 
                        ),
                        
              Container(
                  height: _height * 0.10,
                  width: _width * 0.10,
                  color: Colors.black),
              Row(
                children: [
                  Spacer(),
                  GestureDetector( 

                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_){
                    return SecondPage ();

                    }));


                    },
                    child: Container(
                        height: _height * 0.1,
                        width: _width * 0.1,
                        color: Colors.red),
                  ),
                      Spacer(),
                ],
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Undimos esto");

          print(count);
          setState(() {
            count = count + 1;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
