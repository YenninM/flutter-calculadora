import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _output = "0"; // Almacena el resultado o número actual
  String _currentInput = ""; // Almacena la entrada actual
  double _num1 = 0; // Primer número
  double _num2 = 0; // Segundo número
  String _operacion = ""; // Operación actual

  // Función para manejar la entrada de números
  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        // Limpiar todo
        _output = "0";
        _currentInput = "";
        _num1 = 0;
        _num2 = 0;
        _operacion = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "x" ||
          buttonText == "/") {
        // Guardar el primer número y la operación
        _num1 = double.parse(_currentInput);
        _operacion = buttonText;
        _currentInput = "";
      } else if (buttonText == "=") {
        // Calcular el resultado
        _num2 = double.parse(_currentInput);
        switch (_operacion) {
          case "+":
            _output = (_num1 + _num2).toString();
            break;
          case "-":
            _output = (_num1 - _num2).toString();
            break;
          case "x":
            _output = (_num1 * _num2).toString();
            break;
          case "/":
            _output = (_num1 / _num2).toString();
            break;
        }
        _currentInput = _output;
      } else {
        // Agregar el número al input actual
        _currentInput += buttonText;
        _output = _currentInput;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        children: [
          // Área de visualización del resultado
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Teclado de la calculadora
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                _buildButton("7"),
                _buildButton("8"),
                _buildButton("9"),
                _buildButton("/"),
                _buildButton("4"),
                _buildButton("5"),
                _buildButton("6"),
                _buildButton("x"),
                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
                _buildButton("-"),
                _buildButton("C"),
                _buildButton("0"),
                _buildButton("="),
                _buildButton("+"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Función para crear botones
  Widget _buildButton(String buttonText) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
