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
  State<SingleGrid> createState() => _SingleGrid();
}

class _SingleGrid extends State<SingleGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text(getValueFromPuzzle())
      )
    );
  }

  String getValueFromPuzzle() {
    int v = puzzle.board()?.matrix()?[widget.x][widget.y].getValue()??0;
    return v == 0 ? "" : v.toString();
  }
}