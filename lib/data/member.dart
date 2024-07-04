class Member {
  final String name;
  final bool hasJoined;
  final String joinDate;
  final String image;
  final String? rank;

  Member({
    required this.image,
    required this.name,
    required this.hasJoined,
    required this.joinDate,
    this.rank,
  });
}

final List<Member> members = [
  Member(
    image: 'assets/images/pham_bao.jpg',
    name: 'Phạm Bảo',
    hasJoined: true,
    joinDate: '19/01/2024',
    rank: 'RF',
  ),
  Member(
    image: 'assets/images/cuong_phomai.jpg',
    name: 'Cường Phô Mai',
    hasJoined: true,
    joinDate: '20/01/2024',
    rank: 'R1',
  ),
  Member(
    image: 'assets/images/jude_bellingham.jpg',
    name: 'Jude Bellingham',
    hasJoined: false,
    joinDate: '21/01/2024',
  ),
  Member(
    image: 'assets/images/tran_quoc_khanh.jpg',
    name: 'Trần Quốc Khánh',
    hasJoined: false,
    joinDate: '08/06/2040',
  ),
  Member(
    image: 'assets/images/alex_ferguson.jpg',
    name: 'Alex Ferguson',
    hasJoined: true,
    joinDate: '19/01/2024',
    rank: 'R2',
  ),
  Member(
    image: 'assets/images/kobe.jpg',
    name: 'Kobe',
    hasJoined: true,
    joinDate: '21/01/2024',
    rank: 'R3',
  ),
  Member(
    image: 'assets/images/member_smiley.jpg',
    name: '=)))',
    hasJoined: true,
    joinDate: '21/01/2024',
    rank: 'R2',
  ),
  Member(
    image: 'assets/images/member_sad.jpg',
    name: '=(((',
    hasJoined: true,
    joinDate: '21/01/2024',
    rank: 'R1',
  ),
  Member(
    image: 'assets/images/ro_ep.jpg',
    name: 'Rờ Ép',
    hasJoined: true,
    joinDate: '21/01/2024',
    rank: 'RF',
  ),
  Member(
    image: 'assets/images/kobe.jpg',
    name: 'Kobe',
    hasJoined: true,
    joinDate: '21/01/2024',
    rank: 'R3',
  ),
  Member(
    image: 'assets/images/member_smiley.jpg',
    name: '=)))',
    hasJoined: true,
    joinDate: '21/01/2024',
    rank: 'R2',
  ),
  Member(
    image: 'assets/images/member_sad.jpg',
    name: '=(((',
    hasJoined: true,
    joinDate: '21/01/2024',
    rank: 'R1',
  ),
  Member(
    image: 'assets/images/ro_ep.jpg',
    name: 'Rờ Ép',
    hasJoined: true,
    joinDate: '21/01/2024',
    rank: 'RF',
  ),
];
