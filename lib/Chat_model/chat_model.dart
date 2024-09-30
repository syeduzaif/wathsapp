class ChatModel {
  final String name;
  final String lastseen;
  final String message;
  final String message1;
  final String message2;
  final String message3;
  final String message4;
  final String time;
  final String time1;
  final String time2;
  final String time3;
  final String time4;
  final String avatar;

  ChatModel({
    required this.name,
    required this.lastseen,
    required this.message,
    required this.message1,
    required this.message2,
    required this.message3,
    required this.message4,
    required this.time,
    required this.time1,
    required this.time2,
    required this.time3,
    required this.time4,
    required this.avatar,
  });
}

List<ChatModel> chatData = [
  ChatModel(
    name: 'Syed Uzaif',
    lastseen: 'last seen 7:30 pm ',
    message: 'hello',
    time1: '10:25',
    time2: '10:30',
    time3: '10:35',
    time4: '10:40',
    message1: 'How’s everything going?',
    message2: 'Are you free this weekend?',
    message3: 'Let’s catch up soon!',
    message4: 'Take care!',
    time: '10:20',
    avatar: "images/a.jpg",
  ),
  ChatModel(
    name: 'Alice',
    lastseen: 'last seen 7:30 pm ',
    message: 'Hey! How are you?',
    time1: '09:20',
    time2: '09:25',
    time3: '09:30',
    time4: '09:35',
    message1: 'Long time no see!',
    message2: 'How was your trip?',
    message3: 'Missed our chats!',
    message4: 'Hope all is well!',
    time: '09:15',
    avatar: "images/b.jpg",
  ),
  ChatModel(
    name: 'Haris',
    lastseen: 'last seen 7:30 pm ',
    message: 'Ha bhai kha?',
    time1: '07:50',
    time2: '07:55',
    time3: '08:00',
    time4: '08:05',
    message1: 'Busy at work?',
    message2: 'What’s the plan for tonight?',
    message3: 'Let’s play some games later!',
    message4: 'Catch you later!',
    time: '07:55',
    avatar: "images/c.jpg",
  ),
  ChatModel(
    name: 'Zubaida Arif Madam',
    lastseen: 'last seen 7:30 pm ',
    message: 'Will you come?',
    time1: '07:30',
    time2: '07:32',
    time3: '07:34',
    time4: '07:36',
    message1: 'Don’t forget to bring the report.',
    message2: 'Meeting is at 2 PM.',
    message3: 'See you soon!',
    message4: 'Please confirm.',
    time: '07:35',
    avatar: "images/maria-ivanova-lPjPMT8a37Y-unsplash.jpg",
  ),
  ChatModel(
    lastseen: 'last seen 7:30 pm ',
    name: 'Shezad Dilawar',
    message: 'Bach da',
    time1: '06:10',
    time2: '06:12',
    time3: '06:14',
    time4: '06:16',
    message1: 'Yaar, I’m stuck in traffic.',
    message2: 'Running a bit late.',
    message3: 'Let’s meet at 8.',
    message4: 'Text you when I’m there!',
    time: '06:15',
    avatar: "images/c.jpg",
  ),
  ChatModel(
    lastseen: 'last seen 7:30 pm ',
    name: 'Asif',
    message: 'Weekend ka kia scene ha?',
    time1: '08:10',
    time2: '08:12',
    time3: '08:14',
    time4: '08:16',
    message1: 'Planning to relax at home.',
    message2: 'Want to grab coffee?',
    message3: 'Let’s catch up on Saturday.',
    message4: 'See you soon!',
    time: '08:15',
    avatar: "images/d.jpg",
  ),
  ChatModel(
    name: 'Ahmed',
    lastseen: 'last seen 7:30 pm ',
    message: 'Thanks',
    time1: '06:20',
    time2: '06:22',
    time3: '06:24',
    time4: '06:26',
    message1: 'Really appreciate your help!',
    message2: 'You saved my day!',
    message3: 'Let’s catch up soon.',
    message4: 'Take care!',
    time: '06:15',
    avatar: 'images/no pic.png',
  ),
  ChatModel(
    name: 'John',
    lastseen: 'last seen 7:30 pm ',
    message: 'Let’s meet up later.',
    time1: '11:05',
    time2: '11:10',
    time3: '11:15',
    time4: '11:20',
    message1: 'How about 5 PM?',
    message2: 'Can you make it?',
    message3: 'Looking forward to it.',
    message4: 'See you then!',
    time: '11:00',
    avatar: 'images/f.jpg',
  ),
  ChatModel(
    name: 'Sarah',
    lastseen: 'last seen 7:30 pm ',
    message: 'Can you send me the files?',
    time1: '08:25',
    time2: '08:27',
    time3: '08:29',
    time4: '08:31',
    message1: 'I need them ASAP.',
    message2: 'Thanks in advance!',
    message3: 'Did you receive my message?',
    message4: 'Looking forward to your response!',
    time: '08:30',
    avatar: 'images/polina-lavor-G71Q0Wz8rcc-unsplash.jpg',
  ),
  ChatModel(
    name: 'David',
    lastseen: 'last seen 7:30 pm ',
    message: 'What time are we leaving?',
    time1: '07:40',
    time2: '07:42',
    time3: '07:44',
    time4: '07:46',
    message1: 'I’ll be ready by 6.',
    message2: 'Let’s grab dinner before.',
    message3: 'Looking forward to the trip!',
    message4: 'Don’t forget your passport!',
    time: '07:45',
    avatar: 'images/samsung-memory-ujDTFimW2mE-unsplash.jpg',
  ),
  ChatModel(
    name: 'Emma',
    message: 'I’ll call you later.',
    lastseen: 'last seen 7:30 pm ',
    time1: '10:00',
    time2: '10:02',
    time3: '10:04',
    time4: '10:06',
    message1: 'Busy with work right now.',
    message2: 'I’ll try to finish early.',
    message3: 'Talk to you soon!',
    message4: 'Have a great day!',
    time: '10:05',
    avatar: "images/unsplash-profile.jpg",
  ),
  ChatModel(
    name: 'Michael',
    message: 'Do you have the meeting notes?',
    lastseen: 'last seen 7:30 pm ',
    time1: '09:45',
    time2: '09:48',
    time3: '09:52',
    time4: '09:54',
    message1: 'Need them for the presentation.',
    message2: 'Please send them over.',
    message3: 'Thanks!',
    message4: 'Talk to you later.',
    time: '09:50',
    avatar: "images/no pic.png",
  ),
  ChatModel(
    lastseen: 'last seen 7:30 pm ',
    name: 'Olivia',
    message: 'I finished the project!',
    time1: '12:05',
    time2: '12:07',
    time3: '12:09',
    time4: '12:11',
    message1: 'Can’t wait to show you.',
    message2: 'Let’s review it together.',
    message3: 'I’m excited about the results!',
    message4: 'See you soon!',
    time: '12:00',
    avatar: 'images/sixteen-miles-out-B9A7kEq5Rvs-unsplash.jpg',
  ),
  ChatModel(
    name: 'Sophia',
    lastseen: 'last seen 7:30 pm ',
    message: 'Let’s grab lunch tomorrow.',
    time1: '10:10',
    time2: '10:12',
    time3: '10:14',
    time4: '10:16',
    message1: 'I found a great new place.',
    message2: 'Are you free at noon?',
    message3: 'Looking forward to it!',
    message4: 'Let me know!',
    time: '10:15',
    avatar: 'images/victor-rosario-i_YAtGSH9w4-unsplash.jpg',
  ),
];