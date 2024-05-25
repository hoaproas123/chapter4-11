import 'package:flutter/material.dart';
class DragAble extends StatefulWidget {
  const DragAble({super.key});

  @override
  State<DragAble> createState() => _DragAbleState();
}

class _DragAbleState extends State<DragAble> {
  @override
  Widget build(BuildContext context) {
    Color? _paintedColor;
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: 1200,
          color: Colors.pink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Draggable(
                onDragStarted: () {//Bắt sự kiện bắt đầu kéo và thực hiện hành động
                  print('onDragStarted');
                },
                onDragUpdate: (details) {//Bắt sự kiện thay đổi vị trí khi drag và thực hiện hành động
                  // print('onDragUpdate: ${details.globalPosition}');
                },
                onDragEnd: (details) {//Bắt sự kiện khi kết thúc hành động kéo và thực hiện hành động
                  print('onDragEnd: ${details.velocity}');
                },
                onDragCompleted: () {//Bắt sự kiện khi kết thúc thao tác kéo và dữ liệu được truyền đi và thực hiện hành đọng
                  print('onDragCompleted');
                },
                onDraggableCanceled: (velocity, offset) {//Bắt sự kiện khi hủy thao tác kéo và thực hiện hành động
                  print('onDraggableCanceled');
                },
                affinity: Axis.vertical, //Dùng để phân biệt với màn hình scroll và thao tác kéo với vertical khi kéo theo chiều dọc sẽ không nhận hiệu ứng drag và ngược lại
                // axis: Axis.horizontal,//Hướng di chuyển cho phép của widget feedback
                // allowedButtonsFilter: (buttons) => true,//???
                // feedbackOffset: Offset(50,200),//độ lệch Vị trí forcus của feedback widget
                dragAnchorStrategy: (draggable, context, position) => Offset(50, 40),//vị trí của feedback widget
                // hitTestBehavior: HitTestBehavior.opaque,//???
                ignoringFeedbackPointer: true,//Điểm focus của feedback widget nếu = false sẽ không thể focus
                // ignoringFeedbackSemantics: false,//????
                maxSimultaneousDrags: 1,//Số lượng kéo đồng thời
                // rootOverlay: true,//???
                child: Column(//widget khi chưa drag
                  children: <Widget>[
                    Icon(
                      Icons.palette,
                      color: Colors.deepOrange,
                      size: 60.0,
                    ),
                    Text(
                      'Drag Me below to change color',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                childWhenDragging: Icon( //widget khi đang drag
                  Icons.palette,
                  color: Colors.grey,
                  size: 48.0,
                ),
                feedback: Icon(//Widget hiển thị khi bắt đầu drag
                  Icons.brush,
                  color: Colors.yellow,
                  size: 80.0,
                ),
                data: Colors.yellow.value, //dữ liệu truyền đi
              ),
              DragTarget<int>(
                onAccept: (colorValue) {//khi item drag được drop vào đúng vị trí DragTarget thì thực hiện hành động
                  _paintedColor = Color(colorValue);
                },
                onAcceptWithDetails: (details) {//khi item drag được drop vào đúng vị trí DragTarget thì thực hiện hành động nhận dữ liệu details
                  print('onAcceptWithDetails: ${details.data}');
                },
                onLeave: (data) {//Bắt sự kiện khi item drag ra ngoài vùng DragTarget thì thực hiện hành động
                  print('onLeave: ${data}');
                },
                onMove: (details) {//Bắt sự kiện khi item drag di chuyển trong vùng DragTarget thì thực hiện hành động
                  print('onMove:  ${details.data}');
                },
                onWillAcceptWithDetails: (details) => true,//Cho phép item drag nhận dữ liệu data
                builder: (BuildContext context, List<dynamic> acceptedData, List<dynamic>
                rejectedData) => acceptedData.isEmpty
                    ? Text(
                  'Drag To and see color change',
                  style: TextStyle(color: _paintedColor,fontSize: 25),
                )
                    : Text(
                  'Painting Color: $acceptedData',
                  style: TextStyle(
                      color: Color(acceptedData[0]),
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


