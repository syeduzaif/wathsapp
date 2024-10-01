import 'package:flutter/material.dart';

class ComunityModel {
  final String name;
  final String time;
  final String avatar;

  ComunityModel({
    required this.name,
    required this.time,
    required this.avatar,
  });
}

List<ComunityModel> comData = [
  ComunityModel(
    name: 'New Community',
    time: '10 min ago',
    avatar: "images/group.jpg",
  ),
  ComunityModel(
    name: 'SimpliEid',
    time: '11 min ago',
    avatar: "images/SIMPLI.png",
  ),
  ComunityModel(
    name: 'TDF Ghar',
    time: '2:55 PM',
    avatar: "images/c.jpg",
  ),
  ComunityModel(
    name: 'Board',
    time: '1:45 PM',
    avatar: "images/d.jpg",
  ),
];

class Comunnity extends StatefulWidget {
  const Comunnity({super.key});

  @override
  State<Comunnity> createState() => Community();
}

class Community extends State<Comunnity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: comData.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (i == 0) {
                        // Navigate to a different screen for the first item
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FirstCommunityPage(), // Replace with your desired screen
                          ),
                        );
                      } else {
                        // Navigate to the CommunityPage for other items
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommunityPage(
                              communityName: comData[i].name,
                              communityAvatar: comData[i].avatar,
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
                            )
                          else // No shadow for others
                            BoxShadow(
                              color: Colors.transparent,
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
                                backgroundImage: AssetImage(comData[i].avatar),
                              ),
                            ),
                          ),
                          Text(
                            comData[i].name,
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

// Updated CommunityPage to handle display details
class CommunityPage extends StatelessWidget {
  final String communityName;
  final String communityAvatar;

  const CommunityPage({
    Key? key,
    required this.communityName,
    required this.communityAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade400,
        appBar: AppBar(
          backgroundColor: const Color(0xFF075E54),
          leadingWidth: 90,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                backgroundImage: AssetImage(communityAvatar),
              ),
            ],
          ),
          title: Container(
            alignment: Alignment.centerLeft, // Center the title
            child: Column(
              children: [
                Text(
                  communityName,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 5.0),
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
        body: SingleChildScrollView(
            child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(12),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 400,
                            child: Text(
                                softWrap: true,
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "12:30",
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Image.asset("images/a.jpg"),
                                Container(
                                  width: 400,
                                  child: Text(
                                      softWrap: true,
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "01:10 PM",
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(12),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 400,
                            child: Text(
                                softWrap: true,
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "12:30",
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        )));
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
        title: Text(
          "New Community",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Image.asset("images/wathapp.jpeg"),
                InkWell(
                  child: Text(
                    "See example Communities",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () {},
                child: Expanded(
                    child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  width: 520,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Get started",
                    style: TextStyle(color: Colors.white),
                  ),
                ))),
          ],
        ),
      ),
    );
  }
}
