class algorithm{
  List cau7(List numSplit)
  {
    List D=[]; //Danh sách tất cả con số sau khi xóa phần tử
    List D3=[];//Danh sách tất cả số chia hết cho 3 và không trùng sau khi lọc ra từ D List
    int removeNumStart=0;//Số phần tử xóa
    while(removeNumStart!= numSplit.length) //Lặp đến khi số lượng phần tử cần xóa = số lượng phần tử trong mảng
        {
      for(int i=0;i<=numSplit.length-1;i++)
      {
        String num=''; //Lưu số sau khi đã xóa phần tử
        for(int j=0;j<i;j++)//Tìm các phàn tử đứng trước i
            {
          if(i>numSplit.length-removeNumStart) //Nếu i lớn hơn số lương phần tử cần lấy
            continue;
          else
            num+=numSplit[j]; //Lấy phần tử j
        }
        for(int j=i+removeNumStart;j<numSplit.length;j++) //Tìm các phần tử từ (i+ số lượng phần tử cần xóa) cho đến hết mảng
            {
          num+=numSplit[j];  //Lấy phần tử j
        }
        if(num.isNotEmpty)  //Nếu Num không rỗng
          D.add(int.parse(num)); //Chuyển num thành dạng int và thêm vòa danh sách D
      }
      removeNumStart++;//Tăng số lượng phần tử cần xóa lên
    }
    for(int i in D)//Duyệt qua các phần tử trong mảng D
        {
      if(i%3==0 && !D3.contains(i)) //Nếu có phần tử chia hết cho 3 và không trùng với phần tử trong mảng D3
        D3.add(i);//Thêm i vào mảng D3
    }
    return D3;
  }
}
