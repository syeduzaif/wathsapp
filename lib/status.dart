import 'package:flutter/material.dart';
import 'package:wathsapp_ui_2/Chat_model/status_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wathsapp_ui_2/Chat_model/funtions/text_status.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
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
      body: ListView.builder(
        itemCount: statusData.length,
        itemBuilder: (context, i) {
          if (i == 0) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 16, bottom: 15),
                  child: Row(children: [
                    Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
                InkWell(
                  onTap: getImage,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage('images/no pic.png'),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My Status',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Tap to add status update',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        color: const Color(0xFF075E54),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TextStatus()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Recent updates',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }

          return InkWell(
            onTap: () {showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Image(image: AssetImage(statusData[i].avatar)),
                );
              },
            );
              },
            child: Column(
              children: [
                Container(
                  height: 12,
                ),
                ListTile(
                  leading: CustomPaint(
                    painter: MyPainter(),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueGrey,
                      backgroundImage: AssetImage(statusData[i].avatar),
                    ),
                  ),
                  title: Text(
                    statusData[i].name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    statusData[i].time,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF075E54),
        onPressed: getImage,
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    paint.color = Colors.green;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 27, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
