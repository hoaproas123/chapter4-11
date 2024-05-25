import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class DragAndDrop extends StatefulWidget {
  const DragAndDrop({super.key});

  @override
  State<DragAndDrop> createState() => _DragAndDropState();
}

class _DragAndDropState extends State<DragAndDrop> {
  String? _gestureDetected;
  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {//Bắt sự kiện tap vào màn hình và thực hiện hành động
        print('onTap');
        _displayGestureDetected('onTap');
      },

      onDoubleTap: () {//Bắt sự kiện tap 2 lần vào màn hình và thực hiện hành động
        print('onDoubleTap');

        _displayGestureDetected('onDoubleTap');
      },

      onLongPress: () {//Bắt sự kiện nhấn lâu và thực hiện hành động
        print('onLongPress');
        _displayGestureDetected('onLongPress');
      },

      // onLongPressMoveUpdate: (details) {//Bắt sự kiên nhấn lâu sau đó di chuyển và thực hiện hành động
      //   print('onLongPressMoveUpdate: $details');
      // },

      onLongPressUp: () {//Giống onLongPressEnd nhưng không cung cấp thông tin vị trí và vận tốc
        print('onLongPressUp ');
      },
      onLongPressEnd: (details) {//Bắt sự kiện kết thúc hành động nhấn lâu và thực hiện hành động
        print('onLongPressEnd: $details');
      },

      // onScaleStart: (details) {//Bắt sự kiện bắt đầu phóng to, thu nhỏ và thực hiện hành động
      //   print('onScaleStart: $details');
      // },
      //
      onSecondaryLongPress: () {//Bắt sự kiện nhấn lâu sử dụng cùng lúc 2 ngón tay và thực hiện hành động
        print('onSecondaryLongPress');
      },

      onSecondaryTap: () {//Bắt sự kiện tap sử dụng cùng lúc 2 ngón tay và thực hiện hành động
        print('onSecondaryTap');
      },

      onTertiaryLongPress: () {
        print('onTertiaryLongPress');
      },

      // onVerticalDragEnd: (DragEndDetails details) {//Bắt sự kiện kết thúc hành động vuốt dọc và thực hiện hành động
      //   print('onVerticalDragEnd: $details');
      //   if (details.primaryVelocity! < 0) {
      //     print('Dragging Bot to Top: ${details.velocity}');
      //   } else if (details.primaryVelocity! > 0) {
      //     print('Dragging Top to Bot: ${details.velocity}');
      //   }
      // },

      onDoubleTapCancel: () {//Bắt sự kiện hủy hành động double tap (đang sử dụng hành động này mà chuyển qua hành động khác) và thực hiện hành động
        print('onDoubleTapCancel');
      },
      onDoubleTapDown: (details) {//Bắt sự kiện chuẩn bị thực hiện thao tác và thực hiện hành động
        print('onDoubleTapDown: $details');
      },
      
      onPanUpdate: (DragUpdateDetails details) {//Bắt sự kiện vuốt dọc và ngang và thực hiện hành động
        print('onPanUpdate: $details');
        _displayGestureDetected('onPanUpdate:\n$details');
      },
      
      // onVerticalDragUpdate: ((DragUpdateDetails details) {//Bắt sự kiện vuốt dọc và thực hiện hành động
      //   print('onVerticalDragUpdate: $details');
      //   _displayGestureDetected('onVerticalDragUpdate:\n$details');
      // }),
      
      onForcePressStart: (details) {//Bắt sự kiện bắt đầu thực hiện thao tác nhấn mạnh và thực hiện hành động
        print('onForcePressStart: $details');
      },
      onHorizontalDragStart: (details) {//Bắt sự kiện bắt đầu kéo và thực hiện hành động
        print("onHorizontalDragStart: $details");
      },
      // onHorizontalDragUpdate: (DragUpdateDetails details) {//Bắt sự kiện vuốt ngang và thực hiện hành động
      //   print('onHorizontalDragUpdate: $details');
      //   _displayGestureDetected('onHorizontalDragUpdate:\n$details');
      // },
      onHorizontalDragEnd: (DragEndDetails details) {//Bắt sự kiện kết thúc hành động vuốt ngang và thực hiện hành động
        print('onHorizontalDragEnd: $details');
        if (details.primaryVelocity! < 0) {
          print('Dragging Right to Left: ${details.velocity}');
        } else if (details.primaryVelocity! > 0) {
          print('Dragging Left to Right: ${details.velocity}');
        }
      },
      behavior: HitTestBehavior.translucent,//???
      dragStartBehavior: DragStartBehavior.start,//??
      trackpadScrollCausesScale: true,
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.access_alarm,
              size: 98.0,
            ),
            Text('$_gestureDetected'),
          ],
        ),
      ),
    );
  }
}

