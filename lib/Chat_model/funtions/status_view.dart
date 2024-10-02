import 'package:flutter/material.dart';
import 'dart:async';
import 'package:wathsapp_ui_2/Chat_model/status_page.dart';


class StatusViewer extends StatefulWidget {
  final List<StatusModel> statuses;
  final int initialUserIndex;

  const StatusViewer({Key? key, required this.statuses, required this.initialUserIndex}) : super(key: key);

  @override
  _StatusViewerState createState() => _StatusViewerState();
}

class _StatusViewerState extends State<StatusViewer> {
  double progressValue = 0.0;
  late Timer timer;
  late PageController _pageController;
  int currentIndex = 0;
  late int userIndex;

  @override
  void initState() {
    super.initState();
    userIndex = widget.initialUserIndex;
    _pageController = PageController(initialPage: userIndex);
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        progressValue += 0.01;
        if (progressValue >= 1.0) {
          if (currentIndex < widget.statuses[userIndex].statusImages.length - 1) {
            currentIndex++;
            progressValue = 0.0;
          } else {
            moveToNextUser();
          }
        }
      });
    });
  }

  void moveToNextUser() {
    if (userIndex < widget.statuses.length - 1) {
      setState(() {
        userIndex++;
        currentIndex = 0;
        progressValue = 0.0;
        _pageController.jumpToPage(userIndex); // Jump to the next user
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) {
          double screenWidth = MediaQuery.of(context).size.width;
          if (details.globalPosition.dx < screenWidth / 2) {
            if (currentIndex > 0) {
              setState(() {
                currentIndex--;
                progressValue = 0.0;
              });
            } else {
              moveToNextUser();
            }
          } else {
            if (currentIndex < widget.statuses[userIndex].statusImages.length - 1) {
              setState(() {
                currentIndex++;
                progressValue = 0.0;
              });
            } else {
              moveToNextUser();
            }
          }
        },
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.statuses.length,
          onPageChanged: (index) {
            setState(() {
              userIndex = index;
              currentIndex = 0; // Reset to the first image when changing users
              progressValue = 0.0; // Reset progress for new user
            });
          },
          itemBuilder: (context, index) {
            return Stack(
              children: [
                // Display the current image or video
                Image.asset(
                  widget.statuses[index].statusImages[currentIndex],
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Progress bar segmented by the number of images
                      Row(
                        children: List.generate(widget.statuses[index].statusImages.length, (imageIndex) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: LinearProgressIndicator(
                                value: imageIndex == currentIndex
                                    ? progressValue
                                    : (imageIndex < currentIndex ? 1.0 : 0.0),
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                                backgroundColor: Colors.white.withOpacity(0.3),
                              ),
                            ),
                          );
                        }),
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
                            backgroundImage: AssetImage(widget.statuses[index].avatar),
                            radius: 25,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.statuses[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.statuses[index].time,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                      icon: const Icon(Icons.send, color: Colors.green),
                      onPressed: () {},
                    ),
                  ],
                ),
            ),
            ),
    ],
            );
          },
        ),
      ),
    );
  }
}
