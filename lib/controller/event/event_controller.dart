import 'package:get/get.dart';
import 'package:hocau/controller/event/model_event.dart';

class EventController extends GetxController {
  var events = <EventModel>[].obs;
  var selectedEvent = EventModel().obs;
  RxBool switchValue = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  void fetchEvents() {
    events.addAll([
      EventModel(
        id: '1',
        title: 'Giải đấu Game Mobile',
        description:
            'Tham gia giải đấu Game Mobile để giành giải thưởng hấp dẫn!',
        location: 'Quán ABC, 123 đường XYZ',
        image: 'assets/images/ih1.png',
        startDate: DateTime(2024, 07, 15),
        endDate: DateTime(2024, 07, 31),
        price: 50000,
        minPointsRequired: 50,
        minRankRequired: 20,
        ticket: 10,
        totalTicket: 100,
        prizes: [
          Prize(
              id: 'p1',
              name: 'Điện thoại ca3333333333333333333333333333o cấp',
              description: 'Điện thoại thông minh mới nhất'),
          Prize(
              id: 'p2',
              name: 'Tai33333333333333333 nghe không dây',
              description: 'Tai nghe chất lượng cao'),
        ],
        status: EventStatus.notStarted,
      ),
      EventModel(
        id: '2',
        title: 'Workshop Lập trình Flutter',
        description: 'Tham gia workshop để học cách lập trình ứng dụng Flutter',
        location: 'Trường Đại học XYZ',
        image: 'assets/images/ih2.png',
        startDate: DateTime(2024, 08, 10),
        endDate: DateTime(2024, 08, 10),
        price: 100000,
        minPointsRequired: 30,
        minRankRequired: 0,
        ticket: 20,
        totalTicket: 50,
        prizes: [
          Prize(
              id: 'p3',
              name: 'Giấy chứng nhận th2333333333333333333333333333333333333333333333333am gia',
              description: 'Giấy chứng nhận hoàn thành workshop'),
        ],
        status: EventStatus.inProgress,
      ),
      EventModel(
        id: '3',
        title: 'Hackathon Sáng tạo',
        description:
            'Tham gia hackathon để tìm ra giải pháp cho các vấn đề thực tế',
        location: 'Không gian co-working XYZ',
        image: 'assets/images/ih3.png',
        startDate: DateTime(2024, 06, 01),
        endDate: DateTime(2024, 06, 15),
        price: 0,
        minPointsRequired: 50,
        minRankRequired: 5,
        ticket: 50,
        totalTicket: 600,
        prizes: [
          Prize(
              id: 'p4',
              name: 'Giải thưởng tiền mặt',
              description: 'Tiền mặt để hỗ trợ thực hiện dự án'),
          Prize(
              id: 'p5',
              name: 'Mentorship từ các chuyên gia',
              description: 'Được hướng dẫn 3333333333333333333333333333333333333333bởi các chuyên gia'),
        ],
        status: EventStatus.finished,
      ),
      EventModel(
        id: '4',
        title: 'Hội thảo Marketing Online',
        description:
            'Học cách tiếp thị hiệu quả cho doanh nghiệp của bạn online',
        location: 'Khách sạn XYZ',
        image: 'assets/images/ih4.png',
        startDate: DateTime(2024, 09, 20),
        endDate: DateTime(2024, 09, 21),
        price: 200000,
        minPointsRequired: 50,
        minRankRequired: 200,
        ticket: 5,
        totalTicket: 100,
        prizes: [
          Prize(
              id: 'p6',
              name: 'Giấy chứng nhận 3333333333333333tham dự',
              description: 'Giấy chứng nhận hoàn thành hội thảo'),
          Prize(
              id: 'p7',
              name: 'Tư vấn m3333333333333333333333333333333333333333iễn phí 1 tháng',
              description: 'Tư vấn về chiến lược marketing online'),
        ],
        status: EventStatus.paused,
      ),
      EventModel(
        id: '5',
        title: 'Chạy bộ Marathon',
        description: 'Tham gia thử thách chạy bộ Marathon',
        location: 'Công viên ABC',
        image: 'assets/images/ih5.png',
        startDate: DateTime(2024, 10, 10),
        endDate: DateTime(2024, 10, 10),
        price: 300000,
        minPointsRequired: 20,
        minRankRequired: 50,
        ticket: 10,
        totalTicket: 100,
        prizes: [
          Prize(
              id: 'p8',
              name: 'Huy chư3333333333333333333333333333333ơng vàng',
              description: 'Huy chương cho người chiến thắng'),
          Prize(
              id: 'p9',
              name: 'Huy chương bạc',
              description: 'Huy chương cho hạng nhì'),
          Prize(
              id: 'p10',
              name: 'Huy chương đồng',
              description: 'Huy chương cho hạng ba'),
        ],
        status: EventStatus.canceled,
      ),
    ]);
  }

  void selectEvent(EventModel event) {
    selectedEvent.value = event;
  }
}
