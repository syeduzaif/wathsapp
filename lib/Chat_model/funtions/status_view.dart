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
        progressValue += 0.01;
        if (progressValue >= 1.0) {
          timer.cancel();
          Navigator.pop(context); // Automatically close when progress is done
        }
      });
    });
  }

  @override
  void dispose() {

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
              widget.status.status,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress Bar
                LinearProgressIndicator(
                  value: progressValue,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
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
                SizedBox(height: 20),
              ],
            ),
          ),
          // Back Button

          // Reply Section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.black54,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Type a reply...",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.green),
                    onPressed: (){},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
