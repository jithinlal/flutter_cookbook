import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 1. Simple gesture detector button
// 2. Dismissable example
void main() => runApp(CustomDismissList());

class MyCustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ripple Effect Button',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Ripple'),
        ),
        body: Builder(
          builder: (context2) => Center(
                child: GestureDetector(
                  onTap: () {
                    final snackBar = SnackBar(
                      content: Text('Hai'),
                    );
                    Scaffold.of(context2).showSnackBar(snackBar);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context2).buttonColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text('Cick Me!'),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}

class CustomDismissList extends StatefulWidget {
  @override
  _CustomDismissListState createState() => _CustomDismissListState();
}

class _CustomDismissListState extends State<CustomDismissList> {
  final items = List<String>.generate(30, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dismissable List Tiles',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dismissable List'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$item dimissed'),
                  ),
                );
              },
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
              ),
              child: ListTile(
                title: Text('${items[index]}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
