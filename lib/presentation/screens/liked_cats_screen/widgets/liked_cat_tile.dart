// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pawpartner/core/services/likes_service.dart';
import 'package:pawpartner/data/models/liked_cat_dto.dart';
import 'package:pawpartner/di/service_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LikedCatTile extends StatelessWidget {
  final LikedCat cat;

  const LikedCatTile({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown[100]?.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: cat.cat.url,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              placeholder:
                  (_, __) => Container(
                    color: Colors.brown[200],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
            ),
          ),
          title: Text(
            cat.cat.breedName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            'Liked: ${_formatDate(cat.likedDate)}',
            style: TextStyle(color: Colors.brown[800], fontSize: 14),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.brown[800]),
            onPressed: () => getIt<LikesService>().removeLikedCat(cat.cat.id),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.'
        '${date.month.toString().padLeft(2, '0')}.'
        '${date.year}';
  }
}
