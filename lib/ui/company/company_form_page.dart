import 'package:flutter/material.dart';
import 'package:flutter_firstapp_balcoder/ui/company/model/company_model.dart';

class CompanyFormPage extends StatefulWidget {
  CompanyFormPage({this.companyList, this.currentIndex});

  List<CompanyModel> companyList;
  int currentIndex;

  @override
  _CompanyFormPageState createState() => _CompanyFormPageState();
}

class _CompanyFormPageState extends State<CompanyFormPage> {
  TextEditingController _cKey = new TextEditingController();
  TextEditingController _cEmployeeNumber = new TextEditingController();
  TextEditingController _cName = new TextEditingController();
  TextEditingController _cActivity = new TextEditingController();

  CompanyModel _companyModel = new CompanyModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.currentIndex != null){
    _cKey.text = widget.companyList [widget.currentIndex].key;
    _cEmployeeNumber.text = widget.companyList [widget.currentIndex].employeeCount.toString();
    _cName.text = widget.companyList [widget.currentIndex].companyName;
    _cActivity.text = widget.companyList [widget.currentIndex].activityName;


}}
  

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("FORMULARIO")),
        ),
        //Padding: dar espacios en todos los lados
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                //top: arriba - left: izquierda - right: derecha - bottom: abajo
                top: 24.0,
                left: 12.0,
                right: 12.0,
                bottom: 12.0),
            //TextFormField: caja de texto y necesita un CONTROLADOR para almacenar todo lo que se escribe.
            child: TextFormField(
              controller: _cKey,
              //hintText: ayuda de texto para digitar
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.account_balance,
                  ),
                  hintText: "Ingrese el 'KEY' de la compañía"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0, left: 12.0, right: 12.0, bottom: 12.0),
            //TextFormField: caja de texto y necesita un CONTROLADOR para almacenar todo lo que se escribe.
            child: TextFormField(
              controller: _cEmployeeNumber,
              //hintText: ayuda de texto para digitar
              decoration: InputDecoration(
                  icon: Icon(Icons.people_alt_sharp),
                  hintText: "Ingrese el número de empleados"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0, left: 12.0, right: 12.0, bottom: 12.0),
            //TextFormField: caja de texto y necesita un CONTROLADOR para almacenar todo lo que se escribe.
            child: TextFormField(
              controller: _cName,
              //hintText: ayuda de texto para digitar
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.store,
                  ),
                  hintText: "Ingrese el nombre de la compañía"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0, left: 12.0, right: 12.0, bottom: 12.0),
            //TextFormField: caja de texto y necesita un CONTROLADOR para almacenar todo lo que se escribe.
            child: TextFormField(
              controller: _cActivity,
              //hintText: ayuda de texto para digitar
              decoration: InputDecoration(
                  icon: Icon(Icons.subject),
                  hintText: "Ingrese el nombre de la actividad de la compañía"),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Lo undimos");

              print(_cKey.text);
              print(_cEmployeeNumber.text);
              print(_cName.text);
              print(_cActivity.text);

              _companyModel.key = _cKey.text;
              _companyModel.employeeCount = int.parse(_cEmployeeNumber.text);
              _companyModel.companyName = _cName.text;
              _companyModel.activityName = _cActivity.text;

//IF: condición -
//currentIndex != null: diferente de null
//nul: vacío
              if (widget.currentIndex != null) {
                //LA ACTUALIZACION}
                setState(() {
                  widget.companyList[widget.currentIndex] = _companyModel;
                });
              } else {
                // CREACIÓN
                setState(() {
                  widget.companyList.add(_companyModel);
                });
              }

              _companyModel = new CompanyModel();
              // "xxxx"; = vacío
              _cKey.text = "";
              _cEmployeeNumber.text = "";
              _cName.text = "";
              _cActivity.text = "";

              widget.currentIndex = null;

              Navigator.pop(context);
            },
            child: Container(
                height: _height * 0.05,
                width: _width * 0.24,
                //BoxDecoration: darle decoracion a la caja/botón que cree
                //BorderRadius: Bordecito a la caja
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(27)),
                child: Center(
                    child: Text(
                  widget.currentIndex != null ? "ACTUALIZAR" : "GUARDAR",
                  style: TextStyle(color: Colors.white),
                ))),
          ),
        ]));
  }
}