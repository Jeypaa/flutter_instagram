import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/safe_asset_image.dart';
import '../widgets/safe_asset_avatar.dart';
import '../widgets/story_item.dart';
import 'igtv_page.dart';
import 'create_story_page.dart';
import 'direct_message_page.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/800px-Instagram_logo.svg.png",
          height: 35,
          color: Colors.black,
          errorBuilder: (ctx, err, stack) => const Text(
            "Instagram",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        leading: IconButton(
          icon: const SafeAssetImage(
            "assets/camera.png",
            height: 26,
            color: Colors.black,
            fallbackWidget:
                Icon(Icons.camera_alt_outlined, color: Colors.black, size: 28),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateStoryPage()),
            );
          },
        ),

        actions: [
          IconButton(
            icon: const SafeAssetImage(
              "assets/igtv.png",
              height: 26,
              color: Colors.black,
              fallbackWidget:
                  Icon(Icons.live_tv_outlined, color: Colors.black, size: 28),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IGTVPage()),
              );
            },
          ),

          IconButton(
            icon: const SafeAssetImage(
              "assets/messanger.png",
              height: 24,
              color: Colors.black,
              fallbackWidget: Icon(CupertinoIcons.paperplane,
                  color: Colors.black, size: 24),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DirectMessagePage()),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                children: const [
                  StoryItem("Your Story", "assets/profile.jpg",
                      isMyStory: true),
                  StoryItem("goyounjung", "assets/goyounjung.jpg",
                      hasLive: true),
                  StoryItem("jenaissante", "assets/jenaissante.jpg"),
                  StoryItem("immanuel", "assets/immanuel.jpg"),
                  StoryItem("zevaaji", "assets/zevaaji.jpg"),
                ],
              ),
            ),

            const Divider(color: Colors.grey, height: 0.5),

            // POST
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10),
                  leading: const SafeAssetAvatar(
                    assetPath: "assets/udindindun.jpg",
                    radius: 18,
                  ),
                  title: const Row(
                    children: [
                      Text("udindindun",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      SizedBox(width: 4),
                      Icon(Icons.verified, color: Colors.blue, size: 14),
                    ],
                  ),
                  subtitle: const Text("Tokyo, Japan",
                      style: TextStyle(
                          color: Colors.black54, fontSize: 12)),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_horiz,
                        color: Colors.black),
                    onPressed: () {},
                  ),
                ),

                const SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: SafeAssetImage(
                    "assets/public.jpg",
                    fit: BoxFit.cover,
                    fallbackWidget: Center(
                      child: Icon(Icons.image,
                          size: 50, color: Colors.grey),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.favorite_border,
                          color: Colors.black, size: 28),
                      const SizedBox(width: 16),
                      const SafeAssetImage(
                        "assets/comment.png",
                        height: 26,
                        color: Colors.black,
                        fallbackWidget: Icon(Icons.chat_bubble_outline,
                            color: Colors.black, size: 28),
                      ),
                      const SizedBox(width: 16),
                      const SafeAssetImage(
                        "assets/messanger.png",
                        height: 26,
                        color: Colors.black,
                        fallbackWidget: Icon(CupertinoIcons.paperplane,
                            color: Colors.black, size: 28),
                      ),
                      const Spacer(),
                      const Icon(CupertinoIcons.bookmark,
                          color: Colors.black, size: 28),
                    ],
                  ),
                ),

             
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const SafeAssetAvatar(
                          assetPath: "assets/zevaaji.jpg", radius: 10),
                      const SizedBox(width: 8),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                              color: Colors.black, fontSize: 13),
                          children: [
                            TextSpan(text: "Liked by "),
                            TextSpan(
                                text: "zevaaji",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                            TextSpan(text: " and "),
                            TextSpan(
                                text: "44,686 others",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

               
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          color: Colors.black, fontSize: 13),
                      children: [
                        TextSpan(
                            text: "udindindun ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "The game in Japan was amazing and I want to share some photos"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
