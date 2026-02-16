import 'package:flutter/material.dart';
import '../widgets/safe_asset_image.dart';
import '../widgets/safe_asset_avatar.dart';
import '../widgets/tv_static_painter.dart'; 


class IGTVDetailPage extends StatelessWidget {
  final String bgImage;
  final String title;
  final String username;

  const IGTVDetailPage({
    super.key, 
    required this.bgImage, 
    required this.title, 
    required this.username
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Stack(
        children: [
          Positioned.fill(child: SafeAssetImage(bgImage, fit: BoxFit.cover)),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.3, 0.7, 1.0],
                  colors: [Colors.black54, Colors.transparent, Colors.transparent, Colors.black87],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: 50,
            left: 16,
            right: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SafeAssetAvatar(assetPath: "assets/profile.jpg", radius: 14),
                    const SizedBox(width: 8),
                    Text(username, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                    const SizedBox(width: 8),
                    const Text("Follow", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("37.256 views • 373 comments", style: TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.favorite_border, color: Colors.white, size: 28),
                    const SizedBox(width: 20),
                    const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 28),
                    const SizedBox(width: 20),
                    const Icon(Icons.send, color: Colors.white, size: 28),
                    const SizedBox(width: 20),
                    const Icon(Icons.more_horiz, color: Colors.white, size: 28),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(border: Border.all(color: Colors.white54), borderRadius: BorderRadius.circular(4)),
                      child: const Row(children: [Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 16), SizedBox(width: 4), Text("Up Next", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 16,
            right: 16,
            child: Row(
              children: [
                const Icon(Icons.pause, color: Colors.white, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 2,
                    color: Colors.white30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(width: 100, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text("08:31", style: TextStyle(color: Colors.white, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IGTVPage extends StatelessWidget {
  const IGTVPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                
                Positioned.fill(
                  child: Container(
                    color: Colors.black,
                    child: CustomPaint(painter: TVStaticPainter()),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const Text("IGTV", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                            Row(
                              children: [
                                IconButton(icon: const Icon(Icons.search, color: Colors.white, size: 28), onPressed: () {}),
                                IconButton(icon: const Icon(Icons.add, color: Colors.white, size: 30), onPressed: () {}),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.6,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildIGTVItem(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIGTVItem(BuildContext context, int index) {
    final titles = [
      "night in japan", "beautiful indonesian",
      "mirror selfie", "Spidey", "Go Youn-jung", "Naksoo"
    ];
    final users = ["udiiiin", "photo.master", "jepaaa", "chef_gordon", "aseep", "Naksu"];
    final bgs = ["assets/public.jpg", "assets/indonesia.jpg", "assets/zevaaji.jpg", "assets/spidey.jpg", "assets/gyj1.jpg", "assets/gyj2.jpg"];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => IGTVDetailPage(
              bgImage: bgs[index % bgs.length],
              title: titles[index % titles.length],
              username: users[index % users.length],
            )
          )
        );
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[200]), 
        child: Stack(
          children: [
            SafeAssetImage(bgs[index % bgs.length], width: double.infinity, height: double.infinity, fit: BoxFit.cover),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titles[index % titles.length], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(users[index % users.length], style: const TextStyle(color: Colors.white70, fontSize: 11)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}