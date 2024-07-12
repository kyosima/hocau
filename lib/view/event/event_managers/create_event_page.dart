import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widget/custom_text.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  bool switchValue = false;
  String dropdownValue = 'Chuẩn cần thủ';

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: Center(
          child: Text(
            "Tạo sự kiện",
            style: GoogleFonts.beVietnamPro(
                textStyle: TextStyle(color: Colors.white)),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.done_all,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHeader(context),
            _buildInformationForm(kW),
            const SizedBox(height: 8),
            _buildParticipationCondition(),
            const SizedBox(height: 6),
            _buildCreateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            height: 205,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/headimageevent.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: (205 - 50) / 2,
            left: (MediaQuery.of(context).size.width - 50) / 2,
            child: GestureDetector(
              onTap: () => Get.snackbar("Upload Image Header", "Tải hình ảnh",
                  colorText: Colors.white),
              child: Image.asset(
                'assets/images/upload.png',
                width: 60,
                height: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformationForm(double kW) {
    return Container(
      height: kW < 450 ? 550 : 500,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Thông tin sự kiện',
                style: GoogleFonts.beVietnamPro(
                    textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                )),
              ),
            ),
            const SizedBox(height: 12),
            _buildTextFormField('Tiêu đề sự kiện'),
            const SizedBox(height: 12),
            _buildTextFormField('Địa điểm tổ chức'),
            const SizedBox(height: 12),
            _buildTextFormField(
              ' Số lượng phần quà (không bắt buộc)',
              minLines: 1,
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            _buildTextFormField(
              'Giá trị phần quà',
              suffixText: 'VNĐ',
            ),
            const SizedBox(height: 12),
            _buildTextFormField('Số lượng phần quà'),
            const SizedBox(height: 12),
            _buildDateFormField(context, 'Ngày bắt đầu'),
            const SizedBox(height: 12),
            _buildDateFormField(context, 'Ngày kết thúc'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(String labelText,
      {String? hintText,
      int minLines = 1,
      int maxLines = 1,
      String? suffixText}) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixText: suffixText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        contentPadding: hintText != null ? const EdgeInsets.all(15) : null,
      ),
    );
  }

  Widget _buildDateFormField(BuildContext context, String labelText) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.date_range),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2025),
            ).then((selectedDate) {});
          },
        ),
      ),
    );
  }

  Widget _buildParticipationCondition() {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: switchValue ? 200 : 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildParticipationHeader(),
          const SizedBox(height: 8),
          if (switchValue) _buildParticipationDetails(),
        ],
      ),
    );
  }

  Widget _buildParticipationHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Điều kiện tham gia',
          style: GoogleFonts.beVietnamPro(
              textStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          )),
        ),
        Switch(
          value: switchValue,
          activeColor: Color(0xff0B894C),
          onChanged: (value) {
            setState(() {
              switchValue = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildParticipationDetails() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.settings),
            SizedBox(width: 6),
            Text('Có điểm CCV từ',
                style: GoogleFonts.beVietnamPro(
                    textStyle: TextStyle(fontSize: 16))),
            SizedBox(width: 6),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 8,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 6),
            Text('trở lên',
                style: GoogleFonts.beVietnamPro(
                    textStyle: TextStyle(fontSize: 16))),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.settings),
            const SizedBox(width: 8),
            Text('Có xếp loại',
                style: GoogleFonts.beVietnamPro(
                    textStyle: TextStyle(fontSize: 16))),
            const SizedBox(width: 8),
            Expanded(
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Chuẩn cần thủ', 'Option 2', 'Option 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 6),
            Text('trở lên',
                style: GoogleFonts.beVietnamPro(
                    textStyle: TextStyle(fontSize: 16))),
          ],
        ),
      ],
    );
  }

  Widget _buildCreateButton() {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar(
              "Tạo sự kiện mới",
              "Thành công hay không chả liên quan",
              colorText: Colors.white,
            );
          },
          child: CustomText(
            text: 'Khởi tạo',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
