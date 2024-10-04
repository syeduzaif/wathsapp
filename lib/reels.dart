import 'package:flutter/material.dart';

class ReelModel {
  final String name;
  final String description;
  final String image;

  ReelModel({
    required this.name,
    required this.description,
    required this.image,
  });
}

List<ReelModel> reelData = [
  ReelModel(
    name: "Uzaif",
    description: "Exploring the depths of technology.",
    image: "images/samsung-memory-ujDTFimW2mE-unsplash.jpg",
  ),
  ReelModel(
    name: "Pawan",
    description: "Pawan's adventurous spirit shines.",
    image: "images/pawan-thapa-E-Hn6YG-znw-unsplash.jpg",
  ),
  ReelModel(
    name: "Polina",
    description: "Polina shares her vibrant life.",
    image: "images/polina-lavor-G71Q0Wz8rcc-unsplash.jpg",
  ),
  ReelModel(
    name: "Pawan",
    description: "In another captivating adventure.",
    image: "images/pawan-thapa-W9IIcZb2yvc-unsplash.jpg",
  ),
  ReelModel(
    name: "SIMPLI",
    description: "SIMPLI brings minimalist design to life.",
    image: "images/SIMPLI.png",
  ),
  ReelModel(
    name: "Miles",
    description: "Miles captures the essence of life. ",
    image: "images/sixteen-miles-out-B9A7kEq5Rvs-unsplash.jpg",
  ),
  ReelModel(
    name: "Rosario",
    description: "Victor Rosario tells compelling stories.",
    image: "images/victor-rosario-i_YAtGSH9w4-unsplash.jpg",
  ),
];

class Reels extends StatefulWidget {
  const Reels({super.key});

  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  bool _isTextFieldVisible = false;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);

    List<Widget> reels = reelData.map((reel) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(reel.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reel.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  reel.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: LikeButton(),
                ), // Add your LikeButton widget here
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                    icon: const Icon(Icons.comment, color: Colors.white, size: 35),
                    onPressed: () {
                      setState(() {
                        _isTextFieldVisible = !_isTextFieldVisible;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                    icon: const Icon(Icons.share, color: Colors.white, size: 35),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
          ),
          if (_isTextFieldVisible)
            Positioned(
              bottom: 0, // Adjust the position according to your design
              right: 20,
              left: 20,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type your comment...',
                  filled: true,
                  fillColor: Colors.white,
                ),

              ),
            ),
        ],
      );
    }).toList();

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: controller,
        children: reels,
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false; // Track if the button is liked

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: isLiked ? Colors.red : Colors.white,size: 35,
      ),
      onPressed: () {
        setState(() {
          isLiked = !isLiked; // Toggle the like state
        });
      },
    );
  }
}
