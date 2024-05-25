import 'package:flutter/material.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_appbarChild.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_exercise7/_algorithm.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/loadresult_Dialog.dart';
import 'package:flutter/services.dart';
class Exercise7 extends StatefulWidget {
  const Exercise7({super.key});

  @override
  State<Exercise7> createState() => _Exercise7State();
}

class _Exercise7State extends State<Exercise7> {
  String n='';
  List? rs;
  String? _errorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: appbarChild(tittle: 'Cắt Giảm Số',),
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
                    String strRS='Số lượng số chia hết cho 3 tìm được: \n';
                    for(int i in rs!)
                      {
                        strRS+='$i \n';
                      }
                    strRS+='Số lượng: ${rs!.length}';
                    if(n!='')
                      loadresult_Dialog(context,strRS);
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
        List numsplit=n.split(''); //Chuyển thành dạng chuỗi rồi tách thành mảng kí tự
        rs = algorithm().cau7(numsplit);
      });
      return null;
    }
    else{
      setState(() {
        rs=null;
      });
      return 'Nhập dãy số để mã hóa!';
    }
  }
}





