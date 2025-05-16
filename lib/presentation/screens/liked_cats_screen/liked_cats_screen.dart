import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpartner/core/services/likes_service.dart';
import 'package:pawpartner/data/models/liked_cat_dto.dart';
import 'package:pawpartner/di/service_locator.dart';
import 'package:pawpartner/presentation/cubit/liked_cats_cubit.dart';
import 'package:pawpartner/presentation/screens/liked_cats_screen/widgets/breed_filter_dropdown.dart';
import 'package:pawpartner/presentation/screens/liked_cats_screen/widgets/liked_cat_tile.dart';

class LikedCatsScreen extends StatelessWidget {
  const LikedCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LikedCatsCubit(getIt<LikesService>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Liked Cats',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.brown[100],
          actions: const [BreedFilterDropdown()],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<LikedCatsCubit, List<LikedCat>>(
            builder: (context, cats) {
              if (cats.isEmpty) {
                return Center(
                  child: Text(
                    'No liked cats yet',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.brown[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cats.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: LikedCatTile(cat: cats[i]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}