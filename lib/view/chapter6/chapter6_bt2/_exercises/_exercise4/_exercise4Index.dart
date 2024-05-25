import 'package:flutter/material.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_appbarChild.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_exercise4/_algorithm.dart';
import 'package:flutter/services.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/loadresult_Dialog.dart';

class Exercise4 extends StatefulWidget {
  const Exercise4({super.key});

  @override
  State<Exercise4> createState() => _Exercise4State();
}

class _Exercise4State extends State<Exercise4> {
  String n='';
  int? dmin=0;
  String? _errorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: appbarChild(tittle: 'Độ lệch nhỏ nhất',),
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
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(

                  errorText: _errorText,
                  errorStyle: TextStyle(fontSize: 15),
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
                    if(n!='')
                      loadresult_Dialog(context,"Độ lệch nhỏ nhất: $dmin");
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
        List listNum=n.split(' ');
        dmin = algorithm().cau4(listNum);
      });
      return null;
    }
    else{
      setState(() {
        dmin=null;
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





