import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app.dart';

class Favourites extends ConsumerStatefulWidget {
  const Favourites({super.key});

  @override
  ConsumerState<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends ConsumerState<Favourites> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = ref.watch(favoritesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: favoriteProducts.isEmpty
          ? Center(
              child: Text("No products here!",
                  style: Theme.of(context).textTheme.bodyMedium),
            )
          : Column(
              children: favoriteProducts.map((product) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2),
                    child: ProductCard(productDetail: product, press: () {}));
              }).toList(),
            ),
    );
  }
}
