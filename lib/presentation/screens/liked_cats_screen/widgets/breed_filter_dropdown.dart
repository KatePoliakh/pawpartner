import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpartner/core/services/likes_service.dart';
import 'package:pawpartner/data/models/liked_cat_dto.dart';
import 'package:pawpartner/di/service_locator.dart';
import 'package:pawpartner/presentation/cubit/liked_cats_cubit.dart';

class BreedFilterDropdown extends StatelessWidget {
  const BreedFilterDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final breeds = getIt<LikesService>().availableBreeds;

    return BlocBuilder<LikedCatsCubit, List<LikedCat>>(
      builder: (context, cats) {
        return DropdownButton<String>(
          value: context.read<LikedCatsCubit>().selectedBreed,
          items: [
            const DropdownMenuItem(value: null, child: Text('All breeds')),
            ...breeds.map((b) => DropdownMenuItem(value: b, child: Text(b))),
          ],
          onChanged:
              (value) => context.read<LikedCatsCubit>().filterByBreed(value),
        );
      },
    );
  }
}
