import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/event/event_controller.dart';
import '../../../widget/custom_text.dart';

class EventDetailPage extends StatelessWidget {
  final String dropdownValue = 'Chuẩn cần thủ';

  @override
  Widget build(BuildContext context) {
    final EventController eventCtrl = Get.find<EventController>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Chi tiết sự kiện",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: const Icon(Icons.qr_code_scanner),
          ),
        ],
      ),
      body: Obx(() {
        final event = eventCtrl.selectedEvent.value;
        final switchValue = eventCtrl.switchValue.value;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(event.image),
              _buildInformationSection(context, event),
              const SizedBox(height: 8),
              _buildParticipationConditions(switchValue, event),
              const SizedBox(height: 8),
              if (event.status.name != 'canceled' &&
                  event.status.name != 'finished')
                _buildQRCodeSection()
              else
                Container(),
              const SizedBox(height: 6),
              _buildActionButtons(event.status.name, context),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildHeader(String image) {
    return Container(
      height: 205,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildInformationSection(BuildContext context, event) {
    return Container(
      height: MediaQuery.of(context).size.width < 450 ? 600 : 550,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSectionTitle('Thông tin sự kiện'),
            const SizedBox(height: 12),
            _buildReadOnlyTextFormField(event.title),
            const SizedBox(height: 12),
            _buildReadOnlyTextFormField(event.location),
            const SizedBox(height: 12),
            _buildPrizesTextFormField(event.prizes),
            const SizedBox(height: 12),
            _buildReadOnlyTextFormField('${event.price} VNĐ'),
            const SizedBox(height: 12),
            _buildReadOnlyTextFormField('${event.prizes.length}'),
            const SizedBox(height: 12),
            _buildDateTextFormField(event.startDate),
            const SizedBox(height: 12),
            _buildDateTextFormField(event.endDate),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildReadOnlyTextFormField(String value) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: value,
        fillColor: Colors.black12,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildPrizesTextFormField(List prizes) {
    return Container(
      height: 94,
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: TextFormField(
        minLines: 1,
        maxLines: 3,
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          hintText: prizes.map((prize) => prize.name).join(', '),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDateTextFormField(DateTime date) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: DateFormat('dd/MM/yyyy').format(date),
        fillColor: Colors.black12,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.date_range),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildParticipationConditions(bool switchValue, event) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: switchValue ? 200 : 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSwitchRow('Điều kiện tham gia', switchValue),
          const SizedBox(height: 12),
          if (switchValue) ...[
            _buildMinPointsRequiredRow(event.minPointsRequired),
            const SizedBox(height: 12),
            _buildRankingRow(),
          ],
        ],
      ),
    );
  }

  Widget _buildSwitchRow(String title, bool switchValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        Switch(
          value: switchValue,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildMinPointsRequiredRow(int minPoints) {
    return Row(
      children: [
        const Icon(Icons.settings),
        const SizedBox(width: 6),
        const Text('Có điểm CCV từ', style: TextStyle(fontSize: 14)),
        const SizedBox(width: 6),
        Expanded(
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: minPoints.toString(),
              hintStyle: const TextStyle(fontSize: 14),
              fillColor: Colors.black12,
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 14,
              ),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 6),
        const Text('trở lên', style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildRankingRow() {
    return Row(
      children: [
        const Icon(Icons.settings),
        const SizedBox(width: 8),
        const Text('Có xếp loại', style: TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            onChanged: (String? newValue) {},
            items: <String>['Chuẩn cần thủ'].map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ).toList(),
          ),
        ),
        const SizedBox(width: 6),
        const Text('trở lên', style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildQRCodeSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'QR tham gia sự kiện',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed('/event_qr');
            },
            icon: const Icon(Icons.qr_code_2_rounded),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(String status, BuildContext context) {
    return Column(
      children: buildActionButtonsStatus(status, context),
    );
  }
}

List<Widget> buildActionButtonsStatus(String status, BuildContext context) {
  final List<Widget> buttons = [];
  final kW = MediaQuery.of(context).size.width;

  Widget createButton(String status, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: getColor(status)),
        onPressed: onPressed,
        child: CustomText(
          text: '${changeToVN(status)} sự kiện',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buttonCanceledAndFinished(VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xffC6212C)),
        onPressed: onPressed,
        child: CustomText(
          text: 'Hủy sự kiện',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  switch (status) {
    case 'notStarted':
      buttons.add(createButton(status, () {}));
      break;
    case 'inProgress':
      buttons.add(createButton(status, () {}));
      buttons.add(buttonCanceledAndFinished(() {}));
      break;
    case 'paused':
      buttons.add(createButton(status, () {}));
      buttons.add(buttonCanceledAndFinished(() {}));
      break;
    case 'finished':
    case 'canceled':
      buttons.add(createButton(status, () {}));
      break;
  }

  return buttons;
}

Color getColor(String status) {
  switch (status) {
    case 'notStarted':
      return const Color(0xff005699);
    case 'inProgress':
      return const Color(0xffF98E02);
    case 'paused':
      return const Color(0xff0B894C);
    default: // finished && canceled
      return const Color(0xff808080);
  }
}

String changeToVN(String status) {
  switch (status) {
    case 'notStarted':
      return 'Chưa diễn ra';
    case 'inProgress':
      return 'Tạm ngưng';
    case 'paused':
      return 'Tiếp tục';
    case 'canceled':
      return 'Đã bị hủy';
    default: // finished
      return 'Đã kết thúc';
  }
}
