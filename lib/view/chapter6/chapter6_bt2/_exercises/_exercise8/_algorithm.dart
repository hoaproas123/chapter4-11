class algorithm{
  int cau8(List elecNum, List<int> price)
  {
    int totalCost = 0;
    // Tính số tiền cho loại 1
    int A=elecNum[1]-elecNum[0];//Số điện tiêu dùng đã sử dụng
    //price[0]: giá tiền tiêu dùng trường hợp 1
    //price[1]: giá tiền tiêu dùng trường hợp 2
    //price[2]: giá tiền tiêu dùng trường hợp 3
    if (A <= 50) //Số điện tiêu dùng trường hợp 1: 50KWh đầu tiên
        {
      totalCost += A * price[0];
    }
    else if (A <= 150) //Số điện tiêu dùng trường hợp 2: 100KWh tiếp theo
        {
      totalCost += 50 * price[0] + (A - 50) * price[1];
    }
    else //Số điện tiêu dùng trường hợp 3: trên 150KWh
        {
      totalCost += 50 * price[0] + 100 * price[1] + (A - 150) * price[2];
    }

    // Tính số tiền cho loại 2
    int B=elecNum[3]-elecNum[2];// Số điện sản xuất đã sử dụng
    //price[3]: giá tiền sản xuất trường hợp 1
    //price[4]: giá tiền sản xuất trường hợp 2
    //price[5]: giá tiền sản xuất trường hợp 3
    if (B <= 200) //Số điện sản xuất trường hợp 1: 200KWh đầu tiên
        {
      totalCost += B * price[3];
    }
    else if(B<=1000) //Số điện sản xuất trường hợp 2: 800KWh tiếp theo
        {
      totalCost += 200 * price[3] + (B-200) * price[4];
    }
    else //Số điện sản xuất trường hợp 3: trên 1000KWh
        {
      totalCost += 200 * price[3] + 800 * price[4] + (B-1000) * price[5];
    }

    // Tính số tiền cho loại 3
    int C=elecNum[5]-elecNum[4]; // Số điện kinh doanh đã sử dụng
    //price[6]: giá tiền kinh doanh trường hợp 1
    //price[7]: giá tiền kinh doanh trường hợp 2
    //price[8]: giá tiền kinh doanh trường hợp 3
    if (C <= 100) //Số điện kinh doanh trường hợp 1: 100KWh đầu tiên
        {
      totalCost += C * price[6];
    }
    else if(C<=200) //Số điện kinh doanh trường hợp 2: 100KWh tiếp theo
        {
      totalCost += 100 * price[6] + (C-100) * price[7];
    }
    else //Số điện kinh doanh trường hợp 3: trên 200KWh
        {
      totalCost += 100 * price[6] + 100 * price[7] + (C-200) * price[8];
    }
    return totalCost;
  }
}
