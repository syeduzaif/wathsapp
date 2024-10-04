import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
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
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _emojiPick = false;

  Future<void> getImage() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _emojiPick) {
        setState(() {
          _emojiPick = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleEmojiPick() {
    if (_emojiPick) {
      _focusNode.requestFocus();
    } else {
      _focusNode.unfocus();
    }

    setState(() {
      _emojiPick = !_emojiPick;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        leadingWidth: 90,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
          mainAxisAlignment: MainAxisAlignment.center,
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
          padding: const EdgeInsets.only(top: 50.0),
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
                    decoration: BoxDecoration(
                      color: theme.textTheme.displayMedium?.color,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            widget.chatModel.message,
                            style: TextStyle(
                                color: theme.textTheme.bodyLarge?.color),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              widget.chatModel.time,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: theme.textTheme.bodyMedium?.color),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 5),
                          child: FaIcon(
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
                      children: [
                        Container(
                          child: Text(
                            widget.chatModel.message1,
                            style: TextStyle(
                                color: theme.textTheme.bodyLarge?.color),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              widget.chatModel.time1,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: theme.textTheme.bodyMedium?.color),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 5),
                          child: FaIcon(
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
                    decoration: BoxDecoration(
                      color: theme.textTheme.displayMedium?.color,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            widget.chatModel.message2,
                            style: TextStyle(
                                color: theme.textTheme.bodyLarge?.color),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              widget.chatModel.time2,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: theme.textTheme.bodyMedium?.color),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 5),
                          child: FaIcon(
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
                      children: [
                        Container(
                          child: Text(
                            widget.chatModel.message3,
                            style: TextStyle(
                                color: theme.textTheme.bodyLarge?.color),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              widget.chatModel.time3,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: theme.textTheme.bodyMedium?.color),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 5),
                          child: FaIcon(
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
                    decoration: BoxDecoration(
                      color: theme.textTheme.displayMedium?.color,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            widget.chatModel.message4,
                            style: TextStyle(
                                color: theme.textTheme.bodyLarge?.color),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              widget.chatModel.time4,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: theme.textTheme.bodyMedium?.color),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 5),
                          child: FaIcon(
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
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_emojiPick)
                  SizedBox(
                      height: 250,
                      child: EmojiPicker(
                        onEmojiSelected: (category, emoji) {/* ...*/},
                        config: Config(/* ...*/),

                      )),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            controller: _controller,
                            focusNode: _focusNode,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(color: Colors.black, ), // Set the text color to black
                            decoration: InputDecoration(
                              hintText: "Type message here",
                              hintStyle: TextStyle(color: Colors.grey), // Optional: Change hint text color if needed
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.emoji_emotions),
                                onPressed: _toggleEmojiPick,
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
              ],
            ),
          ),
        ]),
      ),
    );

  }
}
