import 'package:flutter/material.dart';
import 'package:flutter_webcommu/search_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('주소검색하기'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              onChanged: (text) => _controller.text,
              decoration:
                  new InputDecoration.collapsed(hintText: "Send a message"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _navigateAndDisplaySelection(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }


_navigateAndDisplaySelection(BuildContext context) async {
  // Navigator.push returns a Future that completes after calling
  // Navigator.pop on the Selection Screen.
  final result = await Navigator.push(
    context,
    // Create the SelectionScreen in the next step.
    MaterialPageRoute(builder: (context) => SearchPage()),
  );
  setState(() {
    return _controller.text = result;
  });
}
}
