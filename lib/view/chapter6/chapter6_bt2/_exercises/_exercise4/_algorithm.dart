class algorithm{
  int cau4(List numSplit)
  {
    int min=(int.parse((numSplit[0]))-int.parse((numSplit[1]))).abs(); // Gán hiệu 2 giá trị đầu tiên trong numsplit là giá trị nhỏ nhất
    for(int i=0;i<=numSplit.length;i++)
    {
      for(int j=i+1;j<numSplit.length;j++)
      {
        int num=(int.parse(numSplit[i])-int.parse(numSplit[j])).abs(); //Tính hiêu 2 giá trị của khoảng cách i và  j
        if(num<min) //Nếu num nhỏ hơn min
          min=num;  //gán giá trị nnhỏ nhất = num
      }
    }
    return min;
  }
}
