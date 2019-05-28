import 'package:flutter/material.dart';

// 1. Basic list #BasicList
// 2. Horizontal list #HorizontalList
// 3. Grid list #GridList
// 4. Alternate list generators #AlernateList
// 5. Flexible appbar list #FlexibleAppbarList
void main() => runApp(FlexibleAppbarList());

class BasicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic List'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Photo'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            )
          ],
        ),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal list',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizontal List'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 160.0,
                  color: Colors.red,
                ),
                Container(
                  width: 160.0,
                  color: Colors.blue,
                ),
                Container(
                  width: 160.0,
                  color: Colors.green,
                ),
                Container(
                  width: 160.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: 160.0,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal list',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizontal List'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class AlternateList extends StatelessWidget {
  final List<ListItem> lists = List<ListItem>.generate(1000, (i) {
    return i % 6 == 0
        ? HeadingItem('Heading $i')
        : MessageItem('Sender $i', 'Message ');
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal list',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizontal List'),
        ),
        body: ListView.builder(
            itemCount: lists.length,
            itemBuilder: (context2, index) {
              final item = lists[index];
              if (item is HeadingItem) {
                return ListTile(
                  title: Text(
                    item.heading,
                    style: Theme.of(context2).textTheme.headline,
                  ),
                );
              } else if (item is MessageItem) {
                return ListTile(
                  title: Text(item.sender),
                  subtitle: Text(item.body),
                );
              }
            }),
      ),
    );
  }
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String body;
  final String sender;

  MessageItem(this.sender, this.body);
}

class FlexibleAppbarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible Appbar',
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Flexible List'),
              floating: true,
              flexibleSpace: Container(
                color: Colors.red,
              ),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context2, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 1000,
              ),
            )
          ],
        ),
      ),
    );
  }
}
