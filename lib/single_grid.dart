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
  String value = "0";
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    value = getValueFromPuzzle();
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
            child: Text(value),
          ),
        ),
      )
    );
  }

  String getValueFromPuzzle() {
    int v = puzzle.board()?.matrix()?[widget.x][widget.y].getValue()??0;
    return v == 0 ? "" : v.toString();
  }

  void doOnTap() {
    setState(() {
      isSelected = isSelected == false; // if not already selected
      if(isSelected) {
        setSelectedGridCallback(
              () => setState(() => isSelected = false),
              (String v) => setState(() => value = v)
        );
      } else {
        setSelectedGridCallback(null, null);
      }
    });
  }
}