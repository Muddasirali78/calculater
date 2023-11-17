import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '';
        num1 = 0.0;
        num2 = 0.0;
        operand = '';
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        num1 = double.parse(_output);
        operand = buttonText;
        _output = '';
      } else if (buttonText == '=') {
        num2 = double.parse(_output);
        switch (operand) {
          case '+':
            _output = (num1 + num2).toString();
            break;
          case '-':
            _output = (num1 - num2).toString();
            break;
          case '*':
            _output = (num1 * num2).toString();
            break;
          case '/':
            if (num2 != 0) {
              _output = (num1 / num2).toString();
            } else {
              _output = 'Error';
            }
            break;
        }
        num1 = 0.0;
        num2 = 0.0;
        operand = '';
      } else {
        _output += buttonText;
      }
    });
  }

  Widget _buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton('7', 1, Colors.grey),
              _buildButton('8', 1, Colors.grey),
              _buildButton('9', 1, Colors.grey),
              _buildButton('/', 1, Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton('4', 1, Colors.grey),
              _buildButton('5', 1, Colors.grey),
              _buildButton('6', 1, Colors.grey),
              _buildButton('*', 1, Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton('1', 1, Colors.grey),
              _buildButton('2', 1, Colors.grey),
              _buildButton('3', 1, Colors.grey),
              _buildButton('-', 1, Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton('C', 1, Colors.red),
              _buildButton('0', 1, Colors.grey),
              _buildButton('=', 1, Colors.blue),
              _buildButton('+', 1, Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}
