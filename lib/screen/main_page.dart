import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_instagram/screen/add_page.dart';
import '../widgets/safe_asset_image.dart';
import '../widgets/safe_asset_avatar.dart';
import 'feed_page.dart';
import 'search_page.dart';
import 'activity_page.dart';
import 'profile_page.dart';
import 'create_story_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FeedPage(),
    const SearchPage(),
    const Center(child: Text("Add Page")), 
    const ActivityPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color iconColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          // 1. HOME
          BottomNavigationBarItem(
            icon: SafeAssetImage(
              "assets/home.png", 
              height: 26, 
              color: iconColor, 
              fallbackWidget: Icon(CupertinoIcons.house, size: 30, color: iconColor)
            ),
            activeIcon: Icon(Icons.home_filled, size: 30, color: iconColor),
            label: 'Home',
          ),
          
          // 2. SEARCH
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search, size: 30, weight: _selectedIndex == 1 ? 900 : 400, color: iconColor),
            label: 'Search',
          ),
          
          // 3. ADD
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPage()));
              },
              child: Icon(CupertinoIcons.plus_app, size: 30, color: iconColor),
            ),
            label: 'Add',
          ),
          
          // 4. ACTIVITY
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3 ? Icons.favorite : Icons.favorite_border, size: 30, color: iconColor),
            label: 'Activity',
          ),
          
          // 5. PROFILE
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _selectedIndex == 4 ? iconColor : Colors.transparent, width: 1.5),
              ),
              child: const SafeAssetAvatar(assetPath: "assets/profile.jpg", radius: 14),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}