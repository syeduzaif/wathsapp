import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wathsapp_ui_2/call.dart';
import 'package:wathsapp_ui_2/chat.dart';
import 'package:wathsapp_ui_2/comunnity.dart';
import 'package:wathsapp_ui_2/status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'WhatsApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'WhatsApp',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          backgroundColor: const Color(0xFF075E54),
          actions: [
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.camera_alt),
              onPressed: getImage,
            ),
            Theme(
              data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              child: PopupMenuButton<String>(
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      child: Text('New group'),
                    ),
                    const PopupMenuItem(
                      child: Text('New broadcast'),
                    ),
                    const PopupMenuItem(
                      child: Text('Linked devices'),
                    ),
                    const PopupMenuItem(
                      child: Text('Starred messages'),
                    ),
                    const PopupMenuItem(
                      child: Text('Settings'),
                    ),
                  ];
                },
              ),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.red,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(icon: Icon(Icons.groups_2, color: Colors.white)),
              Tab(child: Text('Chats', style: TextStyle(color: Colors.white))),
              Tab(child:Text('Updates', style: TextStyle(color: Colors.white))),
              Tab(child: Text('Calls', style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Community(),
            ChatPage(),
            StatusPage(),
            CallPage(),
          ],
        ),
      ),
    );
  }
}
