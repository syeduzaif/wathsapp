import 'package:flutter/material.dart';

class CommunityModel {
  final String name;
  final String message;
  final String message1;
  final String message2;
  final String message3;
  final String message4;
  final String times;
  final String times1;
  final String times2;
  final String times3;
  final String times4;
  final String avatar;

  CommunityModel({
    required this.name,
    required this.message,
    required this.message1,
    required this.message2,
    required this.message3,
    required this.message4,
    required this.times,
    required this.times4,
    required this.times1,
    required this.times3,
    required this.times2,
    required this.avatar,
  });
}

class CommunityData {
  static List<CommunityModel> data = [
    CommunityModel(
      name: 'New Community',
      message:
          'There are many variations of passages of Lorem Ipsum available,',
      message1: 'How’s everything going?',
      message2:
          'web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like',
      message3:
          'of letters, as opposed to using  Content here, content here making',
      message4:
          'passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
      times: '10:20',
      times1: '10:25',
      times2: '10:30',
      times3: '10:35',
      times4: '10:40',
      avatar: "images/group.jpg",
    ),
    CommunityModel(
      name: 'Simple Eid',
      message:
          'There are many variations of passages of Lorem Ipsum available,',
      message1:
          'you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a',
      message2:
          'web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like',
      message3:
          'of letters, as opposed to using  Content here, content here making',
      message4:
          'passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
      times: '10:20',
      times1: '10:25',
      times2: '10:30',
      times3: '10:35',
      times4: '10:40',
      avatar: "images/SIMPLI.png",
    ),
    CommunityModel(
      name: 'TDF Ghar',
      message:
          'psum is simply dummy  and more recently with desktop publishing software fact that a reader will be distracted by the read readable content of a page when looking at its layout.',
      message1:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
      message2:
          'passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
      message3:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the ',
      message4:
          'There are many variations of passages of Lorem Ipsum available,',
      times: '10:20',
      times1: '10:25',
      times2: '10:30',
      times3: '10:35',
      times4: '10:40',
      avatar: "images/no pic.png",
    ),
  ];
}

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: ListView.builder(
        itemCount: CommunityData.data.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (i == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirstCommunityPage(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommunityDetailPage(
                              model: CommunityData.data[i],
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 85,
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        boxShadow: [
                          if (i == 0)
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black12),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage(CommunityData.data[i].avatar),
                              ),
                            ),
                          ),
                          Text(
                            CommunityData.data[i].name,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: theme.textTheme.bodyLarge?.color),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CommunityDetailPage extends StatelessWidget {
  final CommunityModel model;

  const CommunityDetailPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get theme

    return Scaffold(
      backgroundColor:
          theme.scaffoldBackgroundColor, // Use theme for background
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        leadingWidth: 90,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(model.avatar),
            ),
          ],
        ),
        title: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(
                model.name,
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
            ],
          ),
        ),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
                child: PopupMenuButton<String>(
                  onSelected: (value) {},
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        child: Text('Announcements info'),
                      ),
                      const PopupMenuItem(
                        child: Text('Announcements media'),
                      ),
                      const PopupMenuItem(
                        child: Text('Search'),
                      ),
                      const PopupMenuItem(
                        child: Text('Mute notifications'),
                      ),
                      const PopupMenuItem(
                        child: Text('Wallpaper'),
                      ),
                    ];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Message containers
                  messageRow(context, model.message, model.times),
                  messageRow(context, model.message1, model.times1),
                  messageRow(context, model.message2, model.times2),
                  messageRow(context, model.message3, model.times3),
                  messageRow(context, model.message4, model.times4),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            color: theme.cardColor, // Use theme for card color
            child: Center(
              child: Container(
                color: theme.cardColor,
                margin: const EdgeInsets.only(
                    left: 40, right: 40, top: 8, bottom: 8),
                child: Text(
                  "You can reply to announcements, but only community admins can send them.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: theme
                          .textTheme.bodyLarge?.color), // Use theme text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to simplify message rows
  Widget messageRow(BuildContext context, String message, String time) {
    final theme = Theme.of(context); // Get theme here

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.textTheme.displayMedium?.color,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 333,
                child: Text(
                  message,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FirstCommunityPage extends StatelessWidget {
  const FirstCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("New Community", style: TextStyle(fontSize: 17)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                Image.asset("images/wathapp.jpeg"),
                const InkWell(
                  child: Text("See example Communities",
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                width: 520,
                child: const Text(
                  textAlign: TextAlign.center,
                  "Get started",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
