import 'package:flutter/material.dart';

class LikeDislikeButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final MaterialColor color;

  const LikeDislikeButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(size: 40, icon), onPressed: onPressed, color: color);
  }
}
