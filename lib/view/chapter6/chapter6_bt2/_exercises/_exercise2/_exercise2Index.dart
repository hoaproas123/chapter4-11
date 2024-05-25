import 'package:flutter/material.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_appbarChild.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_exercise2/_algorithm.dart';
import 'package:flutter/services.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/loadresult_Dialog.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _Exercise2State();
}

class _Exercise2State extends State<Exercise2> {
  String a='',b='';
  Map rs={};
  String? _errorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: appbarChild(tittle: 'Chia 3 ',),
    ),
      body: fill_container(context),
    );
  }
  Container fill_container(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-79,
      color: Colors.blue,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('[',style: TextStyle(fontSize: 100)),
                Container(
                  width: 160,
                  color: Colors.white,
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
                    ],
                    onChanged: (N){
                      a=N;
                    },
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      errorText: _errorText,
                      errorStyle: TextStyle(fontSize: 20),
                      hintText: 'Nhập a',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Text(' : ',style: TextStyle(fontSize: 30)),
                Container(
                  width: 160,
                  color: Colors.white,
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
                    ],
                    onChanged: (N){
                      b=N;
                    },
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(

                      errorText: _errorText,
                      errorStyle: TextStyle(fontSize: 20),
                      hintText: 'Nhập b',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Text(']',style: TextStyle(fontSize: 100)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                width: 100,
                color: Colors.white,
                child: TextButton(
                  onPressed: ()
                  {
                    _errorText=checkValidate();
                    if(a!=''&&b!='')
                      loadresult_Dialog(context,"Count= ${rs['count']}\nSum= ${rs['sum']}");
                  },

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
      ),
    );
  }

  String? checkValidate() {
    if(a!=''||b!='') {
      setState(() {
        rs = algorithm().cau2(int.parse(a),int.parse(b));
      });
      return null;
    }
    else{
      setState(() {
        rs={};
      });
      return 'Nhập a và b!';
    }
  }
}






