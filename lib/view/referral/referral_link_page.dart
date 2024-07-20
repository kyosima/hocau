import 'package:flutter/material.dart';
import 'package:hocau/view/referral/referral_link_content.dart';
import 'package:hocau/view/referral/referred_content.dart';

import '../../widget/custom_tab_referral.dart';

class ReferralLinkPage extends StatefulWidget {
  const ReferralLinkPage({Key? key}) : super(key: key);

  @override
  _ReferralLinkPageState createState() => _ReferralLinkPageState();
}

class _ReferralLinkPageState extends State<ReferralLinkPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liên kết giới thiệu'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Material(
            color: Color(0xFFFFFFFF),
            child: TabBar(
              controller: _tabController,
              indicator: CustomTabIndicator(
                color: Color(0xFF0B894C),
                screenWidth: MediaQuery.of(context).size.width,
              ),
              tabs: [
                CustomTab(
                  text: 'Liên kết giới thiệu',
                  isSelected: _tabController.index == 0,
                ),
                CustomTab(
                  text: 'Được giới thiệu',
                  isSelected: _tabController.index == 1,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ReferralLinkContent(),
                ReferredContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}