import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/member.dart';
import '../../widget/custom_popup_filter.dart';
import 'stats/stats_page.dart';

class ReferredContent extends StatefulWidget {
  const ReferredContent({Key? key}) : super(key: key);

  @override
  _ReferredContentState createState() => _ReferredContentState();
}

class _ReferredContentState extends State<ReferredContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Member> filteredMembers = [];
  GlobalKey fabKey = GlobalKey();
  List<String> selectedRanks = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    filteredMembers = members;
    _tabController.addListener(_tabControllerListener);
  }

  void _tabControllerListener() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void updateFilteredMembers() {
    var newFilteredMembers = selectedRanks.isEmpty
        ? members
        : members
            .where((member) => selectedRanks.contains(member.rank))
            .toList();

    if (!listEquals(newFilteredMembers, filteredMembers)) {
      setState(() {
        filteredMembers = newFilteredMembers;
      });
    }
  }

  void onRankSelected(String? rank) {
    setState(() {
      if (rank != null) {
        if (selectedRanks.contains(rank)) {
          selectedRanks.remove(rank);
        } else {
          selectedRanks.add(rank);
        }
      }
      updateFilteredMembers();
      if (_tabController.index == 1) {
        _tabController.animateTo(0);
      }
    });
  }

  void _showCustomPopup() {
    Map<String, int> rankCounts = {};
    for (var member in members) {
      if (member.rank != null) {
        rankCounts[member.rank!] = (rankCounts[member.rank!] ?? 0) + 1;
      }
    }

    List<PopupMenuEntry> menuItems = rankCounts.entries.map((entry) {
      bool isSelected = selectedRanks.contains(entry.key);
      return PopupMenuItem(
        child: FilterOption(
          rank: entry.key,
          count: entry.value,
          isSelected: isSelected,
          onSelected: (selectedRank) => onRankSelected(selectedRank),
        ),
      );
    }).toList();

    final RenderBox renderBox =
        fabKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    CustomPopupFilter.showCustomMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + size.height - 5,
        22,
        0,
      ),
      items: menuItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.black,
        indicatorColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTabContent(filteredMembers),
                  _buildTabContent(filteredMembers, hasJoinedFilter: false),
                  _buildTabContent(filteredMembers, hasJoinedFilter: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Row(
          children: [
            Expanded(
              child: TabBar(
                controller: _tabController,
                isScrollable: false,
                indicator: BoxDecoration(),
                indicatorWeight: 0,
                labelPadding: EdgeInsets.zero,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF808080),
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Text('Tất cả'),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Text('Chưa tham gia'),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Text('Đã tham gia'),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: IconButton(
                    key: fabKey,
                    icon: const Icon(Icons.filter_list_alt),
                    onPressed: _showCustomPopup,
                  ),
                ),
                Positioned(
                  left: 28,
                  bottom: 10,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC6212C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${selectedRanks.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(List<Member> members, {bool? hasJoinedFilter}) {
    List<Member> filteredMembers;
    if (hasJoinedFilter == null) {
      filteredMembers = members;
    } else {
      filteredMembers = members
          .where((member) => member.hasJoined == hasJoinedFilter)
          .toList();
    }

    return ListView.separated(
        itemCount: filteredMembers.length,
        itemBuilder: (context, index) {
          final member = filteredMembers[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => MemberDetailScreen(member: member));
            },
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0B894C),
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(member.image),
                  ),
                ),
              ),
              title: Row(
                children: [
                  Text(
                    member.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (member.rank != null) ...[
                    const Text(
                      ' (',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${member.rank}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      ')',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ],
              ),
              subtitle: Text(
                'Tham gia từ ${member.joinDate}',
                style: const TextStyle(fontSize: 10, color: Color(0xFF808080)),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 92,
                    height: 26,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: member.hasJoined
                          ? const Color.fromRGBO(11, 137, 76, 0.4)
                          : const Color.fromRGBO(219, 33, 33, 0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      member.hasJoined ? 'Đã tham gia' : 'Chưa tham gia',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'BeVietnam',
                        color: member.hasJoined
                            ? const Color(0xFF0B894C)
                            : const Color(0xFFDB2121),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 16,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(
              height: 1,
              thickness: 0.5,
              color: Color(0xFF808080),
            ),
          );
        });
  }
}
