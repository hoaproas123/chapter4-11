class algorithm{
  Map cau2(int a, int b)
  {
    int sum=0, count=0;
    while(a!=b) //Lặp đến khi a=b
        {
      if(a%2==0&&a%3==0) //nếu a chẵn và chia hết cho 3
          {
        sum+=a; //Tổng các số chẵn chia hết cho 3
        count++; //lưu số lượng số chẵn chia hết cho 3
      }
      a++; //tăng biến đếm để thoát vòng lặp
    }
    Map rs={'count':count,'sum':sum};
    return rs;
  }
}
