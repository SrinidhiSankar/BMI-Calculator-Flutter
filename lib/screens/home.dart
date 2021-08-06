//import 'package:bmicalculator/constants/app_constants.dart';
//import 'package:bmicalculator/widgets/left_bar.dart';
//import 'package:bmicalculator/widgets/right_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style:
                TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          //backgroundColor: Colors.transparent,
          elevation: 4,
          centerTitle: true,
        ),
        backgroundColor: Colors.indigo.shade300,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 200,
                    child:
                    TextField(
                      controller: _heightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Height",
                        hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _weightController,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Weight",
                        hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if(_bmiResult > 25){
                      _textResult = "You\'re over weight!!!";
                    } else if(_bmiResult >= 18.5 && _bmiResult <= 25){
                      _textResult = "You have normal weight!!!";
                    }else{
                      _textResult = "You\'re under weight!!!";
                    }
                  });
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.deepOrange.shade200
                  ),
                  
                  child: Text(
                    "Calculate",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: Colors.pink),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                  child: 
                  Container(
                    height: 45,
                    width: 400,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.deepOrange.shade200
                  ),
                child: Text(
                  _textResult,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Colors.purple),
                ),
              )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}