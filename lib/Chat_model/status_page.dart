

class StatusModel {
  final String name;
  final String time;
  final String avatar;

  StatusModel({
    required this.name,
    required this.time,
    required this.avatar,
  });
}

List<StatusModel> statusData = [
  StatusModel(
    name: 'Syed Hassan',
    time: '10 min ago',
    avatar: "images/a.jpg",
  ),
  StatusModel(
    name: 'alice',
    time: '11 min ago',
    avatar: "images/b.jpg",
  ),
  StatusModel(
    name: 'Shezad Dilawar',
    time: '2:55 PM',
    avatar: "images/c.jpg",
  ),
  StatusModel(
    name: 'Asif',
    time: '1:645 PM',
    avatar: "images/d.jpg",
  ),
  StatusModel(
    name: 'Ahmed',
    time: '1:22 PM',
    avatar: "images/a.jpg",
  ),
  StatusModel(
    name: 'Haris ',
    time: '1:07 PM',
    avatar: "images/c.jpg",
  ),StatusModel(
    name: 'Zubaida Arif Madam',
    time: '12:35 PM',
    avatar: "images/maria-ivanova-lPjPMT8a37Y-unsplash.jpg",
  ),
  StatusModel(
    name: 'Shezad Dilawar',
    time: '12:01 PM',
    avatar: "images/c.jpg",
  ),
  StatusModel(
    name: 'Asif',
    time: '11:03 AM',
    avatar: "images/d.jpg",
  ),
  StatusModel(
    name: 'Ahmed',
    time: '9:09 AM',
    avatar: 'images/no pic.png',
  ),
  StatusModel(
    name: 'John',
    time: '8:00 AM',
    avatar: 'images/f.jpg',
  ),
  StatusModel(
    name: 'Sarah',
    time: '06:30 AM',
    avatar: 'images/polina-lavor-G71Q0Wz8rcc-unsplash.jpg',
  ),
  StatusModel(
    name: 'David',
    time: '5:43 AM',
    avatar: 'images/samsung-memory-ujDTFimW2mE-unsplash.jpg',
  ),
];
