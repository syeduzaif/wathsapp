import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Chat_model/status_page.dart';
import 'package:wathsapp_ui_2/Chat_model/funtions/text_status.dart';
import 'package:wathsapp_ui_2/Chat_model/funtions/status_view.dart';
import 'dart:io'; // For using the File class

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;

  // Function to get image from camera
  Future<void> _getImage() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 16, bottom: 15),
            child: Row(
              children: [
                Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: _getImage,
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: _pickedImage != null
                            ? FileImage(File(_pickedImage!.path))
                            : const AssetImage('images/no_pic.png')
                                as ImageProvider,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Status',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: theme.textTheme.bodyLarge
                                ?.color, // Updated text theme access
                          ),
                        ),
                        Text(
                          'Tap to add status update',
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                          ), // Use theme color
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  color: theme.iconTheme.color, // Use theme color
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TextStatus(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Recent updates',
                  style: TextStyle(
                    fontSize: 15,
                    color: theme.textTheme.bodyLarge?.color,
                  ), // Use theme color
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: statusData.length, // Ensure statusData is defined
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CustomPaint(
                    painter: MyPainter(),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueGrey,
                      backgroundImage: AssetImage(statusData[index].avatar),
                    ),
                  ),
                  title: Text(
                    statusData[index].name,
                    style: TextStyle(
                        color: theme.textTheme.bodyLarge
                            ?.color), // Updated text theme access
                  ),
                  subtitle: Text(
                    statusData[index].time,
                    style: TextStyle(
                        color: theme
                            .textTheme.bodyMedium?.color), // Use theme color
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StatusViewer(
                          statuses: statusData,
                          initialUserIndex: index,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor, // Use theme color
        onPressed: _getImage,
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green // You can change this to a theme color if needed
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 27, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
