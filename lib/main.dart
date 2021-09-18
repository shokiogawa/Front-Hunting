import 'dart:math';

import 'package:demo_flutter_project/di.dart';
import 'package:demo_flutter_project/models/db/database.dart';
import 'package:demo_flutter_project/views/screens/home_screen.dart';
import 'package:demo_flutter_project/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// late MyDatabase database;

const items = [Stretch("金", 1), Stretch("銀", 3), Stretch("銅", 7)];

class Stretch {
  final String name;
  final int weight;

  const Stretch(this.name, this.weight);
}

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _homeViewModel = ref.read(homeViewModelProvider);
    final _future = useMemoized(() async => await _homeViewModel.gatIsPassT());
    return MaterialApp(
      title: 'JOB HUNTING',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return snapshot.data ? MainScreen() : HomeScreen();
          }),
      routes: {
        '/home_screen': (BuildContext context) => HomeScreen(),
        '/main_screen': (BuildContext context) => MainScreen()
      },
    );
  }
}
