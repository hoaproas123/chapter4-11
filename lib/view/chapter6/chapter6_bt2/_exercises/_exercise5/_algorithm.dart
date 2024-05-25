class algorithm{
  int cau5(List<List> examTime)
  {
    //Sắp xếp list tăng dần theo end time
    bubbleSort(examTime);//sắp xếp danh sách tăng dần theo thời gian kết thúc buổi thi
    List<List<List>> rooms=[]; //Tạo danh sách các phòng
    while(examTime.length!=0) //Lặp đến khi các xuất thi được sắp xếp hết vào các phòng thi
        {
      List<List> room=[]; //Tạo danh sách các xuất thi cho phòng thi
      for(int i=0;i<=examTime.length-1;i++)
      {
        if(room.isEmpty || room[room.length-1][1]<=examTime[i][0]) //Nếu phòng thi trống hoặc phòng thi kết thúc trước khi xuất thi sau bắt đầu
            {
          room.add(examTime[i]); //Thêm xuất thi vào phòng thi đó
          examTime.remove(examTime[i]); //Xóa xuất thi khỏi danh sách thi đang chờ phân bố
          i=-1;   //Gán i về 0 để lặp lại vòng lặp từ 0 vì sau khi xóa,vị trí các xuất thi đã bị thay đổi
        }
      }
      rooms.add(room);//Thêm phòng thi đã có xuất thi vào danh sách phòng thi
      // print(rooms);
    }
    return rooms.length; //Trả về số lượng phòng thi hiện có
  }
  void bubbleSort(List<List> arr) {//Thuật toán sắp xếp bubble Sort
    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (arr[j][1] > arr[j + 1][1]) { // Nếu thời gian kết thúc xuất trước lớn hơn thời gian kết thúc xuất sau
          // Hoán đổi các phần tử nếu chúng không theo thứ tự
          List temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }
      }
    }
  }
}
