import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
      create: (context) => CounterProvider(0),
      child: CounterScreen(),
    ),
  ));
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text(
            "Provider Counter",
            style: TextStyle(
              color: Color.fromARGB(255, 220, 236, 243),
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  style: Theme.of(context).textTheme.headline2,
                  'Counts',
                ),
                Text(
                  counterProvider._counter.toString(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(42, 0, 0, 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    counterProvider.incrementCounter();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    counterProvider.resetCounter();
                  },
                  tooltip: 'Reset',
                  child: Icon(Icons.redo),
                ),
                FloatingActionButton(
                  onPressed: () {
                    counterProvider.decrementCounter();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ));
  }
}

class CounterProvider extends ChangeNotifier {
  int _counter;
  CounterProvider(this._counter);

  int getCounter() => _counter;
  serCounter(int counter) => this._counter = counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    if (_counter > 0) _counter--;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }
}
