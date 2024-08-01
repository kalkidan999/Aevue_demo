import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app.dart';
import 'network_image_with_loader.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.productDetail,
    this.press,
    this.style,
  });
  final Product productDetail;
  final VoidCallback? press;

  final ButtonStyle? style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProducts = ref.watch(favoritesNotifierProvider);
    final deviceSize = MediaQuery.of(context).size;
    return Card(
        child: Stack(children: [
      if (productDetail.discountPercentage != 0.0)
        Positioned(
          right: defaultPadding / 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            height: 12,
            decoration: const BoxDecoration(
              color: error,
              borderRadius:
                  BorderRadius.all(Radius.circular(defaultBorderRadius)),
            ),
            child: Text(
              "${productDetail.discountPercentage}% off",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ListTile(
        onTap: () {
          if (favoriteProducts.contains(productDetail)) {
            ref
                .read(favoritesNotifierProvider.notifier)
                .removeProduct(productDetail);
          } else {
            Dialogs.showInfoDialog(context, "Added to favorites", "success");
            ref
                .read(favoritesNotifierProvider.notifier)
                .addProduct(productDetail);
          }
        },
        isThreeLine: true,
        leading: productDetail.images.isEmpty
            ? const SizedBox.shrink()
            : AspectRatio(
                aspectRatio: 0.7,
                child: NetworkImageWithLoader(
                    fit: BoxFit.contain,
                    productDetail.images.first,
                    radius: defaultBorderRadius)),
        title: Text(productDetail.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall!),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productDetail.brand.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!),
            Text(
              productDetail.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 10),
            ),
            Text(
              "${productDetail.price} ETB",
              style: const TextStyle(
                color: Color(0xFF31B0D8),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: AspectRatio(
            aspectRatio: 0.4,
            child: Padding(
              padding: EdgeInsets.only(top: deviceSize.height * 0.06),
              child: Icon(
                  favoriteProducts.contains(productDetail)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: success),
            )),
      ),
    ]));
  }
}
