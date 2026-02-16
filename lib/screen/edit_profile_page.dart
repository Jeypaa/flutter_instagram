import 'package:flutter/material.dart';
import '../widgets/safe_asset_avatar.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
       
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        centerTitle: true,
        
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text("Done", style: TextStyle(color: Colors.blue[700], fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            const Center(
              child: SafeAssetAvatar(
                assetPath: "assets/profile.jpg",
                radius: 50,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Change Profile Photo",
              style: TextStyle(color: Colors.blue[700], fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),

            const Divider(height: 1, color: Colors.grey), 

            
            _buildProfileField("Name", "ishowspeed"),
            _buildProfileField("Username", "ishowspeed"),
            _buildProfileField("Website", "Website", isPlaceholder: true),
            _buildProfileField("Bio", "Bio", isPlaceholder: true),

            const SizedBox(height: 20),
            
           
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Switch to Professional Account",
                style: TextStyle(color: Colors.blue[700], fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            
            const SizedBox(height: 20),

           
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Private Information",
                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            
            const SizedBox(height: 10),

            _buildProfileField("Email", "ishowspeed@gmail.com"),
            _buildProfileField("Phone", "+62 123 444 5555"),
            _buildProfileField("Gender", "Male"),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value, {bool isPlaceholder = false, int maxLines = 1}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              SizedBox(
                width: 100,
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              
              Expanded(
                child: Text(
                  value,
                  maxLines: maxLines,
                  style: TextStyle(
                    color: isPlaceholder ? Colors.grey[400] : Colors.black, 
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: Color(0xFFEEEEEE)), 
      ],
    );
  }
}