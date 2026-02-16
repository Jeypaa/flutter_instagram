import 'package:flutter/material.dart';
import '../widgets/safe_asset_image.dart'; 
import 'live_page.dart'; 

class CreateStoryPage extends StatelessWidget {
  const CreateStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: SafeAssetImage(
              "assets/speed.jpg",
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.settings, color: Colors.white, size: 32),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 32),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black54,
                      Colors.black,
                    ],
                    stops: [0.35, 0.75, 1],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, 
                    children: [
                     
                      _buildFilterItem(
                        "assets/goyounjung.jpg", 
                        size: 40,
                        isSquare: true, 
                      ),

                      const SizedBox(width: 22),

                      Image.asset("assets/flash.png", width: 32),

                      const SizedBox(width: 35), 
                    ],
                  ),
                ),

           
                _buildShutter(),

          
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, 
                    children: [
                      const SizedBox(width: 35), 
                      
                      Image.asset("assets/change.png", width: 36),
                    ],
                  ),
                ),
              ],
            ),
          ),

         
          Positioned(
            bottom: 42,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildModeText("TYPE"),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LivePage()),
                    );
                  },
                  child: _buildModeText("LIVE"),
                ),
                const SizedBox(width: 20),
                const Text(
                  "NORMAL",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20),
                _buildModeText("BOOMERANG"),
                const SizedBox(width: 20),
                _buildModeText("SUPERZOOM"),
              ],
            ),
          ),
        ],
      ),
    );
  }

 
  Widget _buildFilterItem(String image, {double size = 55, bool isSquare = false}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isSquare ? BorderRadius.circular(8) : null, 
        border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
      ),
      child: isSquare
          ? ClipRRect(
              borderRadius: BorderRadius.circular(6), 
              child: SafeAssetImage(image, fit: BoxFit.cover),
            )
          : ClipOval(
              child: SafeAssetImage(image, fit: BoxFit.cover),
            ),
    );
  }

  Widget _buildShutter() {
    return Container(
      width: 85,
      height: 85,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 5),
      ),
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildModeText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.1,
      ),
    );
  }
}