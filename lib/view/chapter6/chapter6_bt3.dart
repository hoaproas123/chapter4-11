import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage_bai3 extends StatefulWidget {
  const MyHomePage_bai3({super.key});
  @override
  State<MyHomePage_bai3> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage_bai3> {
  List<bool> isSelected=[false, false, false];
  String? dropdownValue;
  Set selection={3};
  String _dropdownValue='One';
  late FocusNode _focusNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Button Boy'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: buildColumnButton(),
        ),
      ),
    );
  }

  Column buildColumnButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20,),
        SegmentedButton(//............Button Segment Test.....................................
          segments: [//List các button loại segment
            ButtonSegment(value: 1, label: Text('XS')),
            ButtonSegment(value: 2, label: Text('S')),
            ButtonSegment(value: 3, label: Text('M')),
            ButtonSegment(value: 4, label: Text('L')),
            ButtonSegment(value: 5, label: Text('XL')),
          ],
          selected: selection,//value được select
          onSelectionChanged: (Set newSelection) {//Đọc thao tác chọn và thực hiện hành động
            setState(() {
              selection=newSelection;
            });
          },
          multiSelectionEnabled: true, //Cho phép chọn nhiều item
          selectedIcon: Icon(Icons.adb_sharp),//Icon hiển thị khi được select, chỉ dùng được khi showSelectedIcon: true
          emptySelectionAllowed: true,//Cho phép không chọn item nào
          showSelectedIcon: true, //Cho phép hiển thị icon khi chọn
          style: ButtonStyle(),//Custome style cho button

        ),
        SizedBox(height: 30,),
        ToggleButtons(//............Button Toggle Test.....................................
          children: <Widget>[
            Icon(Icons.format_bold),
            Icon(Icons.format_italic),
            Icon(Icons.format_underline),
          ],
          isSelected:  isSelected,//List các giá trị được chọn
          onPressed: (int index) {
            setState(() {
              isSelected[index] = !isSelected[index];
            });
          },
          // borderWidth: 30,//Độ dày của border trong từng buttonIcon
          fillColor: Colors.red, //Màu nền button khi được select
          borderColor: Colors.blue,//Màu viền button
          direction: Axis.vertical,//Xếp list button theo chiều ngang hoặc dọc
          // renderBorder: false,//Hiển thị border hoặc không
          selectedBorderColor: Colors.green,//Màu border khi được select
          selectedColor: Colors.blue,//Màu icon khi được select
          verticalDirection: VerticalDirection.up,//Thứ tự của item xếp từ dưới lên hoặc từ trên xuống chỉ dùng được khi direction được xét là vertical

        ),
        SizedBox(height: 40,),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          // buttonAlignedDropdown: true,//???
          // mainAxisSize: MainAxisSize.min,//??
          // buttonHeight: 500,//??
          // overflowButtonSpacing: 500,//????
          // buttonTextTheme: ButtonTextTheme.normal,//??
          buttonPadding: EdgeInsets.all(10),//Canh lề cho button bar
          layoutBehavior: ButtonBarLayoutBehavior.constrained,
          // buttonMinWidth: 50,//??
          overflowDirection: VerticalDirection.up,////Thứ tự của item xếp từ dưới lên hoặc từ trên xuống chỉ dùng được khi direction được xét là vertical
          children: [
            IconButton(//............Button Icon Test.....................................
              onPressed: (){
                setState(() {
                  isSelected[0]=!isSelected[0];
                });
              },//null
              icon: Icon(Icons.ice_skating),
              constraints: BoxConstraints(maxHeight: 600,maxWidth: 600,minHeight: 50,minWidth: 50),//Giới hạn kích thước vùng press trong button
              disabledColor: Colors.pink,//Màu button khi bị vô hiệu hóa
              focusColor: Colors.yellow,//Màu khi được focus vào
              highlightColor: Colors.green,//Màu khi press
              hoverColor: Colors.purple,//Đổi màu khi di chuột vào sử dụng trên web
              isSelected: isSelected[0],//gán trạng thái select
              selectedIcon: Icon(Icons.recycling), //Thay đổi icon khi button được select
              splashColor: Colors.red,//??
              splashRadius: 500,//??
              tooltip: 'Hell', //Hiển thị tin nhắn nhỏ khi ấn giữ button dùng để bổ sung thông tin cho button

            ),
            BackButton(color: Colors.blue,), // Icon Button
            CloseButton(
              style: ButtonStyle(//............Button Style Test.....................................
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(8), // độ nâng
                padding: MaterialStateProperty.all(EdgeInsets.all(16)), //canh lề 4 bên
                foregroundColor: MaterialStateProperty.all(Colors.grey), // đổi màu cho cả icon và chữ
                iconColor: MaterialStateProperty.all(Colors.black), // chỉ đổi màu cho icon
                iconSize: MaterialStateProperty.all(100), // kích thước icon
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(50)),)),//Cấu hình hình dạng của nút
                shadowColor: MaterialStateProperty.all(Colors.blue),// đỗ bóng
                // maximumSize: MaterialStateProperty.all(Size.fromHeight(80)), //Giới hạn kích thước tối đa của box chứa Icon
                // minimumSize: MaterialStateProperty.all(Size(500,500)), //Giới hạn kích thước tối thiểu của box chứa Icon
                // animationDuration: Duration(seconds: 5), //thời gian chạy animation
                // fixedSize: MaterialStateProperty.all(Size(200, 50)),//Kích thước khối chứa icon
                // mouseCursor: MaterialStateProperty.all(MouseCursor.uncontrolled), //Thay đổi hình dạng con trỏ chuột
                overlayColor: MaterialStateProperty.all(Colors.yellow),//Thay đổi thành màu khác khi nút được nhấn hoặc focus hoặc hover
                // side: MaterialStateProperty.all(BorderSide(color: Colors.green,width: 20)),//Vẽ viền button
                splashFactory: InkRipple.splashFactory, // tạo hiệu  ứng khi nút được nhấn
                surfaceTintColor: MaterialStateProperty.all(Colors.deepPurpleAccent),//Phủ 1 lớp màu nhẹ lên trên bề mặt button
                // tapTargetSize: MaterialTapTargetSize.padded,//???
                textStyle: MaterialStateProperty.all(TextStyle()),//Custon kiẻu chữ
                visualDensity: VisualDensity(horizontal: 0.0, vertical: -3.0),//thay đổi Tỉ lệ hình ảnh trên button, giúp đồng nhất với các thiết bị có độ phân giải khác nhau
                enableFeedback: true, //Tạo ra âm thanh khi press button
              ),
            ),
            DrawerButton(),
          ],
        ),
        //-----------------------------------------------------------------------------------------
        Divider(
          height: 100, //Thay đổi chiểu cao của khối divider
        ),
        SizedBox(height: 40,),
        FloatingActionButton(//............Button floatint action Test.....................................
          onPressed: (){},
          // heroTag: ,//Hero animation
          mini: true,//Thay đổi kích thước Button: mini 40pixel, not mini 56pixel
          child: Text('Floating Action Button'),
          isExtended: true,

        ),
        Container(
          width: 100,
          height: 100,
          child: TextButton(//............Button Text Test.....................................
            onPressed: (){print('Press');},//Đọc thao tác nhấn và thực hiện hành động
            onLongPress: (){print('Long Press');},//Đọc thao tác nhấn lâu và thực hiện hành động
            onHover: (bool _hover){_hover ? print('is Hover') : print('not Hover');},//Đọc thao tác rê chuột lên button chỉ sử dụng được trên web
            onFocusChange: (bool _change){_change ? print('is Focus') : print('not Focus');},//Đọc thao tác thay đổi trên button
            style: ButtonStyle(),
            clipBehavior: Clip.antiAlias,//none nội dung bên trong một widget được cắt (clipped) nếu nó vượt ra khỏi khu vực của widget đó
            autofocus: true, //Ưu tiên focus khi mở ứng dụng dùng enter để thấy kết quả
            focusNode: _focusNode,//được sử dụng để quản lý trạng thái focus của một widget
            isSemanticButton: true,//??
            statesController: MaterialStatesController(),//??
            child: Text('Text Button Text Button Text Button Text Button Text Button'),
          ),
        ),
        ElevatedButton(onPressed: (){}, child: Text('Elevanted Button')),
        FilledButton(onPressed: (){}, child: Text('Filled Button')),
        OutlinedButton(onPressed: (){FocusScope.of(context).requestFocus(_focusNode);}, child: Text('Outline Button')),
        MaterialButton(
          onPressed: () {
            // Xử lý khi nút được nhấn

          },
          child: Text('Material Button'),
          elevation: 5, // Độ nâng của nút
          // colorBrightness: Brightness.dark,
          // disabledElevation: 20, //Độ nâng của nút khi vô hiệu hóa
          // highlightElevation: 1000,//??
          // hoverElevation: 1000,//??
        ),
        //-----------------------------------------------------------------------------------------
        Divider(
          color: Colors.red,//Đổi màu cho divider
        ),
        SizedBox(height: 40,),//dùng  để tạo ra các khoảng trống hoặc các khoảng cách giữa các widget khác nhau trong cùng một layout.

        PopupMenuButton(//............Popup Menu Button Test.....................................
          itemBuilder: (BuildContext context) { //Tạo lis item và show
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'option1',
                child: Text('Option 1'),
              ),
              PopupMenuItem<String>(
                value: 'option2',
                child: Text('Option 2'),
              ),
              PopupMenuItem<String>(
                value: 'option3',
                child: Text('Option 3'),
              ),
            ];
          },
          onSelected: (String value) { //Đọc thao tác chọn và thực hiện hành động
            print('Selected: $value');
          },
          offset: Offset(100,100),//Thay đổi vị trí của menu list so với button
          onCanceled: (){print('cancel');},//Đọc thao tác cancel(press out side) và thực hiện hành động
          onOpened: (){print('Open');}, //Đọc thao tác mở menu list và thực hiện hành động
          position: PopupMenuPosition.under,//???
          useRootNavigator: true,//?
        ),
        //-----------------------------------------------------------------------------------------
        Divider(
          color: Colors.red,
          indent: 100, //Xác đinh khoảng cách giữa divider và lề bên trái
        ),

        SizedBox(//dùng để xác định kích thước cố định cho một widget, bất kể nội dung bên trong có thay đổi hay không.
          width: 200,
          child: DropdownButton<String>(//............Button DropDown Test.....................................
            value: _dropdownValue, //Giá trị được select
            onChanged: (String? newValue) { //Bắt sự kiện khi có sự thay đổi trong butôn
              setState(() {
                _dropdownValue = newValue!;
              });
            },
            items: <String>['One', 'Two', 'Three', 'Four'] //Tạo danh sách item
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            // borderRadius: BorderRadius.circular(15), //Bo góc cho cả button và DropDownMenu List
            disabledHint: Text('Hi'), //Hiển thị widget khi button bị vô hiệu hóa
            dropdownColor: Colors.purple,//Thay đổi màu dropdown list
            hint:  Text('Bye'),//một chỉ dẫn được hiển thị khi không có giá trị nào được chọn hoặc nhập vào.
            iconEnabledColor: Colors.red,
            // isDense: true,// widget sẽ hiển thị trong chế độ dense, có nghĩa là chúng sẽ có kích thước nhỏ hơn và khoảng cách giữa các phần tử bên trong cũng sẽ nhỏ hơn.
            // isExpanded: true,//dùng để xác định xem một mục trong danh sách dropdown có nên mở rộng ra để lấp đầy không gian có sẵn hay không.
            itemHeight: 100, //Chiều cao cua item trong list
            // menuMaxHeight: 100,//Chiều cao cho phép của menu list
            onTap: (){print('Tap');},//Đọc thao tác tap vào button và thực hiện hành động
            underline: Text('under'), //Hiển thị  widget bên dưới button
            // selectedItemBuilder: (BuildContext context) {// tạo ra các widget tùy chỉnh để hiển thị các mục được chọn trong danh sách dropdown thay vì sử dụng giá trị mặc định của các mục.
            //   return ['Option 1', 'Option 2', 'Option 3','Option 4'].map<Widget>((String value) {
            //     return Text(
            //       'Current selection: $value', // Tạo widget tùy chỉnh để hiển thị mục được chọn
            //       style: TextStyle(color: Colors.blue),
            //     );
            //   }).toList();
            // },
          ),
        ),
        DropdownButtonFormField<String>(
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['Item 1', 'Item 2', 'Item 3', 'Item 4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            labelText: 'Select an item',
            border: OutlineInputBorder(),
          ),
        ),
        //-----------------------------------------------------------------------------------------
        Divider(
          color: Colors.red,
          endIndent: 100, //Xác đinh khoảng cách giữa divider và lề bên phải
        ),

        Divider(
          height: 20,
          color: Colors.red,
          thickness: 10, //Độ dày của divider
        ),
      ],
    );
  }
}
