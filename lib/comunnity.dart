import 'package:flutter/material.dart';
// import 'package:wathsapp_ui_2/Chat_model/funtions/community_page.dart';

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
    time: '1:645 PM',
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
                    onTap: () {Navigator();},
                    child: Container(
                      height: 85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        boxShadow: [
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
