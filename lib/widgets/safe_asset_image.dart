import 'package:flutter/material.dart';

class SafeAssetImage extends StatelessWidget {
  final String assetPath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;
  final Widget? fallbackWidget;

  const SafeAssetImage(
    this.assetPath, {
    super.key,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
    this.fallbackWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      height: height,
      width: width,
      color: color,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return fallbackWidget ??
            SizedBox(
              height: height,
              width: width,
              child: Icon(Icons.image, color: Colors.grey.shade400),
            );
      },
    );
  }
}