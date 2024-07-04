class FishingPond {
  final String name;
  final List<OrderSummary> orderSummaries;
  final List<DetailedOrder> detailedOrders;

  FishingPond({
    required this.name,
    required this.orderSummaries,
    required this.detailedOrders,
  });
}

class OrderSummary {
  final String name;
  final int ordersGenerated;
  final int ordersPaid;
  final String commissionGenerated;
  final String pendingTransfer;
  final String transferred;

  OrderSummary({
    required this.name,
    required this.ordersGenerated,
    required this.ordersPaid,
    required this.commissionGenerated,
    required this.pendingTransfer,
    required this.transferred,
  });
}

class DetailedOrder {
  final String pondName;
  final String status;
  final String orderNumber;
  final String bookingTime;
  final String fishingSlot;
  final String fishingDate;
  final String pendingTransfer;
  final String transferred;
  final String totalAmount;

  DetailedOrder({
    required this.pondName,
    required this.status,
    required this.orderNumber,
    required this.bookingTime,
    required this.fishingSlot,
    required this.fishingDate,
    required this.pendingTransfer,
    required this.transferred,
    required this.totalAmount,
  });
}

final List<FishingPond> sampleFishingPonds = [
  FishingPond(
    name: "Hồ Câu Thanh Thông Thả Tỉnh Tây Ninh",
    orderSummaries: [
      OrderSummary(
        name: "Đơn hàng phát sinh",
        ordersGenerated: 10,
        ordersPaid: 10,
        commissionGenerated: "200.000đ",
        pendingTransfer: "100.000đ",
        transferred: "100.000đ",
      ),
    ],
    detailedOrders: [
      DetailedOrder(
        pondName: "Hồ Câu Thanh Thông Thả Tỉnh Tây Ninh",
        status: "Chờ thanh toán",
        orderNumber: "Hồ câu số 1",
        bookingTime: "10:00 | 09/04/2024",
        fishingSlot: "Buổi sáng (7h - 12h)",
        fishingDate: "07:00 | 01/01/2024",
        pendingTransfer: "100.000đ",
        transferred: "100.000đ",
        totalAmount: "200.000đ",
      ),
    ],
  ),
  FishingPond(
    name: "Hồ Câu Hoàng Hải TP.Thủ Đức",
    orderSummaries: [
      OrderSummary(
        name: "Đơn hàng phát sinh",
        ordersGenerated: 10,
        ordersPaid: 10,
        commissionGenerated: "200.000đ",
        pendingTransfer: "100.000đ",
        transferred: "100.000đ",
      ),
    ],
    detailedOrders: [
      DetailedOrder(
        pondName: "Hồ Câu Hoàng Hải TP.Thủ Đức",
        status: "Chờ thanh toán",
        orderNumber: "Hồ câu số 2",
        bookingTime: "11:00 | 10/04/2024",
        fishingSlot: "Buổi chiều (13h - 18h)",
        fishingDate: "13:00 | 02/02/2024",
        pendingTransfer: "100.000đ",
        transferred: "100.000đ",
        totalAmount: "200.000đ",
      ),
    ],
  ),
];
