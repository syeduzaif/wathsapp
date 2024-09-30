import 'package:flutter/material.dart';
// import 'package:wathsapp_ui_2/Chat_model/funtions/userchat.dart';
import 'package:wathsapp_ui_2/Chat_model/call_model.dart';

class CallerPage extends StatefulWidget {
  final CallModel callModel;

  const CallerPage({super.key, required this.callModel});

  @override
  State<CallerPage> createState() => _CallerPageState();
}

class _CallerPageState extends State<CallerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Call Info",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => UserChat(chatModel: chatModel)),
              // );
            },
            icon: const Icon(
              Icons.message,
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
                    child: Text('Remove from call log'),
                  ),
                  const PopupMenuItem(
                    child: Text('Block'),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(widget.callModel.avatar),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.callModel.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(widget.callModel.about)
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.phone,
                        color: Color(0xFF075E54),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call_outlined,
                        color: Color(0xFF075E54),
                      )),
                )
              ],
            ),
          ),
          const Divider(),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.callModel.day),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: Icon(
                      widget.callModel.iconType,
                      color: widget.callModel.iconType == CallModel.Recived
                          ? Colors.green
                          : Colors.red,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget
                              .callModel.repled, // Displaying the reply status
                          style: TextStyle(
                            color: widget.callModel.callType ==
                                    CallModel.callRecived
                                ? Colors.green
                                : Colors
                                    .red, // Set text color based on call type
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              size: 18,
                              color: Colors.grey,
                            ),
                            Text(
                              widget.callModel.time,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: Icon(
                      widget.callModel.i_iconType,
                      color: widget.callModel.i_iconType == CallModel.Recived
                          ? Colors.green
                          : Colors.red,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget
                              .callModel.i_call, // Displaying the reply status
                          style: TextStyle(
                            color: widget.callModel.i_iconType ==
                                CallModel.callRecived
                                ? Colors.green
                                : Colors
                                .red, // Set text color based on call type
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              size: 18,
                              color: Colors.grey,
                            ),
                            Text(
                              widget.callModel.i_time,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
