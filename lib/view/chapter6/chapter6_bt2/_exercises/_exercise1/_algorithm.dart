class algorithm{
  int cau1(String N)
  {
    String decodedNumber = ''; //Khởi tạo biến chứa chuỗi sau khi mã hóa
    int minlen=N.length; //Lưu độ dài nhỏ nhất của đoạn mã
    while(N.length%2==0) //Lặp đến khi độ dài của N là số lẻ (Điểm yếu nhập N có độ dài chẵn sẽ lỗi)
        {
      decodedNumber = ''; //reset biến chứa chuỗi để lưu giá trị mới sau mỗi vòng lặp
      for (int i = 0; i < N.length - 1; i+=2) //Lặp qua từng cặp số
          {
        decodedNumber+= N[i+1]* int.parse(N[i]); //Chuỗi mới sẽ thêm vào N[i] số N[i+1], vd: 12 thì thêm vào 1 số 2
      }
      if(minlen<decodedNumber.length) //Khắc phục lỗi nhập số chẵn nếu chuỗi có xu hướng tăng độ dài lại thì dừng vòng lặp
        break;
      N=decodedNumber;//Gán N = chuỗi mới để tiếp tục mã hóa
      if(N.length<minlen)  //Lưu dữ liệu độ dài nhỏ nhất
        minlen=N.length;
      print(N);
    }
    return int.parse(N);
  }
}
