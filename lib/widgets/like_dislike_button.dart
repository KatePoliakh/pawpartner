import 'package:flutter/material.dart';

class LikeDislikeButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const LikeDislikeButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required MaterialColor color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(icon), onPressed: onPressed);
  }
}
