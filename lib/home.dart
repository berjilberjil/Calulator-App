import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String ClickedItem = "";
  String inputValue = "";
  String CalculatedValue = "";
  String Operator = "";
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width / 5;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: calButton("Clear", Colors.black, size),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              inputValue,
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calButton("9", Colors.grey, size),
              calButton("8", Colors.grey, size),
              calButton("7", Colors.grey, size),
              calButton("/", Colors.orange, size),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calButton("4", Colors.grey, size),
              calButton("5", Colors.grey, size),
              calButton("6", Colors.grey, size),
              calButton("*", Colors.orange, size),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calButton("1", Colors.grey, size),
              calButton("2", Colors.grey, size),
              calButton("3", Colors.grey, size),
              calButton("-", Colors.orange, size),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calButton("0", Colors.grey, size),
              calButton(".", Colors.grey, size),
              calButton("=", Colors.orange, size),
              calButton("+", Colors.orange, size),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget calButton(String text, Color bgColor, double size) {
    return Container(
      height: size,
      width: size,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          if (text == "Clear") {
            setState(() {
              inputValue = "";
              CalculatedValue = "";
              Operator = "";
            });
          } else if (text == "/" ||
              text == "*" ||
              text == "-" ||
              text == "+" ||
              text == "/") {
            CalculatedValue = inputValue;
            inputValue = "";
            Operator = text;
          } else if (text == "=") {
            setState(() {
              double first = double.parse(CalculatedValue);
              double second = double.parse(inputValue);

              switch (Operator) {
                case "+":
                  inputValue = (first + second).toString();
                  break;
                case "-":
                  inputValue = (first - second).toString();
                  break;
                case "*":
                  inputValue = (first * second).toString();
                  break;
                case "/":
                  inputValue = (first / second).toString();
                  break;
              }
            });
          } else {
            setState(() {
              inputValue += text;
            });
          }
        },

        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
