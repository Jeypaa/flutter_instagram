import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/safe_asset_image.dart';
import '../widgets/safe_asset_avatar.dart';

class WatchLivePage extends StatelessWidget {
  const WatchLivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false, 
      body: Stack(
        children: [
          // 1. BACKGROUND FOTO 
          const Positioned.fill(
            child: SafeAssetImage(
              "assets/goyounjung.jpg", 
              fit: BoxFit.cover,
            ),
          ),

          // 2. GRADIENT OVERLAY 
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black45,     
                    Colors.transparent, 
                    Colors.transparent,
                    Colors.black54,     
                  ],
                  stops: [0.0, 0.15, 0.6, 1.0],
                ),
              ),
            ),
          ),

          // 3. UI CONTENT
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    children: [
                      const SafeAssetAvatar(assetPath: "assets/goyounjung.jpg", radius: 18),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "goyounjung",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),

                      // LIVE Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                           gradient: const LinearGradient(
                             colors: [Color(0xFFC90083), Color(0xFFD22463)],
                           ),
                           borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text("LIVE", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 8),

                      // Viewers Count
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                           color: Colors.black45,
                           borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.remove_red_eye, color: Colors.white, size: 14),
                            SizedBox(width: 4),
                            Text("15.2k", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      
                      // Tombol Close 
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, color: Colors.white, size: 30),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100, 
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.white],
                              stops: [0.0, 0.2],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            reverse: true, 
                            children: [
                              _buildJoinNotification("karennne joined"),
                              _buildCommentRow("maxjacobson", "Wow amazing! 🔥"),
                              _buildCommentRow("zackjohn", "Hello from Indonesia 🇮🇩"),
                              _buildJoinNotification("craig_love joined"),
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 12),

                      // Request Box 
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white24, 
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            const SafeAssetAvatar(assetPath: "assets/profile.jpg", radius: 16), 
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Send a request to be in",
                                    style: TextStyle(color: Colors.white, fontSize: 13),
                                  ),
                                  Text(
                                    "goyounjung's live video.",
                                    style: TextStyle(color: Colors.white, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0095F6).withOpacity(0.8), 
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text("Request", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Quick Reaction Chips
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildReactionChip("Hello"),
                            _buildReactionChip("😂"),
                            _buildReactionChip("😍"),
                            _buildReactionChip("😮"),
                            _buildReactionChip("👋"),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Bottom Action Bar
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 45,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.white30),
                              ),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Comment", style: TextStyle(color: Colors.white70)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(CupertinoIcons.question_circle, color: Colors.white, size: 30),
                          const SizedBox(width: 16),
                          const Icon(CupertinoIcons.paperplane, color: Colors.white, size: 30),
                          const SizedBox(width: 16),
                          const Icon(Icons.favorite_border, color: Colors.white, size: 30),
                        ],
                      ),
                      const SizedBox(height: 10), 
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Helper untuk Baris Komentar
  Widget _buildCommentRow(String username, String comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SafeAssetAvatar(assetPath: "assets/$username.jpg", radius: 14),
          const SizedBox(width: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.white, fontSize: 14),
              children: [
                TextSpan(text: "$username ", style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: comment),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Helper untuk Notifikasi Join
  Widget _buildJoinNotification(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
    );
  }

  // Widget Helper untuk Chip Reaksi
  Widget _buildReactionChip(String emoji) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(emoji, style: const TextStyle(color: Colors.white, fontSize: 14)),
    );
  }
}