import 'package:flutter/material.dart';
import 'package:flutter_firstapp_balcoder/ui/user/model/user_model.dart';

class UserFormPage extends StatefulWidget {
  //this: para retroalimentar otra página
  //({this.data, this.color, this.number, this.decimal})= Constructor de Variables.
  UserFormPage({this.data, this.color, this.number, this.decimal, this.userList});

//String: Texto, Int: Números
  String data;
  Color color;
  int number;
  double decimal;
  List<UserModel> userList; 

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  //TextEditingController: controlador que estoy aplicando para saber que variables me van a consolidar la informacion.
  TextEditingController _cName = new TextEditingController();
  TextEditingController _cPhoneNumber = new TextEditingController();

  UserModel _userModel = new UserModel();


  int currentIndex;

  @override
  Widget build(BuildContext context) {
    //MediaQuery: propiedad size me defina el tamaño que estoy aplicando
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text("Formulario"),
        ),
        //Padding: dar espacios en todos los lados
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  //top: arriba - left: izquierda - right: derecha - bottom: abajo
                  top: 24.0,
                  left: 12.0,
                  right: 12.0,
                  bottom: 12.0),
              //TextFormField: caja de texto y necesita un CONTROLADOR para almacenar todo lo que se escribe.
              child: TextFormField(
                controller: _cName,
                //hintText: ayuda de texto para digitar
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.face,
                    ),
                    hintText: "Ingrese su nombre"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 12.0, right: 12.0, bottom: 12.0),
              //TextFormField: caja de texto y necesita un CONTROLADOR para almacenar todo lo que se escribe.
              child: TextFormField(
                controller: _cPhoneNumber,
                //hintText: ayuda de texto para digitar
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                    ),
                    hintText: "Ingrese su número"),
              ),
            ),

//GestureDetector: se utiliza el argumento onTap para identificar cuantas veces se unde.
            GestureDetector(
              onTap: () {
                print("Lo undimos");

                //if: me sirve para agregar las condiciones 

                
                ////text: es un argumento del controlador.
                print(_cName.text);
                print(_cPhoneNumber.text);

              
                _userModel.name = _cName.text;
                //parse: convertir un string a número
                _userModel.phoneNumber = int.parse(_cPhoneNumber.text);

//IF: condición - 
//currentIndex != null: diferente de null 
//nul: vacío 
                if(currentIndex != null){
              //LA ACTUALIZACION}
              setState(() {
                  widget.userList[currentIndex] = _userModel;
                });
                }

              else{
                // CREACIÓN 
                setState(() {
                  widget.userList.add(_userModel);
                });

              }

                _userModel = new UserModel();
                // "xxxx"; = vacío
                _cName.text = "";
                _cPhoneNumber.text = "";
                currentIndex = null;


              },
              child: Container(
                  height: _height * 0.05,
                  width: _width * 0.24,
                  //BoxDecoration: darle decoracion a la caja/botón que cree
                  //BorderRadius: Bordecito a la caja
                  decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(27)),
                  child: Center(
                      child: Text(
                        currentIndex != null ? "ACTUALIZAR" : "GUARDAR"
                    ,
                    style: TextStyle(color: Colors.white),
                  ))),
            ),
            Padding(
              //Padding: da espacios- top: separa arriba - all: separa todos los lados y a los dos se necesita
              // aplicarles el top en los parentesis. 
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: _height * 0.45,
                width: _width * 0.90,
                //ListView.builder: permite crear barras/listas desplegables.
                //itemCount: permite que el itemBuiler construya las veces que termine en el Count, número de repeticiones.
                //length: enumerar los objetos de la lista. 
                //index: darle una posición de cada ítem - aprender a separarlas
                child: ListView.builder(itemCount: widget.userList.length, itemBuilder: (BuildContext context, int index) { 
                  return ListTile(
                    //onTap: lo estoy agregando para cuando lo presione, me pueda llevarlo nuevamente al formulario que debe completar. 
                    onTap: (){
                    setState(() {
                    currentIndex = index; 
                    _cName.text = widget.userList[index].name;
                    _cPhoneNumber.text = widget.userList[index].phoneNumber.toString();




                    });



                    },
                    title: Text(widget.userList[index].name),
                    //toString: pasar numero a texto
                    subtitle: Text(widget.userList[index].phoneNumber.toString() ), 
                    leading:Icon(Icons.face_outlined),
                    trailing:GestureDetector( 
                      onTap: (){
                        //Voy a remover, eliminar la informacion que se encuentra dentro del icono delete.
                        setState(() {
                        widget.userList.removeAt(index);
                        });
                      


                      },
                      child: Icon(Icons.delete)),

                  );





                 },)

              ),
            )






          ],
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_firstapp_balcoder/ui/user/model/user_model.dart';

// class UserFormPage extends StatefulWidget {
//   UserFormPage({this.data});

//   String data;

//   @override
//   _UserFormPageState createState() => _UserFormPageState();
// }

// class _UserFormPageState extends State<UserFormPage> {
//   TextEditingController _cName = TextEditingController();
//   TextEditingController _cPhoneNumber = TextEditingController();

// //TIPO DE VARIABLE - NOMBRE DE LA VARIABLE -  INICIALIZAR
//   UserModel _userModel = new UserModel();
//   List<UserModel> widget.userList = [];

//   int currentIndex;

//   @override
//   Widget build(BuildContext context) {
//     double _height = MediaQuery.of(context).size.height;
//     double _width = MediaQuery.of(context).size.width;

//     print(widget.data);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: Center(
//             child: Text(
//           "Segunda hoja",
//           style: TextStyle(color: Colors.white),
//         )),
//       ),
//       body: Container(
//         color: Colors.red,
//         child: Column(
//           children: [
//             //TEXTFORMFIELD: CAJA DE TEXTO PARA METERLE INFORMACIÓN.
//             Padding(
//               padding: const EdgeInsets.only(
//                   top: 32.0, left: 12.0, right: 12.0, bottom: 12.0),
//               child: TextFormField(
//                 controller: _cName,
//                 decoration: InputDecoration(
//                     icon: Icon(Icons.person), hintText: "Ingrese su nombre"),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.only(
//                   top: 32.0, left: 12.0, right: 12.0, bottom: 12.0),
//               child: TextFormField(
//                 controller: _cPhoneNumber,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                     icon: Icon(Icons.phone), hintText: "Ingrese su teléfono"),
//               ),
//             ),
//             //Padding: hacer espacios, con el bombillo
//             Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: GestureDetector(
//                 onTap: () {

//                   print("ya lo undí");

//                   print(_cName.text);
//                   print(_cPhoneNumber.text);

//                   _userModel.name = _cName.text;
//                   _userModel.phoneNumber = int.parse(_cPhoneNumber.text);

//                   //Logica de para que cada vez que el de GUARDAR pueda borrar la información siguiente, RESETEO
//                   _cName.text = "";
//                   _cPhoneNumber.text = "";

//                   print(_userModel.name);
//                   print(_userModel.phoneNumber);

//                   setState(() {
//                     widget.userList.add(_userModel);
//                   });

//                   _userModel = new UserModel();
//                 },
//                 child: Container(
//                     height: _height * 0.05,
//                     width: _width * 0.24,
//                     //BORDERRADIUS: BORDECITO A LA COLUMNA.
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(40)),
//                     ),
//                     child: Center(
//                       child: Text( currentIndex != null ? "Actualizar" : "Guardar",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold)),
//                     )),
//               ),
//             ),
//             Container(
//                 width: _width * 0.8,
//                 height: _height * 0.4,
//                 color: Colors.yellow,

//                 //Listview: me permite seguir bajando para mirar las listas.
//                 //Length: número de total de base que he almacenado.
//                 child: ListView.builder(
//                     itemCount: widget.userList.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         onTap: (){
//                         setState(() {
//                         currentIndex = index;
//                           _cName.text = widget.userList[index].name;
//                           _cPhoneNumber.text = widget.userList[index].phoneNumber.toString();
//                         });

//                         },
//                         leading: Icon(Icons.person),
//                         //widget.userList:
//                         //Trailing:
//                         title: Text(widget.userList[index].name),
//                         subtitle: Text(widget.userList[index].phoneNumber.toString()),
//                         trailing: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 widget.userList.removeAt(index);
//                               });
//                             },
//                             child: Icon(Icons.delete)),
//                       );
//                     }))
//           ],
//         ),
//       ),
//     );
//   }
// }
