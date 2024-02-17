import 'package:flutter/material.dart';
import 'package:sudoku_starter/single_grid.dart';

class InternalGrid extends StatefulWidget {
  const InternalGrid({Key? key, required this.parentSize, required this.gridNumber}) : super(key: key);

  final double parentSize;
  final int gridNumber;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<InternalGrid> createState() => _InternalGrid();
}

class _InternalGrid extends State<InternalGrid> {
  @override
  Widget build(BuildContext context) {
    var boxSize = (widget.parentSize / 3).ceil().toDouble();

    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: boxSize * 3,
                width: boxSize * 3,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(9, (y) {
                    return Container(
                      width: boxSize,
                      height: boxSize,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.3)),
                      child: SingleGrid(x: (widget.gridNumber~/3)+(y~/3), y: (widget.gridNumber%3)+(y%3)),
                    );
                  }),
                )
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}