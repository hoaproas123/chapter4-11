class algorithm{
  int cau6(int a,int b)
  {
    int count = 0;
    for (int number = a; number <= b; number++) {//duyệt tất cả số từ a đến b
      if (isPrime(number) && isPalindrome(number)) { //Nếu số vừa là số nguyên tố vừa là đối xứng
        count++; //tăng biến đếm
      }
    }
    return count;
  }
  bool isPalindrome(int number) {//kiếm tra số đối xứng
    String strNumber = number.toString();//Chuyển số về dạng chuỗi
    for (int i = 0; i < strNumber.length ~/ 2; i++) {
      if (strNumber[i] != strNumber[strNumber.length - i - 1]) {//Nếu 2 kí tự ở 2 đầu không giống nhau thì không phải số đối xứng
        return false;
      }
    }
    return true;
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
}
