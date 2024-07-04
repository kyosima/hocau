import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/data/member.dart';
import 'package:hocau/view/referral/stats/stats_detail_page.dart';
import 'package:hocau/widget/custom_itemlist_view_stats_page.dart';

import '../../../data/ref_detail_member.dart';

class MemberDetailScreen extends StatelessWidget {
  final Member member;

  const MemberDetailScreen({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FishingPond> ponds = sampleFishingPonds;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context, ponds),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        member.hasJoined ? 'Thống kê' : 'Thông tin',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<FishingPond> ponds) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTopSection(context),
          _buildJoinStatusSection(),
          SizedBox(height: 12),
          _buildContentSection(ponds),
        ],
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xFF064E3B),
      child: Column(
        children: [
          SizedBox(height: 12),
          Container(
            margin: EdgeInsets.only(top: 12),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF0B894C),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: CircleAvatar(
                backgroundImage: AssetImage(member.image),
              ),
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                member.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (member.rank != null) ...[
                SizedBox(width: 4),
                Text(
                  '(${member.rank})',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Thành viên từ: ${member.joinDate}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildJoinStatusSection() {
    return Container(
      width: double.infinity,
      color: member.hasJoined ? Color(0xFF0B894C) : Color(0xFFC6212C),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          member.hasJoined ? 'Đã tham gia thành công' : 'Chưa tham gia',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContentSection(List<FishingPond> ponds) {
    if (!member.hasJoined) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Icon(
              Icons.do_not_disturb_on_outlined,
              color: Color(0xFF808080),
              size: 50.0,
            ),
            SizedBox(height: 20),
            Text(
              'Không có gì ở đây...',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF808080),
              ),
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: ponds.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => StatsDetailPage());
              },
              child: CustomItemRef(pond: ponds[index]),
            );
          },
        ),
      );
    }
  }
}
