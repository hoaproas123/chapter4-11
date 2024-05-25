import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_appbarChild.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_exercise5/_algorithm.dart';
import 'package:flutter/services.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/loadresult_Dialog.dart';
class Exercise5 extends StatefulWidget {
  const Exercise5({super.key});

  @override
  State<Exercise5> createState() => _Exercise5State();
}

class _Exercise5State extends State<Exercise5> {
  final _formKey = GlobalKey<FormState>();
  int? n=null;
  int _counter=9;
  int i=0;
  List<List> rooms=[];
  final List<Widget> _rows = [];
  String? _errorText;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: appbarChild(tittle: 'Xếp Phòng Thi',),
    ),
      body: fill_container(context),
    );
  }
  Container fill_container(BuildContext context) {
    while(i<_counter)
    {
      _rows.add(_buildColumnfill());
      i++;
    }
    return Container(
      height: MediaQuery.of(context).size.height-79,
      color: Colors.blue,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height-79,
            width:  MediaQuery.of(context).size.width*(2/3),
            child: Form(
              key: _formKey,
              child: GestureDetector(
                onVerticalDragDown: (details) {
                  setState(() {
                    _counter += 9; // Tăng biến _counter khi vuốt xuống
                  });
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: _rows,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height-79,
            width:  MediaQuery.of(context).size.width*(1/3),
            color: Colors.red,
            padding: const EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            child: TextButton(
              onPressed: ()
              {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  n=checkValidate();
                }
                loadresult_Dialog(context,'Số phòng thi ít nhất cần: $n');
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                width: 100,
                height: 50,
                child: Text(
                  'Solve',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildColumnfill() {
    List room=[];
    rooms=[];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100,
            color: Colors.white,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
              ],
              onSaved: (value){
                room=[];
                if(value!='')
                {
                  room.add(int.parse(value!));
                }
              },
              style: TextStyle(
                fontSize: 20,

              ),
              decoration: InputDecoration(
                errorStyle: TextStyle(fontSize: 20),
                hintText: 'Start',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100,
            color: Colors.white,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
              ],
              onSaved: (value){
                if(value!='')
                {
                  room.add(int.parse(value!));
                  rooms.add(room!);
                }
              },
              style: TextStyle(
                fontSize: 20,

              ),
              decoration: InputDecoration(
                errorStyle: TextStyle(fontSize: 20),
                hintText: 'End',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  int? checkValidate() {
      setState(() {
        n = algorithm().cau5(rooms);
      });
      return n;
    }
  }






