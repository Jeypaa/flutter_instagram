import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false, 
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://images.unsplash.com/photo-1524253482453-3fed8d2fe12b?q=80&w=1888&auto=format&fit=crop", 
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator(color: Colors.white));
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.grey[900], child: const Center(child: Text("Gagal memuat gambar", style: TextStyle(color: Colors.white))));
              },
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black26,    
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black87,    
                  ],
                  stops: [0.0, 0.2, 0.5, 1.0],
                ),
              ),
            ),
          ),

          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
                ),
                
                
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFD50058), Color(0xFFFF0055)], 
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "LIVE",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    const SizedBox(width: 8),
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
                          Text("1.5k", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),

                
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF0055),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: const Text(
                      "End",
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),

          
          Positioned(
            bottom: 80, 
            left: 16,
            right: 16,
            child: SizedBox(
              height: 250, 
              child: SingleChildScrollView(
                reverse: true, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "We're telling your followers that you've started a live video.",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Hang on! We're telling more followers to join your video.",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    
                   
                    _buildJoinNotif("udin_maldini", "https://i.pravatar.cc/150?img=11"),
                    const SizedBox(height: 8),
                    _buildJoinNotif("alexannder_dudung", "https://i.pravatar.cc/150?img=5"),
                    const SizedBox(height: 8),
                    _buildComment("francissco_asep", "menyala abangku 🔥", "assets/udindindun.jpg"),
                  ],
                ),
              ),
            ),
          ),

         
          Positioned(
            bottom: 20, 
            left: 16,
            right: 16,
            child: Row(
              children: [
                
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white10, 
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: const Row(
                      children: [
                        Text("Comment...", style: TextStyle(color: Colors.white70)),
                        Spacer(),
                        Icon(Icons.more_horiz, color: Colors.white70),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                
                
                const Icon(CupertinoIcons.question_circle, color: Colors.white, size: 30),
                const SizedBox(width: 12),
                
               
                const Icon(CupertinoIcons.paperplane, color: Colors.white, size: 30),
                const SizedBox(width: 12),
                
               
                const Icon(Icons.face, color: Colors.white, size: 30),
              ],
            ),
          )
        ],
      ),
    );
  }

  
  Widget _buildJoinNotif(String name, String imgUrl) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(imgUrl),
        ),
        const SizedBox(width: 10),
        Text("$name joined", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(20)
          ),
          child: const Text("👋 Wave", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
        )
      ],
    );
  }

 
  Widget _buildComment(String name, String comment, String imgUrl) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(imgUrl),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            Text(comment, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}