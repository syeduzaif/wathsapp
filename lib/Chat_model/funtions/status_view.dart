import 'package:flutter/material.dart';
import 'dart:async';
import 'package:wathsapp_ui_2/Chat_model/status_page.dart';

class StatusViewer extends StatefulWidget {
  final StatusModel status;

  const StatusViewer({Key? key, required this.status}) : super(key: key);

  @override
  _StatusViewerState createState() => _StatusViewerState();
}

class _StatusViewerState extends State<StatusViewer> {
  double progressValue = 0.0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Start the progress timer
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        progressValue += 0.05;
        if (progressValue >= 1.0) {
          timer.cancel();
          Navigator.pop(context); // Automatically close when progress is done
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              widget.status.avatar,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            right: 10,
            child: Column(
              children: [
                // Progress Bar
                LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                SizedBox(height: 10),
                // User Info (Name and Time)
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.status.avatar),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.status.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          widget.status.time,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
