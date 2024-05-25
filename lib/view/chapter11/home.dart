import 'package:flutter/material.dart';
import 'package:sumary/view/chapter11/dismissible.dart';
import 'package:sumary/view/chapter11/dragAble.dart';
import 'package:sumary/view/chapter11/dragAnddrop.dart';
import 'package:sumary/view/chapter11/dragEnd.dart';
import 'package:sumary/view/chapter11/move_scale.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: Colors.yellow,
        ),
      ),

      home: const MyHomePage11(),
    );
  }
}

class MyHomePage11 extends StatefulWidget {
  const MyHomePage11({super.key});
  @override
  State<MyHomePage11> createState() => _MyHomePageState();
}
  int currentIndex=0;
  Widget currentPage=DragEnd();
class _MyHomePageState extends State<MyHomePage11> {
  void changePage(int index)
  {
    setState(() {
      currentIndex=index;
      if(index==0)
        currentPage= DragEnd();
      if(index==1)
        currentPage= DragAndDrop();
      if(index==2)
        currentPage= DragAble();
      if(index==3)
        currentPage= move_scale();
      if(index==4)
        currentPage= dismissible();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Gesture Detector',
        ),
      ),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.hail_outlined),
            label: 'DragEnd',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.u_turn_left_sharp),
            label: 'DragAndDrop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_outlined),
            label: 'DragAble',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt_sharp),
            label: 'MS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart_sharp),
            label: 'Dismissible',
          ),
        ],
        onTap: (index){changePage(index);},
      ),
    );
  }
}

