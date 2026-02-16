import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/safe_asset_avatar.dart';
import '../widgets/safe_asset_image.dart';

class DirectMessagePage extends StatelessWidget {
  const DirectMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatList = [
      ["zevaaji", "Have a nice day, bro!", "assets/zevaaji.jpg", "now"],
      ["immanuel", "I heard this is a good movie, s...", "assets/friend2.jpg", "now"],
      ["jenaissante", "See you on the next meeting!", "assets/jenaissante.jpg", "15m"],
      ["goyounjung", "Sounds good 😂😂😂", "assets/goyounjung.jpg", "20m"],
      ["asepmancing", "The new design looks cool, b...", "assets/friend5.jpg", "1m"],
      ["udindindun", "Thank you, bro!", "assets/friend6.jpg", "2h"],
      ["dudungg", "Yep, I'm going to travel in To...", "assets/friend7.jpg", "4h"],
      ["yantoknalpot", "nahh bro", "assets/friend8.jpg", "5h"],
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "ishowspeed",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18,
              color: Colors.black.withOpacity(0.7),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.add, color: Colors.black, size: 26),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.black54),
                  SizedBox(width: 10),
                  Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // List Chat
          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              padding: const EdgeInsets.only(top: 0),
              itemBuilder: (context, i) {
                final user = chatList[i];
                return ListTile(
                  leading: SafeAssetAvatar(
                    assetPath: user[2],
                    radius: 26,
                  ),
                  title: Text(
                    user[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    user[1],
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        user[3],
                        style: const TextStyle(
                          color: Colors.black38,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 20),
                      SafeAssetImage(
                        "assets/camera.png",
                        height: 22,
                        width: 22,
                        color: Colors.black54,
                        fallbackWidget: Icon(Icons.camera_alt, color: Colors.black54, size: 22),
                      ),
                    ],
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 65,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2))),
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeAssetImage(
                "assets/camera.png",
                height: 25,
                width: 25,
                color: Colors.blue,
                fallbackWidget: Icon(Icons.camera_alt, color: Colors.blue),
              ),
              const SizedBox(height: 2),
              const Text(
                "Camera",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
