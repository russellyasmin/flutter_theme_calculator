import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CalculatorUi extends StatefulWidget {
  const CalculatorUi({super.key});

  @override
  State<CalculatorUi> createState() => _CalculatorUiState();
}

class _CalculatorUiState extends State<CalculatorUi> {
  List button = [
    'AC',
    'DEL',
    '(',
    ')',
    '7',
    '8',
    '9',
    '÷',
    '4',
    '5',
    '6',
    'x',
    '3',
    '2',
    '1',
    '-',
    '0',
    '.',
    '=',
    '+'
  ];
  bool enableDark = false;
  String answer = "0";
  String value = "";

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: enableDark
          ? Theme.of(context).colorScheme.background
          : Theme.of(context).primaryColor,
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ToggleSwitch(
                              iconSize: 22,
                              initialLabelIndex: 0,
                              activeFgColor: enableDark
                                  ? Color(0xff6b6f77)
                                  : Theme.of(context).colorScheme.secondary,
                              inactiveFgColor: enableDark
                                  ? Theme.of(context).colorScheme.secondary
                                  : Color(0xffdddddd),
                              activeBgColors: [
                                [
                                  enableDark ? Color(000000) : Color(0xfff4f1f2)
                                ],
                                [enableDark ? Color(0xfff4f1f2) : Color(000000)]
                              ],
                              inactiveBgColor: enableDark
                                  ? Color(000000)
                                  : Color(0xfff4f1f2),
                              minHeight: 30,
                              minWidth: 40,
                              totalSwitches: 2,
                              onToggle: (index) {
                                setState(() {
                                  if (index == 0) {
                                    enableDark = false;
                                  } else {
                                    enableDark = true;
                                  }
                                });
                              },
                              icons: [
                                CupertinoIcons.sun_max,
                                CupertinoIcons.moon
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          '$value',
                          style: TextStyle(
                              color: enableDark
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.background,
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '$answer',
                          style: TextStyle(
                              color: enableDark
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.background,
                              fontSize: 30),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                  ),
                  padding: EdgeInsets.only(left: 5, top: 10, right: 5),
                )
              ],
            ),
            width: w,
            height: h * 0.28,
            color: enableDark
                ? Theme.of(context).colorScheme.background
                : Theme.of(context).primaryColor,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: enableDark ? Color(000000) : Color(0xfff4f1f2)),
              padding: EdgeInsets.all(8),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 8,
                children: [
                  for (String icon in button)
                    GestureDetector(
                        onTap: () {
                          valueUpdate(icon);
                        },
                        child: Container(
                          width: w * 0.05,
                          height: h * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                color: (icon == 'AC' || icon == 'DEL')
                                    ? Colors.redAccent
                                    : (icon == '+' ||
                                            icon == '-' ||
                                            icon == 'x' ||
                                            icon == '÷' ||
                                            icon == '=')
                                        ? Colors.greenAccent
                                        : (icon == '(' || icon == ')')
                                            ? Colors.blueAccent
                                            : enableDark
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                width: 1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Text(
                            icon,
                            style: TextStyle(
                                fontSize: 22,
                                color: (icon == 'AC' || icon == 'DEL')
                                    ? Colors.redAccent.shade400
                                    : (icon == '+' ||
                                            icon == '-' ||
                                            icon == 'x' ||
                                            icon == '÷' ||
                                            icon == '=')
                                        ? Colors.greenAccent
                                        : (icon == '(' || icon == ')')
                                            ? Colors.blueAccent
                                            : enableDark
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .background),
                          )),
                        ))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  void valueUpdate(String s) {
    if (s == '0') value == value + '0';
    if (s == '1') value == value + '1 ';
    if (s == '2') value == value + '2';
    if (s == '3') value == value + '3';
    if (s == '4') value == value + '4';
    if (s == '5') value == value + '5';
    if (s == '6') value == value + '6';
    if (s == '7') value == value + '7';
    if (s == '8') value == value + '8';
    if (s == '9') value == value + '9';

    if (s == '+') value == value + '+';
    if (s == '-') value == value + '-';
    if (s == '÷') value == value + '÷';
    if (s == 'x') value == value + 'x';

    if (s == 'AC') {
      value == value + '';
      answer = '0';
    }

    if (s == 'DEL') {
      if (value == '')
        value = '';
      else
        value = value.substring(0, value.length - 1);
    }
    if (s == '(') value = value + '(';
    if (s == ')') value = value + ')';
    if (s == '.') value = value + '.';
    if (s == '=') {
      {
        answer = calculation(value);
        value = '';
      }
    }
    setState(() {});
  }

  String calculation(String v) {
    String modValue = v;
    Parser p = Parser();
    Expression e = p.parse(modValue);
    ContextModel cm = ContextModel();
    num evalue = e.evaluate(EvaluationType.REAL, cm);
    String a = evalue.toString();
    return a.length > 20 ? evalue.toStringAsPrecision(16) : a;
  }
}
