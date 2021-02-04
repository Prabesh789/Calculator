import 'package:calculator/btn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //For Disply text
  var userQuestion = '';
  var userAnswer = '';
  final List<String> buttons = <String>[
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '5',
    '4',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext conttext, int index) {
                  if (index == 0) {
                    return MyBtn(
                      btnTapped: () {
                        setState(() {
                          userQuestion = '';
                        });
                      },
                      btnText: buttons[index],
                      color: Colors.green,
                      textColor: Colors.white,
                    );

                    //Delete Button
                  } else if (index == 1) {
                    return MyBtn(
                      btnTapped: () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                      btnText: buttons[index],
                      color: Colors.red,
                      textColor: Colors.white,
                    );

                    //Rest Buttton
                  } else {
                    return MyBtn(
                      btnTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                          //we can write as:
                          //userQuestion = userQuestion + buttons[index];
                        });
                      },
                      btnText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple[50],
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == 'x' || x == '-' || x == '+' || x == '=' || x == '/') {
      return true;
    } else {
      return false;
    }
  }
}
