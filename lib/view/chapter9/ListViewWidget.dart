
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sumary/view/chapter9/RowWithCardWidget.dart';
import 'package:sumary/view/chapter9/cardWidget.dart';
class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 20,// Số lượng item sinh ra tối đa
        itemBuilder: (BuildContext context, int index) {//Build item và gán biến đếm mỗi lần chạy
          print(index);
          print(MediaQuery.of(context).size.height);
          if (index == 0) {
            return cardWidget(index: index);
          } else if (index >= 1 && index <= 12) {
            return RowWithCardWidget(index: index);
          } else {
            return RowWithCardWidget(index: index);
          }
        },
      // addAutomaticKeepAlives: false,//???
      //   dragStartBehavior: DragStartBehavior.down,//???
      //   addRepaintBoundaries: true,
        cacheExtent: 700, //Số lượng item sinh ra khi scroll trong 1 đơn vị kích thước: 700
        controller: ScrollController(
          debugLabel: 'hi',
          // initialScrollOffset: 350,//Vị trí màn hình khi chạy app được scroll xuống 350pixel
          // keepScrollOffset: false,//???
          // onAttach: (position){//???
          //   print('up');
          // },
          // onDetach: (position) {//???
          //   print('down');
          // },

        ),


      ),
    );
  }
}