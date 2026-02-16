import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/safe_asset_image.dart';
import 'igtv_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "assets/kata.jpg", "assets/lek.jpg", "assets/zevaaji.jpg", 
      "assets/immanuel.jpg", "assets/public.jpg", "assets/indonesia.jpg",
      "assets/jepa.jpg", "assets/gyj3.jpg", "assets/gyj4.jpg",
      "assets/aduhkameradepan.jpg", "assets/fishit.jpg", "assets/funnycat.jpg"
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, 
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200], 
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SafeAssetImage("assets/scan.png", height: 28, width: 28, color: Colors.black, fallbackWidget: Icon(Icons.qr_code_scanner, color: Colors.black, size: 28)),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 12),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const IGTVPage()));
                    },
                    child: _buildChip("IGTV", assetIcon: "assets/igtv.png"),
                  ),
                  _buildChip("Shop", icon: Icons.shopping_bag),
                  _buildChip("Style"),
                  _buildChip("Sports"),
                  _buildChip("Auto"),
                  _buildChip("Decor"),
                  _buildChip("Travel"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 10, 
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.width * 0.66,
                      child: Row(
                        children: [
                          Expanded(flex: 2, child: _buildGridImage(images[index % images.length])),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(child: _buildGridImage(images[(index + 1) % images.length])),
                                Expanded(child: _buildGridImage(images[(index + 2) % images.length])),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.width * 0.33,
                      child: Row(
                        children: [
                          Expanded(child: _buildGridImage(images[(index + 3) % images.length])),
                          Expanded(child: _buildGridImage(images[(index + 4) % images.length])),
                          Expanded(child: _buildGridImage(images[(index + 5) % images.length])),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridImage(String path) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1)), 
      child: SafeAssetImage(path, fit: BoxFit.cover, width: double.infinity, height: double.infinity, fallbackWidget: Container(color: Colors.grey[300], child: const Icon(Icons.image, color: Colors.grey))),
    );
  }

  Widget _buildChip(String label, {IconData? icon, String? assetIcon}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white, 
        border: Border.all(color: Colors.grey.shade300), 
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          if (assetIcon != null) ...[SafeAssetImage(assetIcon, height: 16, width: 16, color: Colors.black), const SizedBox(width: 6)] else if (icon != null) ...[Icon(icon, size: 16, color: Colors.black), const SizedBox(width: 6)],
          Text(label, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }
}