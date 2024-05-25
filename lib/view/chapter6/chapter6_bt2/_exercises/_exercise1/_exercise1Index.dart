import 'dart:ui';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/loadresult_Dialog.dart';
import 'package:flutter/material.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_appbarChild.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_exercise1/_algorithm.dart';
import 'package:flutter/services.dart';
class Exercise1 extends StatefulWidget {
  const Exercise1({super.key});

  @override
  State<Exercise1> createState() => _Exercise1State();
}

class _Exercise1State extends State<Exercise1> {
  String n='';
  int? decryptN;
  String? _errorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: appbarChild(tittle: 'Giải Mã Chuỗi',),
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
                    Container(
                      width: 300,
                      color: Colors.white,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
                          LengthLimitingTextInputFormatter(200) // Giới hạn độ dài không quá 200 ký tự
                        ],
                        onChanged: (N){
                          n=N;
                        },
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(

                          errorText: _errorText,
                          errorStyle: TextStyle(fontSize: 20),
                          hintText: 'Nhập N',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
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
                            if(n!='')
                              loadresult_Dialog(context,decryptN.toString());
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
    if(n!='') {
      setState(() {
        decryptN = algorithm().cau1(n);
      });
      return null;
    }
    else{
      setState(() {
        decryptN=null;
      });
      return 'Nhập dãy số để mã hóa!';
    }
  }
}





