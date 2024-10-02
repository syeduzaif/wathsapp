import 'package:flutter/material.dart';

class CommunityModel {
  final String name;
  final String message;
  final List<String> messages; // Use a list for messages
  final List<String> times; // Use a list for times
  final String avatar;

  CommunityModel({
    required this.name,
    required this.message,
    required this.messages,
    required this.times,
    required this.avatar,
  });
}

class CommunityData {
  static List<CommunityModel> data = [
    CommunityModel(
      name: 'New Community',
      message: 'hello',
      messages: [
        'How’s everything going?',
        'Are you free this weekend?',
        'Let’s catch up soon!',
        'Take care!',
      ],
      times: ['10:20', '10:25', '10:30', '10:35', '10:40'],
      avatar: "images/group.jpg",
    ),
    CommunityModel(
      name: 'Simple Eid',
      message: 'hello',
      messages: [
        'How’s everything going?',
        'Are you free this weekend?',
        'Let’s catch up soon!',
        'Take care!',
      ],
      times: ['10:20', '10:25', '10:30', '10:35', '10:40'],
      avatar: "images/SIMPLI.png",
    ),
    CommunityModel(
      name: 'TDF Ghar',
      message: 'hello',
      messages: [
        'How’s everything going?',
        'Are you free this weekend?',
        'Let’s catch up soon!',
        'Take care!',
      ],
      times: ['10:20', '10:25', '10:30', '10:35', '10:40'],
      avatar: "images/SIMPLI.png",
    ),
  ];
}

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      // Navigate to the appropriate screen
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
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        boxShadow: [
                          if (i ==
                              0) // Only add spread radius for the first item
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
                              color: Colors.grey[300],
                            ),
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
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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

// Detail page to show community details
class CommunityDetailPage extends StatelessWidget {
  final CommunityModel model;

  const CommunityDetailPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
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
          alignment: Alignment.centerLeft, // Center the title
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
      body: Column(children: [







        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 60,
            color: Colors.white, // White color for the container
            child: Center(
              child: Container(
                margin: EdgeInsets.only(left: 40, right: 40, top: 8, bottom: 8),
                child: Text("You can reply to announcements, but only community admins can send them. ",
                  textAlign: TextAlign.center,

                ),
              ),
            ),
          ),
        ),
      ]
      ),
    );
  }
}

// First Community Page
class FirstCommunityPage extends StatelessWidget {
  const FirstCommunityPage({Key? key}) : super(key: key);

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
                SizedBox(height: 30),
                Image.asset("images/wathapp.jpeg"),
                InkWell(
                  child: const Text("See example Communities",
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
