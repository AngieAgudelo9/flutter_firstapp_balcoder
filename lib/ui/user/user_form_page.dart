import 'package:flutter/material.dart';
import 'package:flutter_firstapp_balcoder/ui/user/model/user_model.dart';

class UserFormPage extends StatefulWidget {
  UserFormPage({this.data});

  String data;

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  TextEditingController _cName = TextEditingController();
  TextEditingController _cPhoneNumber = TextEditingController();

//TIPO DE VARIABLE - NOMBRE DE LA VARIABLE -  INICIALIZAR
  UserModel _userModel = new UserModel();
  List<UserModel> _userList = [];

  int currentIndex;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    print(widget.data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Text(
          "Segunda hoja",
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          children: [
            //TEXTFORMFIELD: CAJA DE TEXTO PARA METERLE INFORMACIÓN.
            Padding(
              padding: const EdgeInsets.only(
                  top: 32.0, left: 12.0, right: 12.0, bottom: 12.0),
              child: TextFormField(
                controller: _cName,
                decoration: InputDecoration(
                    icon: Icon(Icons.person), hintText: "Ingrese su nombre"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 32.0, left: 12.0, right: 12.0, bottom: 12.0),
              child: TextFormField(
                controller: _cPhoneNumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    icon: Icon(Icons.phone), hintText: "Ingrese su teléfono"),
              ),
            ),
            //Padding: hacer espacios, con el bombillo
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: GestureDetector(
                onTap: () {

                  print("ya lo undí");

                  print(_cName.text);
                  print(_cPhoneNumber.text);

                  _userModel.name = _cName.text;
                  _userModel.phoneNumber = int.parse(_cPhoneNumber.text);

                  //Logica de para que cada vez que el de GUARDAR pueda borrar la información siguiente, RESETEO
                  _cName.text = "";
                  _cPhoneNumber.text = "";

                  print(_userModel.name);
                  print(_userModel.phoneNumber);

                  setState(() {
                    _userList.add(_userModel);
                  });

                  _userModel = new UserModel();
                },
                child: Container(
                    height: _height * 0.05,
                    width: _width * 0.24,
                    //BORDERRADIUS: BORDECITO A LA COLUMNA.
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Center(
                      child: Text( currentIndex != null ? "Actualizar" : "Guardar",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
            ),
            Container(
                width: _width * 0.8,
                height: _height * 0.4,
                color: Colors.yellow,

                //Listview: me permite seguir bajando para mirar las listas.
                //Length: número de total de base que he almacenado.
                child: ListView.builder(
                    itemCount: _userList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: (){
                        setState(() {
                        currentIndex = index;
                          _cName.text = _userList[index].name;
                          _cPhoneNumber.text = _userList[index].phoneNumber.toString();
                        });


                        },
                        leading: Icon(Icons.person),
                        //_userList:
                        //Trailing: 
                        title: Text(_userList[index].name),
                        subtitle: Text(_userList[index].phoneNumber.toString()),
                        trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                _userList.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete)),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
