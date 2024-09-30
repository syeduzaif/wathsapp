import 'package:flutter/material.dart';
import 'package:wathsapp_ui_2/Chat_model/call_model.dart';
import 'package:wathsapp_ui_2/Chat_model/funtions/callerpage.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: callData.length,
        itemBuilder: (context, i) {
          if (i == 0) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Recent',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallerPage(callModel: callData[i]),
                ),
              );
            },
            child: Column(
              children: [
                Container(height: 12),
                ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage(callData[i].avatar),
                  ),
                  title: Text(
                    callData[i].name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Container(
                        child: callData[i].callType,
                      ),
                      const SizedBox(
                          width: 8), // Add spacing between call type and time
                      Text(
                        callData[i].time,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.call,
                    size: 25,
                    color: Color(0xFF075E54),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF075E54),
        onPressed: () {}, // Now getImage is accessible
        child: const Icon(Icons.phone, color: Colors.white),
      ),
    );
  }
}
