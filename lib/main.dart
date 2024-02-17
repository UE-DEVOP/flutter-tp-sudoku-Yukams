import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_starter/game.dart';
import 'package:sudoku_api/sudoku_api.dart';
import 'package:sudoku_starter/single_grid.dart';
import 'package:sudoku_starter/start_game.dart';

import 'end_game.dart';

Puzzle puzzle = Puzzle(PuzzleOptions());
SingleGridState? selectedGrid;

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const StartGame(title: 'Démarrer une partie'),
    ),
    GoRoute(
      path: '/game',
      builder: (context, state) => const Game(title: 'Sudoku game'),
    ),
    GoRoute(
      path: '/end',
      builder:  (context, state) => const EndGame(title: 'Fin de partie')
    )
  ],
);

void setSelectedGrid(SingleGridState? grid) {
  if(selectedGrid != null) {
    selectedGrid!.setStateFalse();
    selectedGrid = null;
  }

  if(grid != null) {
    selectedGrid = grid;
  }
}

void main() {
  puzzle.generate().then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );

    return MaterialApp(
      title: 'Sudoku Game',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Game(title: 'Sudoku game'),
    );
  }
}
