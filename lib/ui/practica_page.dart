import 'package:flutter/material.dart';
import 'package:flutter_firstapp_balcoder/ui/user/dashboard_widget.dart';
import 'package:flutter_firstapp_balcoder/ui/user/model/user_model.dart';
import 'package:flutter_firstapp_balcoder/ui/user/user_form_page.dart';

class PracticaPage extends StatefulWidget {
  @override
  _PracticaPageState createState() => _PracticaPageState();
}

class _PracticaPageState extends State<PracticaPage> {
  String myName = "ANGAGUDE";
  int count = 0;
  double decimalNumer = 4.5;
  bool myBool = false;

  //List: variable que se utiliza para ir almacenado lo que se encuentre dentro de una lista.
  List<UserModel> _userList = [];

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
                  onTap: () {
                    print("ONTAP");

                    setState(() {
                      myBool = !myBool;
                    });
                  },
                  child: Container(
                      height: _height * 0.10,
                      width: _width * 0.10,
                      color: myBool
                          ? Colors.blue
                          : count > 2
                              ? Colors.black
                              : Colors.orangeAccent)),

              Container(
                  height: _height * 0.10,
                  width: _width * 0.10,
                  color: Colors.black),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
                      //await: dar paso a entrar a la otra pagina, realizar alguna accion y devolverme.
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (_) {
                        return UserFormPage(
                            userList: _userList,
                            data: "pasando data",
                            color: Colors.indigo,
                            number: 123,
                            decimal: 123);
                      }));

                      setState(() {});
                    },
                    child: Container(
                        child: Center(
                            child: Text("Formulario",
                                style: TextStyle(color: Colors.white))),
                        height: _height * 0.1,
                        width: _width * 0.1,
                        color: Colors.red),
                  ),
                  Spacer(),
                ],
              ),
              // DashboardWidget(
              //   count: _userList.length,
              //   title: "Company",

              // )
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
