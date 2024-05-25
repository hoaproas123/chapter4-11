import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_appbarChild.dart';
import 'package:flutter/services.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/loadresult_Dialog.dart';
import 'package:sumary/view/chapter6/chapter6_bt2/_exercises/_exercise8/_algorithm.dart';
import 'package:flutter/widgets.dart';
class Exercise8 extends StatefulWidget {
  const Exercise8({super.key});
  @override
  State<Exercise8> createState() => _Exercise8State();
}

class _Exercise8State extends State<Exercise8> {
  final _formKey = GlobalKey<FormState>();
  int n=0;
  List elecnum=[];
  List<int> price=[];
  @override
  Widget build(BuildContext context) {
    n=0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: appbarChild(tittle: 'Tính tiền điện',),
    ),
      body: fill_container(context),
    );
  }
  Container fill_container(BuildContext context) {
    Orientation _orientation=MediaQuery.of(context).orientation;
    return Container(
      height: MediaQuery.of(context).size.height-79,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height-79,
            width:  MediaQuery.of(context).size.width*(3/4),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height-79,
                        color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildColumnElecnum('Số điện tiêu dùng'),
                            _buildColumnElecnum('Số điện sản xuất'),
                            _buildColumnElecnum('Số điện kinh doanh'),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height-79,
                        color: Colors.lightGreenAccent,
                        child: _orientation==Orientation.portrait ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildColumnPrice('Giá tiền A1'),
                                _buildColumnPrice('Giá tiền B1'),
                              ],
                            ),
                            _buildColumnPrice('Giá tiền C1'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildColumnPrice('Giá tiền A2'),
                                _buildColumnPrice('Giá tiền B2'),
                              ],
                            ),
                            _buildColumnPrice('Giá tiền C2'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildColumnPrice('Giá tiền A3'),
                                _buildColumnPrice('Giá tiền B3'),
                              ],
                            ),
                            _buildColumnPrice('Giá tiền C3'),
                          ],
                        )
                            : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildColumnPrice('Giá tiền A1'),
                                _buildColumnPrice('Giá tiền B1'),
                                _buildColumnPrice('Giá tiền C1'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildColumnPrice('Giá tiền A2'),
                                _buildColumnPrice('Giá tiền B2'),
                                _buildColumnPrice('Giá tiền C2'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildColumnPrice('Giá tiền A3'),
                                _buildColumnPrice('Giá tiền B3'),
                                _buildColumnPrice('Giá tiền C3'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height-79,
            width:  MediaQuery.of(context).size.width*(1/4),
            color: Colors.red,
            padding: const EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            child: TextButton(
              onPressed: ()
              {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  n=checkValidate();
                  print(elecnum);
                }
                loadresult_Dialog(context,'Tổng tiền điện cần trả: $n');
                elecnum.clear();
                price.clear();
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

  Column _buildColumnPrice(String title) {
    Orientation _orientation=MediaQuery.of(context).orientation;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
          child: Text(title,style: TextStyle(fontSize: 15),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
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
                  price.add(int.parse(value!));
                }
                else price.add(0);
              },
              style: TextStyle(
                fontSize: _orientation==Orientation.portrait ? 15 : 10,

              ),
              decoration: InputDecoration(
                errorStyle: TextStyle(fontSize: 20),
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _buildColumnElecnum(String title) {
    Orientation _orientation=MediaQuery.of(context).orientation;
    return _orientation==Orientation.portrait ? Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(title,style: TextStyle(fontSize: 25),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    if(value!='')
                    {
                      elecnum.add(int.parse(value!));
                    }
                    else elecnum.add(0);
                  },
                  style: TextStyle(
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 20),
                    hintText: 'Đầu tháng',
                    hintStyle: TextStyle(fontSize: 15),
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
                      elecnum.add(int.parse(value!));
                    }
                    else elecnum.add(0);
                  },
                  style: TextStyle(
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 20),
                    hintText: 'Cuối tháng',
                    hintStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    )
        : Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(title,style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 120,
                color: Colors.white,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
                  ],
                  onSaved: (value){
                    if(value!='')
                    {
                      elecnum.add(int.parse(value!));
                    }
                    else elecnum.add(0);
                    print(value);
                  },
                  style: TextStyle(
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 20),
                    hintText: 'Đầu tháng',
                    hintStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 120,
                color: Colors.white,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
                  ],
                  onSaved: (value){
                    if(value!='')
                    {
                      elecnum.add(int.parse(value!));
                    }
                    else elecnum.add(0);
                    print(value);
                  },
                  style: TextStyle(
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 20),
                    hintText: 'Cuối tháng',
                    hintStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
  int checkValidate() {
    setState(() {
      n = algorithm().cau8(elecnum,price);
    });
    return n;
  }
}





