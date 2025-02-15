import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:widgets_modifiers/painting/painting_effect_widgets_modifiers.dart';
import 'package:widgets_modifiers/style/styling_widgets_modifiers.dart';
//We love 🌍😂👍😊🌏🤣

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();
  // var status = false;

  List<String> buttonsCharacters = [
    'c',
    '()',
    '%',
    '=',
    '1',
    '2',
    '3',
    '/',
    '4',
    '5',
    '6',
    '*',
    '7',
    '8',
    '9',
    '-',
    '+/-',
    '0',
    '.',
    '+'
  ];

  void button_action({required btn_char}) {
    switch (btn_char) {
      case "0":
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
      case "+":
      case "-":
      case "*":
      case "/":
      case "%":
        // (status)
        //     ? {
        //         myController.text = "",
        //         // status = false,
        //         myController.text = myController.text + btn_char
        //       }
        // : myController.text = myController.text + btn_char;
        myController.text = myController.text + btn_char;

      case "=":
        {
          final expression = myController.text;
          // myController.text = "$expression = ${expression.interpret()}";
          myController.text = expression.interpret().toString();
          // status = true;
        }
      case "c":
        {
          myController.text = "";
        }
      case "()":
        {
          (myController.text.contains('('))
              ? myController.text = myController.text + ")"
              : myController.text = myController.text + "(";
        }

      default:
    }
  }

  ElevatedButton buttonscreation({required String btn_char}) {
    return (btn_char == "=")
        ? ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange[300]),
            ),
            onPressed: () {
              button_action(btn_char: btn_char);
            },
            child: Text(
              btn_char,
              // style: TextStyle(),
            ),
          )
        : ElevatedButton(
            onPressed: () {
              button_action(btn_char: btn_char);
            },
            child: Text(btn_char),
          );
  }

  List<Widget> buttons = [];

  @override
  void initState() {
    //constructer
    buttons =
        buttonsCharacters.map((e) => buttonscreation(btn_char: e)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(13.0),
              height: 270.0,
              color: Colors.orange[100],
              //  const Spacer(),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: myController,
                    decoration: InputDecoration(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                  children: buttons.map((e) => e).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
