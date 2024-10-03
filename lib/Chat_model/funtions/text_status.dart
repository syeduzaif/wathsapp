import 'package:flutter/material.dart';

class TextStatus extends StatefulWidget {
  const TextStatus({super.key});

  @override
  State<TextStatus> createState() => _TextStatusState();
}

class _TextStatusState extends State<TextStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Set color for this container
        child: Column(
          children: [
            Container(
              color: Colors.black.withOpacity(0.50),
              height: 40, // Set height
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.cancel,
                      size: 50,
                      color: Colors.black.withOpacity(0.60),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.emoji_emotions,
                    size: 50,
                    color: Colors.black.withOpacity(0.60),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.color_lens,
                    size: 50,
                    color: Colors.black.withOpacity(0.60), // Set color for icon
                  ),
                ),
              ],
            ),
            const Expanded(
              // This will take the remaining space
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: TextField(
                    textAlign: TextAlign.center, // Center text horizontally
                    style: TextStyle(fontSize: 50), // Increase font size
                    decoration: InputDecoration(
                      hintText: 'Type status', // Placeholder text
                      hintStyle: TextStyle(
                          color: Colors.black54), // Style for hint text
                      border: InputBorder.none, // Remove underline
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20), // Increase vertical padding
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 65,
              padding: const EdgeInsets.all(5),
              color:
                  Colors.black.withOpacity(0.30), // Set color for the container
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Center the icon in the container
                children: [
                  Container(
                      child: const Row(
                    children: [
                      Icon(
                        Icons.downloading_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        "Status(contact)",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  )),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(
                        0xFF075E54), // Set the background color of the CircleAvatar
                    child: Icon(
                      Icons.send,
                      size: 25,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
