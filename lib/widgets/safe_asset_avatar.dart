import 'package:flutter/material.dart';

class SafeAssetAvatar extends StatelessWidget {
  final String assetPath;
  final double radius;

  const SafeAssetAvatar({
    super.key,
    required this.assetPath,
    this.radius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: Colors.grey[200], 
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.person,
            color: Colors.grey,
            size: radius,
          );
        },
      ),
    );
  }
}