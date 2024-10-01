

class StatusModel {
  final String name;
  final String time;
  final String avatar;
  final String status;

  StatusModel({
    required this.name,
    required this.time,
    required this.avatar,
    required this.status,
  });
}

List<StatusModel> statusData = [
  StatusModel(
    name: 'Syed Hassan',
    status: "images/victor-rosario-i_YAtGSH9w4-unsplash.jpg",
    time: '10 min ago',
    avatar: "images/a.jpg",
  ),
  StatusModel(
    name: 'alice',
    time: '11 min ago',
    avatar: "images/b.jpg",
    status: "images/sixteen-miles-out-B9A7kEq5Rvs-unsplash.jpg",

  ),
  StatusModel(
    name: 'Shezad Dilawar',
    time: '2:55 PM',
    avatar: "images/c.jpg",
      status:"images/SIMPLI.png",
  ),
  StatusModel(
    name: 'Asif',
    status:"images/samsung-memory-ujDTFimW2mE-unsplash.jpg",
    time: '1:645 PM',
    avatar: "images/d.jpg",

  ),
  StatusModel(
    name: 'Ahmed',
    status:"images/polina-lavor-G71Q0Wz8rcc-unsplash.jpg",
    time: '1:22 PM',
    avatar: "images/a.jpg",
  ),
  StatusModel(
    name: 'Haris ',
    status:"images/pawan-thapa-W9IIcZb2yvc-unsplash.jpg",
    time: '1:07 PM',
    avatar: "images/c.jpg",
  ),StatusModel(
    name: 'Zubaida Arif Madam',
    status:"images/f.jpg",
    time: '12:35 PM',
    avatar: "images/maria-ivanova-lPjPMT8a37Y-unsplash.jpg",
  ),
  StatusModel(
    name: 'Shezad Dilawar',
    status:"images/e.jpg",
    time: '12:01 PM',
    avatar: "images/c.jpg",
  ),
  StatusModel(
    name: 'Asif',
    status:"images/d.jpg",
    time: '11:03 AM',
    avatar: "images/d.jpg",
  ),
  StatusModel(
    status:"images/c.jpg",
    name: 'Ahmed',
    time: '9:09 AM',
    avatar: 'images/no pic.png',
  ),
  StatusModel(
    name: 'John',
    status:"images/b.jpg",
    time: '8:00 AM',
    avatar: 'images/f.jpg',
  ),
  StatusModel(
    name: 'Sarah',
    status:"images/a.jpg",
    time: '06:30 AM',
    avatar: 'images/polina-lavor-G71Q0Wz8rcc-unsplash.jpg',
  ),
  StatusModel(
    name: 'David',
    status:"images/group.jpg",
    time: '5:43 AM',
    avatar: 'images/samsung-memory-ujDTFimW2mE-unsplash.jpg',
  ),
];
