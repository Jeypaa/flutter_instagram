import 'package:flutter/material.dart';
import '../widgets/safe_asset_avatar.dart';
import '../widgets/safe_asset_image.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white, // Light mode
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false, 
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            tabs: [Tab(text: "Following"), Tab(text: "You")],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFollowingTab(),
            _buildYouTab(),
          ],
        ),
      ),
    );
  }

  //  WIDGETS UNTUK TAB FOLLOWING 
  Widget _buildFollowingTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [

        _buildActivityRow(
          avatar: "assets/jenaissante.jpg",
          richText: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 14),
            children: [
              TextSpan(text: "jenaissante", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " liked 3 posts. 3h"),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                _buildSmallPost("assets/jepa.jpg"),
                const SizedBox(width: 2),
                _buildSmallPost("assets/zevaaji.jpg"),
                const SizedBox(width: 2),
                _buildSmallPost("assets/gyj1.jpg"),
              ],
            ),
          ),
        ),

        _buildActivityRow(
          avatar: "assets/goyounjung.jpg",
          richText: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 14),
            children: [
              TextSpan(text: "goyounjung, asepbrooklyn", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " and "),
              TextSpan(text: "udindindun", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " liked "),
              TextSpan(text: "jepa", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " photo. 3h"),
            ],
          ),
          trailing: _buildSmallPost("assets/jepa.jpg", size: 44),
        ),

        _buildActivityRow(
          avatar: "assets/immanuel.jpg",
          richText: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 14),
            children: [
              TextSpan(text: "immanuel", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " started following "),
              TextSpan(text: "jokowi", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ". 3h"),
            ],
          ),
          trailing: SizedBox(
            width: 90,
            height: 30,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                side: const BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              onPressed: () {},
              child: const Text("Following", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ),
        ),

        const Divider(height: 10, color: Colors.transparent),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SafeAssetAvatar(assetPath: "assets/jenaissante.jpg", radius: 18),
                  const SizedBox(width: 12),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(text: "jenaissante", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: " liked 8 posts. 3h"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 120, 
                child: Row(
                  children: [
                    Expanded(child: _buildSmallPost("assets/zevaaji.jpg", fit: BoxFit.cover)),
                    const SizedBox(width: 2),
                    Expanded(child: _buildSmallPost("assets/kata.jpg", fit: BoxFit.cover)),
                    const SizedBox(width: 2),
                    Expanded(child: _buildSmallPost("assets/jepa.jpg", fit: BoxFit.cover)),
                    const SizedBox(width: 2),
                    Expanded(child: _buildSmallPost("assets/indonesia.jpg", fit: BoxFit.cover)),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Expanded(child: _buildSmallPost("assets/public.jpg", fit: BoxFit.cover)),
                    const SizedBox(width: 2),
                    Expanded(child: _buildSmallPost("assets/udindindun.jpg", fit: BoxFit.cover)),
                    const SizedBox(width: 2),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ],
          ),
        ),

        _buildActivityRow(
          avatar: "assets/udindindun.jpg",
          richText: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 14),
            children: [
              TextSpan(text: "udinmancing", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " and "),
              TextSpan(text: "dudungracing", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " liked "),
              TextSpan(text: "asepbrooklyn", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " post. 3h"),
            ],
          ),
          trailing: _buildSmallPost("assets/funnycat.jpg", size: 44),
        ),
      ],
    );
  }

  Widget _buildActivityRow({
    required String avatar,
    required TextSpan richText,
    Widget? content,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeAssetAvatar(assetPath: avatar, radius: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: RichText(text: richText),
                ),
                if (content != null) content,
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 10),
            trailing,
          ],
        ],
      ),
    );
  }

  Widget _buildSmallPost(String path, {double? size, BoxFit fit = BoxFit.cover}) {
    return Container(
      width: size,
      height: size ?? 120, 
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: SafeAssetImage(path, fit: fit),
    );
  }

  Widget _buildYouTab() {
    return ListView(
      padding: const EdgeInsets.only(bottom: 20),
      children: [
        const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text("Follow Requests", style: TextStyle(color: Colors.black, fontSize: 15)),
          subtitle: Text("Approve or ignore requests", style: TextStyle(color: Colors.grey, fontSize: 13)),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        ),
        const Divider(color: Colors.grey, height: 0.5),
        _buildSectionHeader("New"),
        _buildNotificationItem("assets/jepa.jpg", "jepaaa", "liked your photo. 1h", type: NotificationType.like, postImage: "assets/lek.jpg"),
        _buildSectionHeader("Today"),
        _buildNotificationItem("assets/jenaissante.jpg", "jenaissante, udinbrooklyn", "and 26 others liked your photo. 3h", type: NotificationType.like, postImage: "assets/immanuel.jpg"),
        _buildSectionHeader("This Week"),
        _buildNotificationItem("assets/goyounjung.jpg", "goyounjung", "mentioned you in a comment: @ishowspeed exactly..", type: NotificationType.mention, postImage: "assets/goyounjung.jpg"),
        _buildNotificationItem("assets/friend3.jpg", "udinohio", "started following you. 3d", type: NotificationType.followMessage),
        _buildNotificationItem("assets/friend4.jpg", "asepknalpot", "started following you. 3d", type: NotificationType.followMessage),
        _buildNotificationItem("assets/friend1.jpg", "dudungbatubara", "started following you. 3d", type: NotificationType.follow),
        _buildSectionHeader("This Month"),
        _buildNotificationItem("assets/zevaaji.jpg", "zevaaji", "liked your photo. 4w", type: NotificationType.like, postImage: "assets/profile.jpg"),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
    );
  }

  Widget _buildNotificationItem(String avatarAsset, String username, String text, {required NotificationType type, String? postImage}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: SafeAssetAvatar(assetPath: avatarAsset, radius: 22),
      title: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 14),
          children: [TextSpan(text: "$username ", style: const TextStyle(fontWeight: FontWeight.bold)), TextSpan(text: text)],
        ),
      ),
      trailing: _buildTrailingWidget(type, postImage),
    );
  }

  Widget? _buildTrailingWidget(NotificationType type, String? postImage) {
    switch (type) {
      case NotificationType.like:
      case NotificationType.mention:
        return SizedBox(width: 44, height: 44, child: SafeAssetImage(postImage ?? "assets/public.jpg", fit: BoxFit.cover));
      case NotificationType.follow:
        return SizedBox(width: 90, height: 30, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0095F6), padding: EdgeInsets.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))), onPressed: () {}, child: const Text("Follow", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))));
      case NotificationType.followMessage:
        return SizedBox(width: 90, height: 30, child: OutlinedButton(style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.grey), padding: EdgeInsets.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))), onPressed: () {}, child: const Text("Message", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13))));
    }
  }
}

enum NotificationType { like, mention, follow, followMessage }