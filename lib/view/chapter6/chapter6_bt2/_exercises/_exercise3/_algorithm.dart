class algorithm{
  int cau3(List dayso)
  {
    int max1=0;
    int max2=0;
    for(int i in dayso){ //Lặp qua các phần tử co trong mảng dayso
      if(i>max1) //Nếu i lớn hơn số lớn nhất
          {
        max2=max1; //Lưu số lớn nhì = số lớn nhất cũ
        max1=i;    //Lưu số lớn nhất mới = i
      }
      if(i>max2&&i!=max1) //Nếu i lơn hơn số lớn nhì và không phải là số lớn nhất (dùng trong trường hợp số lớn nhất nằm trước số lớn nhì)
        max2=i;           //Lưu số lớn nhì = i
    }
    return max2;
  }
  bool isPrime(int n){//Kiểm tra số nguyên tố
    if(n==1) return false;
    if(n==2) return true;
    for(int i=3;i<=n/2;i+=2) //Duyệt qua tất cả số lẻ nhỏ hơn 1/2 n
        {
      if(n%i==0)            //nếu n chia hết cho i thì không phải số nguyên tố
        return false;       //trả về kết quả false
    }
    return true;
  }
  int calFactorial(int n)
  {
    if(n==0) return 0;
    if(n==1) return 1;
    return n*calFactorial(n-1); //Dùng đệ quy để nhân giảm dần giá trị n
  }
  int fibonanciN(int n)
  {
    if(n==0) return 0;
    if(n==1) return 1;
    return fibonanciN(n-1)+fibonanciN(n-2); //Dùng đệ quy để tính tính n số Fibonanci
  }
}
