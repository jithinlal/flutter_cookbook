import 'package:flutter/material.dart';

// 1. a simple app drawer #DrawerShow
// 2. a snack bar demo #SnackBarShow
// 3. orientation demo #OrientationChange
// 4. Custom app theme
// 5. Tab creation #TabBarDemo
void main() => runApp(TabBarDemo());

class DrawerShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drawer'),
        ),
        body: Center(
          child: Text('Drawer Demo'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100.0,
                child: DrawerHeader(
                  child: Text('Header'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SnackBarShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Snack Bar Demo'),
        ),
        body: Center(
          child: Builder(
            // here context2 is used because snack bar must
            // be called with the context of the child
            // of scaffold, but not the context of the widget
            // that instantiated scaffold
            builder: (context2) => RaisedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text('yay! a snack bar'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {},
                      ),
                    );
                    Scaffold.of(context2).showSnackBar(snackBar);
                  },
                  child: Text('Show Snack Bar'),
                ),
          ),
        ),
      ),
    );
  }
}

class OrientationChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Orientation demo'),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            print(orientation);
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              children: List.generate(100, (index) {
                return Center(
                  child: Text('Item $index',
                      style: Theme.of(context).textTheme.headline),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

class CustomAppTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Theme',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            headline: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
            ),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          )),
      home: Builder(
        builder: (context3) => Scaffold(
              appBar: AppBar(
                title: Text('Custom Theme'),
              ),
              body: Center(
                child: Builder(
                  builder: (context1) => Container(
                        color: Theme.of(context3).accentColor,
                        child: Text(
                          'Text with a background color',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                ),
              ),
              floatingActionButton: Builder(
                builder: (context2) => Theme(
                      // this is not working cannot figure it out
                      data: Theme.of(context3)
                          .copyWith(accentColor: Colors.yellow),
                      child: FloatingActionButton(
                        onPressed: null,
                        child: Icon(Icons.add),
                      ),
                    ),
              ),
            ),
      ),
    );
  }
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab Bar Demo',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Car',
                ),
                Tab(
                  text: 'Train',
                ),
                Tab(
                  text: 'Bike',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
