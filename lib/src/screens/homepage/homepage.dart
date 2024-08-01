import 'package:aevue_demo/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/search_form.dart';

class Homepage extends ConsumerWidget {
  final ProductsModel productsModel;
  const Homepage({super.key, required this.productsModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(child: Builder(
      builder: (context) {
        return RefreshIndicator(
            onRefresh: () => ref.refresh(productsProvider.future),
            child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverPadding(
                      padding: const EdgeInsets.all(defaultPadding),
                      sliver: SliverToBoxAdapter(
                          child: SearchForm(
                              autofocus: false,
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                              onSaved: (value) {},
                              validator: (value) {
                                return null;
                              },
                              onTabFilter: () {}))),
                  SliverToBoxAdapter(
                      child: AspectRatio(
                    aspectRatio: 0.4,
                    child: ListView.builder(
                      itemCount: productsModel.products.length,
                      itemBuilder: (context, index) {
                        List<Product> products = productsModel.products;
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: ProductCard(
                                productDetail: products[index], press: () {}));
                      },
                    ),
                  )),
                ]));
      },
    ));
  }
}
