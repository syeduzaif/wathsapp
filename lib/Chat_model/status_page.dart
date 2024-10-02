class StatusModel {
  final String name;
  final String time;
  final String avatar;
  final List<String> statusImages; // Change to a list

  StatusModel({
    required this.name,
    required this.time,
    required this.avatar,
    required this.statusImages, // List of images
  });
}

List<StatusModel> statusData = [
  StatusModel(
    name: 'Syed Hassan',
    time: '10 min ago',
    avatar: "images/a.jpg",
    statusImages: [
      "images/victor-rosario-i_YAtGSH9w4-unsplash.jpg",
      "images/d.jpg"
    ], // Single image for now
  ),
  StatusModel(
    name: 'Alice',
    time: '11 min ago',
    avatar: "images/b.jpg",
    statusImages: [
      "images/sixteen-miles-out-B9A7kEq5Rvs-unsplash.jpg"
    ], // Single image
  ),
  StatusModel(
    name: 'Shezad Dilawar',
    time: '2:55 PM',
    avatar: "images/c.jpg",
    statusImages: [
      "images/SIMPLI.png",
      "images/samsung-memory-ujDTFimW2mE-unsplash.jpg"
    ],
  ),
  StatusModel(
    statusImages: [
      "images/victor-rosario-i_YAtGSH9w4-unsplash.jpg",
      "images/samsung-memory-ujDTFimW2mE-unsplash.jpg"
    ],
    name: 'Asif',
    time: '1:645 PM',
    avatar: "images/d.jpg",
  ),
  StatusModel(
    name: 'Ahmed',
    statusImages: [
      "images/pawan-thapa-E-Hn6YG-znw-unsplash.jpg",
      "images/samsung-memory-ujDTFimW2mE-unsplash.jpg"
    ],
    time: '1:22 PM',
    avatar: "images/a.jpg",
  ),
  StatusModel(
    name: 'Haris ',
    statusImages: [
      "images/polina-lavor-G71Q0Wz8rcc-unsplash.jpg",
      "images/samsung-memory-ujDTFimW2mE-unsplash.jpg",
      "images/d.jpg"
          "images/polina-lavor-G71Q0Wz8rcc-unsplash.jpg",

    ],
    time: '1:07 PM',
    avatar: "images/c.jpg",
  ),
  StatusModel(
    name: 'Zubaida Arif Madam',
    statusImages: [
      "images/polina-lavor-G71Q0Wz8rcc-unsplash.jpg",
      "images/samsung-memory-ujDTFimW2mE-unsplash.jpg"
    ],
    time: '12:35 PM',
    avatar: "images/maria-ivanova-lPjPMT8a37Y-unsplash.jpg",
  ),
  StatusModel(
    name: 'John',
    statusImages: [
      "images/SIMPLI.png",
      "images/samsung-memory-ujDTFimW2mE-unsplash.jpg"
    ],
    time: '8:00 AM',
    avatar: 'images/f.jpg',
  ),
  StatusModel(
    name: 'Sarah',
    statusImages: [
      "images/SIMPLI.png",
      "images/samsung-memory-ujDTFimW2mE-unsplash.jpg"
    ],
    time: '06:30 AM',
    avatar: 'images/polina-lavor-G71Q0Wz8rcc-unsplash.jpg',
  ),
  StatusModel(
    name: 'David',
    statusImages: [
      "images/SIMPLI.png",
      "images/samsung-memory-ujDTFimW2mE-unsplash.jpg"
    ],
    time: '5:43 AM',
    avatar: 'images/samsung-memory-ujDTFimW2mE-unsplash.jpg',
  ),
];
