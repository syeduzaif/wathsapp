import 'package:flutter/material.dart';
import 'package:wathsapp_ui_2/Chat_model/chat_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserChat extends StatefulWidget {
  final ChatModel chatModel;

  const UserChat({super.key, required this.chatModel});

  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  final ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        leadingWidth: 90,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              child: Row(
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
                    backgroundImage: AssetImage(widget.chatModel.avatar),
                  ),
                ],
              ),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.chatModel.name,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            Text(
              widget.chatModel.lastseen,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.video_call,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                    size: 25,
                    color: Colors.white,
                  ),
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
                          child: Text('View contact'),
                        ),
                        const PopupMenuItem(
                          child: Text('Media, Links, Docs'),
                        ),
                        const PopupMenuItem(
                          child: Text('Search'),
                        ),
                        const PopupMenuItem(
                          child: Text('Mute notifications'),
                        ),
                        const PopupMenuItem(
                          child: Text('Disappearing messages'),
                        ),
                        const PopupMenuItem(
                          child: Text('Wallpaper'),
                        ),
                      ];
                    },
                  ),
                ),
              ]),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 159, 246, 166),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Text(widget.chatModel.message),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              Text(
                                widget.chatModel.time,
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: const FaIcon(
                                  FontAwesomeIcons
                                      .checkDouble, // Correct usage of FaIcon
                                  size: 12.0, // You can adjust the size
                                  color: Colors
                                      .blue, // You can customize the color
                                ),
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
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Text(widget.chatModel.message1),
                        ),
                        Row(
                          children: [
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  widget.chatModel.time1,
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: const FaIcon(
                                FontAwesomeIcons
                                    .checkDouble, // Correct usage of FaIcon
                                size: 12.0, // You can adjust the size
                                color:
                                    Colors.blue, // You can customize the color
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 159, 246, 166),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text(widget.chatModel.message2),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      widget.chatModel.time2,
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: const FaIcon(
                                        FontAwesomeIcons
                                            .checkDouble, // Correct usage of FaIcon
                                        size: 12.0, // You can adjust the size
                                        color: Colors
                                            .blue, // You can customize the color
                                      ),
                                    ),
                                  ],
                                ),
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
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Text(widget.chatModel.message3),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              widget.chatModel.time3,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 5),
                          child: const FaIcon(
                              FontAwesomeIcons
                                  .checkDouble, // Correct usage of FaIcon
                              size: 12.0, // You can adjust the size
                              color: Colors.blue // You can customize the color
                              ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 159, 246, 166),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Text(widget.chatModel.message),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              Text(
                                widget.chatModel.time,
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: const FaIcon(
                                  FontAwesomeIcons
                                      .checkDouble, // Correct usage of FaIcon
                                  size: 12.0, // You can adjust the size
                                  color: Colors
                                      .blue, // You can customize the color
                                ),
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Card(
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText:
                              "Type message here", // Optional: Use hintText instead
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.emoji_emotions),
                            onPressed: () {},
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.attach_file),
                              ),
                              IconButton(
                                onPressed: () {
                                  getImage();
                                },
                                icon: const Icon(Icons.camera_alt),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFF075E54),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]
            // "Chat with ${widget.chatModel.name}",
            ), // Display chat message
      ),
    );
  }
}
