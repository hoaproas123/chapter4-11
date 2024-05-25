import 'package:flutter/material.dart';
class loadresult_Dialog {
  loadresult_Dialog(BuildContext context, String rsString){
    showDialog(
      context: context,
      builder: (context)=>
          Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          ),
    );
    // Đợi 3 giây
    Future.delayed(Duration(seconds: 2), () {
      // Sau khi đợi 2 giây, đóng màn hình loading và hiển thị hộp thoại
      Navigator.of(context).pop(); // Đóng màn hình loading
      showDialog(
        context: context,
        builder: (context)=>
            AlertDialog(
              actions: [
                TextButton(
                  onPressed:() {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
              title: const Text('Result'),
              contentPadding: EdgeInsets.all(20),
              content: SingleChildScrollView(
                child: Text(
                      rsString,
                      style: TextStyle(fontSize: 30),
                    ),
              ),
            ),
      );
    });
  }
}

