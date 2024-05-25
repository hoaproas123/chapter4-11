import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_chap5 extends StatefulWidget {
  const Home_chap5({super.key});

  @override
  State<Home_chap5> createState() => _HomeState();
}

class _HomeState extends State<Home_chap5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.black
        ),
        title: Text('Home'),
        backgroundColor: Colors.tealAccent,

      ),

      body: SafeArea(
        child: NewWidget(),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            buildRow(),
          ],
        ),
      ),
    );
  }

  Row buildRow() {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.yellow,
          height: 40.0,
          width: 40.0,
        ),
        Padding(padding: EdgeInsets.all(16.0),),
        Expanded(
          child: Container(
            color: Colors.amber,
            height: 40.0,
            width: 40.0,
          ),
        ),
        Padding(padding: EdgeInsets.all(16.0),),
        Container(
          color: Colors.brown,
          height: 40.0,
          width: 40.0,
        ),
        Padding(padding: EdgeInsets.all(16.0),),
        RowWidget(),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.yellow,
              height: 60.0,
              width: 60.0,
            ),
            Padding(padding: EdgeInsets.all(16.0),),
            Container(
              color: Colors.amber,
              height: 40.0,
              width: 40.0,
            ),
            Padding(padding: EdgeInsets.all(16.0),),
            Container(
              color: Colors.brown,
              height: 20.0,
              width: 20.0,
            ),
            Divider(),
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  radius: 100.0,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 60.0,
                        width: 60.0,
                        color: Colors.amber,
                      ),
                      Container(
                        height: 40.0,
                        width: 40.0,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Text('End of the Line'),
          ],
        ),
      ],
    );
  }
}
