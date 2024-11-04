
A Stateless widget is immutable, meaning once created,it cannot change or update its appearance based on data changes. 
It is used for components that depend only on external data and do not need to maintain any internal state. 
Examples include simple UI elements like text labels, icons, or layouts that won’t change during the app’s lifecycle.

When to use a Stateless widget: Use it when you have a widget that doesn’t change over time, such as displaying static text, images, or icons. Stateless widgets are ideal for UI elements that don’t interact directly with the user (other than maybe reacting to taps without changing their visual state).
Stateful Widget
A Stateful widget can hold internal state information and can change its appearance in response to events, such as user interaction or API updates. Stateful widgets use a State object to manage changes, allowing the UI to rebuild when the internal state changes.

When to use a Stateful widget: Use it when you need to update the UI in response to data or events, 
such as form inputs, animations, counters, or items that change dynamically due to user input. 
For example, a toggle switch, a form with text input, or a shopping cart icon that shows the number of items would all be ideal candidates for stateful widgets.

```code
    import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: Counter());
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(child: Text('Count: $_count')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        child: Icon(Icons.add),
      ),
    );
  }
}
```