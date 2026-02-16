import 'package:flutter/material.dart';
import '../widgets/safe_asset_avatar.dart';
import '../widgets/safe_asset_image.dart';
import '../screen/watch_live_page.dart';
import '../screen/story_view_page.dart';

class StoryItem extends StatelessWidget {
  final String username;
  final String assetPath;
  final bool isMyStory;
  final bool hasLive;

  const StoryItem(
    this.username,
    this.assetPath, {
    super.key,
    this.isMyStory = false,
    this.hasLive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (hasLive) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WatchLivePage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StoryViewPage()),
          );
        }
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: hasLive
                      ? const LinearGradient(
                          colors: [Colors.red, Colors.purple],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : const LinearGradient(
                          colors: [Colors.orange, Colors.pink],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                ),
                child: SafeAssetAvatar(
                  assetPath: assetPath,
                  radius: 30,
                ),
              ),

              if (hasLive)
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "LIVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 75,
            child: Text(
              username,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
