import 'package:flutter/material.dart';

class ProfileMenuPage extends StatelessWidget {
  const ProfileMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Material(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "ishowspeed",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Menu List
                _menuItem("assets/archive.png", "Archive"),
                _menuItem("assets/activity.png", "Your Activity"),
                _menuItem("assets/scan.png", "Nametag"),
                _menuItem("assets/bookmark.png", "Saved"),
                _menuItem("assets/closefriend.png", "Close Friends"),
                _menuItem("assets/discover.png", "Discover People"),
                _menuItem("assets/facebook.png", "Open Facebook"),

                const Spacer(),

                const Divider(height: 1),
                _menuItem("assets/settings.png", "Settings"),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(String image, String title) {
    return ListTile(
      leading: Image.asset(
        image,
        width: 24,
        height: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {},
    );
  }
}
