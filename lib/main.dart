import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Async Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _counter;
  int? _oneMoreCounter;
  int? _progress;

  @override
  void initState() {
    super.initState();

    _counter = 0;
    _oneMoreCounter = 0;
    _progress = 0;
  }

  void _incrementCounter() {
    setState(() {
      _counter = _counter! + 1;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter = _counter! - 1;
    });
  }

  Future<void> _startLoading() async {
    _progress = 0;
    while (_progress! < 100) {
      await Future.delayed(Duration(seconds: 3));
      _progress = _progress! + 5;
      setState(() {
        _progress;
      });
    }
  }

  Future<void> _startTimerAsync() async {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      _oneMoreCounter = _oneMoreCounter! + 1;
      setState(() {
        _oneMoreCounter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Demo'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_oneMoreCounter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: _startTimerAsync,
                child: const Text('Start Timer'),
              ),
            ],
          ),
          const SizedBox(
            width: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_progress%',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: _startLoading,
                child: const Text('Start Loading'),
              ),
            ],
          ),
          const SizedBox(
            width: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _decrementCounter,
                child: const Text('Increment'),
              ),
              const SizedBox(width: 16.0),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('Increment'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
