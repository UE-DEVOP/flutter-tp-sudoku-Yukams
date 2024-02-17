import 'dart:math';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SingleGrid extends StatefulWidget {
  const SingleGrid({Key? key, required this.x, required this.y}) : super(key: key);

  final int x;
  final int y;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<SingleGrid> createState() => SingleGridState();
}

class SingleGridState extends State<SingleGrid> {
  String value = "0";
  String expectedValue = "0";
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    getValueFromPuzzle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: InkWell(
          onTap: () {
            doOnTap();
          },
          child:Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.blueAccent.shade100.withAlpha(100)
                  : Colors.transparent,
            ),
            alignment: Alignment.center,
            child: value != "0" ? Text(value) : Text(expectedValue, style: const TextStyle(color: Colors.black12),),
          ),
        ),
      )
    );
  }

  void setStateFalse() {
    setState(() => isSelected = false);
  }

  void setValueForGrid(String v) {
    if(v == expectedValue) {
      setState(() => value = v);
    } else {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Mauvaise valeur !',
          message:
          'Vous avez saisi une mauvaise valeur !',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  void getValueFromPuzzle() {
    int v = puzzle.board()?.matrix()?[widget.x][widget.y].getValue()??0;
    int ev = puzzle.solvedBoard()?.matrix()?[widget.x][widget.y].getValue()??0;
    value = v.toString();
    expectedValue = ev.toString();
  }

  void doOnTap() {
    setState(() {
      if(value != expectedValue) isSelected = !isSelected;
      if(isSelected) {
        setSelectedGrid(this);
      } else {
        setSelectedGrid(null);
      }
    });
  }
}