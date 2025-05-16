import 'package:flutter/material.dart';
import 'package:pawpartner/presentation/screens/home_screen/widgets/like_dislike_button.dart';

class ActionButtonsPanel extends StatelessWidget {
  final VoidCallback onLike;
  final VoidCallback onDislike;

  const ActionButtonsPanel({
    super.key,
    required this.onLike,
    required this.onDislike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: Colors.brown[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LikeDislikeButton(
            icon: Icons.thumb_down,
            color: Colors.red,
            onPressed: onDislike,
          ),
          LikeDislikeButton(
            icon: Icons.thumb_up,
            color: Colors.green,
            onPressed: onLike,
          ),
        ],
      ),
    );
  }
}
