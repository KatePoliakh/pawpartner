import 'package:flutter/material.dart';
import 'package:pawpartner/presentation/screens/liked_cats_screen/liked_cats_screen.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int likesCount;

  const HomeScreenAppBar({super.key, required this.likesCount});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'PawPartner',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.brown[100],
      actions: [_buildLikesCounter(context)],
    );
  }

  Widget _buildLikesCounter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LikedCatsScreen()),
                ),
          ),
          const SizedBox(width: 4),
          Text(
            '$likesCount',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
