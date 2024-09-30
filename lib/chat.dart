import 'package:flutter/material.dart';
import 'package:wathsapp_ui_2/Chat_model/chat_model.dart';
import 'package:wathsapp_ui_2/Chat_model/funtions/userchat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatData.length,
        itemBuilder: (context, i) => Column(
          children: [
            Container(
              height: 12,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserChat(chatModel: chatData[i]),
                  ),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: AssetImage(
                    chatData[i].avatar,
                  ),
                ),
                title: Text(
                  chatData[i].name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                subtitle: Text(
                  chatData[i].message4,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
                trailing: Text(
                  chatData[i].time4,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF075E54),
        onPressed: () {},
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}