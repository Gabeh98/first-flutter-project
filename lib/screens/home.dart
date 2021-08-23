import 'package:flutter/material.dart';
import 'package:imc_project/constants/app_constants.dart';
import 'package:imc_project/widgets/left_bar.dart';
import 'package:imc_project/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  double _imcResult = 0;
  String _txtResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora IMC",
          style: TextStyle(color: accentHexcolor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _alturaController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexcolor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Altura',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _pesoController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexcolor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Peso',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _a = double.parse(_alturaController.text);
                double _p = double.parse(_pesoController.text);
                setState(() {
                  _imcResult = _p / (_a * _a);
                  if (_imcResult < 18.5) _txtResult = 'Magreza';
                  else if(_imcResult>=18.5&&_imcResult<=24.9) _txtResult = 'Normal';
                  else if(_imcResult>24.9&&_imcResult<=29.9) _txtResult = 'Sobrepeso';
                  else if(_imcResult>29.9&&_imcResult<=39.9) _txtResult = 'Obesidade';
                  else if(_imcResult>39.9) _txtResult = 'Obesidade Grave';
                });
              },
              child: Text(
                "Calcular",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexcolor),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _imcResult.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                    color: accentHexcolor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _txtResult.isNotEmpty,
              child: Container(
                child: Text(
                  _txtResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexcolor),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            RightBar(
              barWidth: 70,
            ),
            SizedBox(
              height: 40,
            ),
            RightBar(
              barWidth: 70,
            ),
          ],
        ),
      ),
    );
  }
}
