import 'package:flutter/material.dart';
import '../widgets/safe_asset_avatar.dart';
import '../widgets/safe_asset_image.dart';
import '../screen/edit_profile_page.dart';
import '../screen/profile_menu_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> posts = [
      "assets/public.jpg", "assets/udindindun.jpg", "assets/zevaaji.jpg",
      "assets/lek.jpg", "assets/kata.jpg", "assets/immanuel.jpg",
      "assets/jepa.jpg", "assets/kata.jpg", "assets/zevaaji.jpg",
    ];

    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.lock, size: 16, color: Colors.black), 
            const SizedBox(width: 6),
            const Text("ishowspeed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileMenuPage()),
              );
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildProfileHeader(context),
                  _buildHighlights(),
                ]),
              ),
            ];
          },
          body: Column(
            children: [
              const TabBar(
                indicatorColor: Colors.black,
                indicatorWeight: 1,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                tabs: [
                  Tab(icon: Icon(Icons.grid_on)),
                  Tab(icon: Icon(Icons.person_pin_outlined)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: posts.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) {
                        return SafeAssetImage(posts[index], fit: BoxFit.cover);
                      },
                    ),
                    const Center(child: Text("No photos yet", style: TextStyle(color: Colors.grey))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SafeAssetAvatar(assetPath: "assets/profile.jpg", radius: 45),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatsItem("9", "Posts"),
                    _StatsItem("550", "Followers"),
                    _StatsItem("139", "Following"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text("ishowspeed", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          const Text("@christiano @monkeydluffy", style: TextStyle(color: Colors.black, fontSize: 14)),
          const SizedBox(height: 16),
          SizedBox(
  width: double.infinity,
  height: 32,
  child: OutlinedButton(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Colors.grey),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EditProfilePage(),
        ),
      );
    },
    child: const Text(
      "Edit Profile",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

        ],
      ),
    );
  }

  Widget _buildHighlights() {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          _buildHighlightItem("New", icon: Icons.add),
          _buildHighlightItem("Friends", image: "assets/indonesia.jpg"),
          _buildHighlightItem("Sport", image: "assets/funnycat.jpg"),
          _buildHighlightItem("Design", image: "assets/public.jpg"),
        ],
      ),
    );
  }

  Widget _buildHighlightItem(String label, {IconData? icon, String? image}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2), 
              ),
              child: icon != null 
                ? Center(child: Icon(icon, color: Colors.black, size: 30)) 
                : SafeAssetAvatar(assetPath: image!, radius: 30),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.black, fontSize: 12)),
        ],
      ),
    );
  }
}

class _StatsItem extends StatelessWidget {
  final String count;
  final String label;
  const _StatsItem(this.count, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.black, fontSize: 14)),
      ],
    );
  }
}