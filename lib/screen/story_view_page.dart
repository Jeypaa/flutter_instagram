import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/safe_asset_image.dart';
import '../widgets/safe_asset_avatar.dart';

class StoryViewPage extends StatelessWidget {
  const StoryViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false, 
      body: GestureDetector(
        onTapUp: (details) {
          final width = MediaQuery.of(context).size.width;
          if (details.globalPosition.dx < width / 3) {
          } else {
          }
        },
        child: Stack(
          children: [
            // 1. BACKGROUND IMAGE 
            const Positioned.fill(
              child: SafeAssetImage(
                "assets/jenaissante.jpg", 
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
                      Colors.black54,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black54,
                    ],
                    stops: [0.0, 0.15, 0.85, 1.0],
                  ),
                ),
              ),
            ),

            // 3. UI CONTENT
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        _buildProgressBar(isActive: true),
                        _buildProgressBar(isActive: false),
                        _buildProgressBar(isActive: false),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const SafeAssetAvatar(assetPath: "assets/jenaissante.jpg", radius: 16),
                        const SizedBox(width: 10),
                        const Text(
                          "jenaissante", 
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "4h", 
                          style: TextStyle(color: Colors.white70, fontSize: 14)
                        ),
                        
                        const Spacer(),

                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close, color: Colors.white, size: 28),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.white54),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white24, 
                                  ),
                                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "Send Message", 
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        
                        // Paperplane Icon
                        SafeAssetImage(
                          "assets/paperplane.png",
                          height: 24,               
                          width: 24,
                            fit: BoxFit.contain,
                            fallbackWidget: Icon(
                            CupertinoIcons.paperplane,
                          color: Colors.white,
                          size: 28,
                      ),
                    ),
                        
                        const Icon(Icons.more_horiz, color: Colors.white, size: 28),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper untuk membuat garis progress bar
  Widget _buildProgressBar({required bool isActive}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        height: 2.5,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white30,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}