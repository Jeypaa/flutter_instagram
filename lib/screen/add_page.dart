import 'package:flutter/material.dart';
import '../widgets/safe_asset_image.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> galleryAssets = [
      "assets/public.jpg", "assets/lek.jpg", "assets/zevaaji.jpg",
      "assets/funnycat.jpg", "assets/immanuel.jpg", "assets/fishit.jpg",
      "assets/jepa.jpg", "assets/gyj2.jpg", "assets/gyj1.jpg",
      "assets/profile.jpg", "assets/gyj3.jpg", "assets/gyj4.jpg"
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 80,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Center(
            child: Text("Cancel", style: TextStyle(color: Colors.black, fontSize: 16)),
          ),
        ),
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Recents", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text("Next", style: TextStyle(color: Colors.blue[700], fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              const SizedBox(
                height: 375, 
                width: double.infinity,
                child: SafeAssetImage(
                  "assets/jepa.jpg", 
                  fit: BoxFit.cover,
                ),
              ),
              
              Positioned(
                bottom: 16,
                right: 16,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.all_inclusive, color: Colors.white, size: 18),
                    ),
                    const SizedBox(width: 12),
                    
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.grid_view, color: Colors.white, size: 18),
                    ),
                    const SizedBox(width: 12),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.copy, color: Colors.white, size: 16),
                          SizedBox(width: 6),
                          Text("SELECT MULTIPLE", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: Column(
              children: [
   
                Expanded(
                  child: GridView.builder(
                    itemCount: 30, 
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                    ),
                    itemBuilder: (context, index) {
                     
                      return SafeAssetImage(
                        galleryAssets[index % galleryAssets.length],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                
                Container(
                  height: 50,
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Library", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("Photo", style: TextStyle(color: Colors.grey, fontSize: 16)),
                      Text("Video", style: TextStyle(color: Colors.grey, fontSize: 16)),
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
}