import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sumary/view/chapter11/trip.dart';
class dismissible extends StatefulWidget {
  const dismissible({super.key});

  @override
  State<dismissible> createState() => _dismissibleState();
}

class _dismissibleState extends State<dismissible> {
  List _trips=[];
  @override
  void initState() {
    super.initState();
    _trips..add(Trip(id: '0', tripName: 'Rome', tripLocation: 'Italy'))
      ..add(Trip(id: '1', tripName: 'Paris', tripLocation: 'France'))
      ..add(Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'))
      ..add(Trip(id: '3', tripName: 'Cancun', tripLocation: 'Mexico'))
      ..add(Trip(id: '4', tripName: 'London', tripLocation: 'England'))
      ..add(Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'))
      ..add(Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'))
      ..add(Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'))
      ..add(Trip(id: '8', tripName: 'Cusco', tripLocation: 'Peru'))
      ..add(Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'))
      ..add(Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan'));
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _trips.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(_trips[index].id),
          child: _buildListTile(index),
          background: _buildCompleteTrip(),//background chuyển thứ nhất, kéo từ trái sang phải hoặc kéo xuống tùy vào direction
          secondaryBackground: _buildRemoveTrip(),//background chuyển thứ hai, kéo từ phải sang trái hoặc kéo lên tùy vào direction
          direction: DismissDirection.horizontal,//hướng drag hiệu ứng chuyển
          movementDuration: Duration(seconds: 5),//thời gian chạy hiêu ứng chuyển
          confirmDismiss: (direction) { //Có thể thêm hộp thoại comfirm yes/no nếu người dùng chọn no sẽ return future false và hành động sẽ bị hủy
            return direction==DismissDirection.endToStart ? Future(() => false) : Future(() => true);
          },
          dragStartBehavior: DragStartBehavior.start,//??
          crossAxisEndOffset: -10,//hướng di chuyển của item khi chạy hiệu ứng dissmiss
          dismissThresholds: {//quy định hướng kéo đến bao nhiêu % thì kích hoạt hiệu ứng chuyển
            DismissDirection.startToEnd: 0.5,
          },
          onResize: () {//Bắt sự kiện xóa dòng và thực hiện hành động
            print('onResize');
          },
          onUpdate: (details) {
            print('onUpdate: ${details.direction}');
          },
          resizeDuration: Duration( seconds: 5),//thời gian chạy hiệu ứng xóa dòng
          onDismissed: (DismissDirection direction) {//Bắt sự kiện khi kết thúc hiệu ứng chuyển và thực hiện hành động
            direction == DismissDirection.startToEnd ? _markTripCompleted() : _deleteTrip();
// Remove item from List
            setState(() {
              _trips.removeAt(index);
            });
          },
        );
      },
    );
  }
  void _markTripCompleted() {
// Mark trip completed in Database or web service
    print('_markTripCompleted');
  }
  void _deleteTrip() {
// Delete trip from Database or web service
    print('_deleteTrip');
  }
  ListTile _buildListTile(int index) {
    return ListTile(
      title: Text('${_trips[index].tripName}'),
      subtitle: Text(_trips[index].tripLocation),
      leading: Icon(Icons.flight),
      trailing: Icon(Icons.fastfood),
    );
  }
  Container _buildCompleteTrip() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.done,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
  Container _buildRemoveTrip() {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
