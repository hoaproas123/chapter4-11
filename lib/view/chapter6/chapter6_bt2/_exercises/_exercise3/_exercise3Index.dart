import 'package:flutter/material.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_appbarChild.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_exercise3/_algorithm.dart';
import 'package:flutter/services.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/loadresult_Dialog.dart';
class Exercise3 extends StatefulWidget {
  const Exercise3({super.key});

  @override
  State<Exercise3> createState() => _Exercise3State();
}

class _Exercise3State extends State<Exercise3> {
  String n='';
  int max2=0;
  String? _errorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: appbarChild(tittle: 'Số Lớn Nhì',),
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
                inputFormatters: [NumberInputFormatter()],
                onChanged: (N){
                  n=N;
                },
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(

                  errorText: _errorText,
                  errorStyle: const TextStyle(fontSize: 15),
                  hintText: 'Nhập dãy số, sử dụng dấu cách để ngăn',
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
                    if(n!='') {
                      loadresult_Dialog(context,"""Số Lớn Nhì: $max2
${max2.isEven ? "Số Chẵn":"Số Lẽ" }
Số Nguyên Tố: ${algorithm().isPrime(max2)}
$max2! =  ${algorithm().calFactorial(max2)}
Số Fibonanci thứ $max2 : ${algorithm().fibonanciN(max2)}
          """);
                    }
                  },
                  child: const Text(
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
        List listNum=n.split(' ').map((string) => int.parse(string)).toList(); //Chuyển mảng kí tự thành mảng số;
        max2 = algorithm().cau3(listNum);
      });
      return null;
    }
    else{
      setState(() {
        max2=0;
      });
      return 'Nhập dãy số dùng space để ngăn!';
    }
  }
}
class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Chỉ cho phép các ký tự là số hoặc dấu cách
    final RegExp regExp = RegExp(r'^[0-9\s]*$');
    if (regExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}




