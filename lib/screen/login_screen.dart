import 'package:flutter/material.dart';
import '../widgets/safe_asset_avatar.dart'; 
import 'main_page.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const instagramBlue = Color(0xFF0095F6);
    // Light mode colors
    const inputFillColor = Color(0xFFFAFAFA); 
    const borderColor = Color(0xFFDBDBDB);

    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: inputFillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
    );

    return Scaffold(
      backgroundColor: Colors.white, 
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/800px-Instagram_logo.svg.png",
                    height: 50,
                    color: Colors.black, // Light mode logo color
                    errorBuilder: (ctx, err, stack) => const Text(
                      "Instagram",
                      style: TextStyle(
                        fontFamily: 'Billabong',
                        fontSize: 45,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const SafeAssetAvatar(
                    assetPath: "assets/profile.jpg",
                    radius: 50,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "ishowspeed",
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                 
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: instagramBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                         
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginFormPage()),
                        );
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Switch accounts",
                    style: TextStyle(
                      color: instagramBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 100),
                  const Text(
                    "Don't have an account? Sign up.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginFormPage extends StatelessWidget {
  const LoginFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    const instagramBlue = Color(0xFF0095F6);
    const inputFillColor = Color(0xFFFAFAFA);
    const borderColor = Color(0xFFDBDBDB);

    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: inputFillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/800px-Instagram_logo.svg.png",
                    height: 60,
                    color: Colors.black,
                    errorBuilder: (ctx, err, stack) => const Text("Instagram", style: TextStyle(fontFamily: 'Billabong', fontSize: 50, color: Colors.black)),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: inputDecoration.copyWith(hintText: 'Username'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    decoration: inputDecoration.copyWith(hintText: 'Password'),
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text("Forgot password?", style: TextStyle(color: instagramBlue, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: instagramBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const MainPage()),
                          (route) => false,
                        );
                      },
                      child: const Text("Log in", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook, color: instagramBlue),
                      SizedBox(width: 8),
                      Text("Log in with Facebook", style: TextStyle(color: instagramBlue, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text("OR", style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 40),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(text: "Don't have an account? "),
                        TextSpan(text: "Sign up.", style: TextStyle(color: instagramBlue, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  const Text("Instagram from Facebook", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}