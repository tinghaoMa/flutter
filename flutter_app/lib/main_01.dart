import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      margin: const EdgeInsets.symmetric(vertical: 50.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: _increment, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: new Container(
              decoration: new BoxDecoration(color: Colors.red),
              child: title,
            ),
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: _increment,
          ),
        ],
      ),
    );
  }
}

_increment() {
  Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1);
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            flex:1,
            child: new Container(
              decoration: new BoxDecoration(color: Colors.red),
              child: new Center(
                child: new Text("Hello, World!"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
  ));
}
