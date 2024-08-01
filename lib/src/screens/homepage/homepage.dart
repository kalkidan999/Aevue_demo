import 'package:aevue_demo/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/search_form.dart';
import 'components/search_suggestion.dart';

class Homepage extends ConsumerStatefulWidget {
  final ProductsModel productsModel;
  const Homepage({super.key, required this.productsModel});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  bool _isShowSuggestions = false;

  List<Product> productsonSearch = [];

  @override
  Widget build(BuildContext context) {
    final allProducts = ref.watch(productsProvider);
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(child: Builder(
      builder: (context) {
        return RefreshIndicator(
            onRefresh: () => ref.refresh(productsProvider.future),
            child: ListView(children: [
              Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: SearchForm(
                      autofocus: false,
                      onChanged: (value) {
                        List<Product> products =
                            allProducts.value?.products ?? [];
                        if ((value != null && value != '') &&
                            products.isNotEmpty) {
                          setState(() {
                            productsonSearch = products
                                .where(
                                  (u) => (u.title.toLowerCase().contains(
                                        value.toLowerCase(),
                                      )),
                                )
                                .toList();
                            _isShowSuggestions = true;
                          });
                        } else {
                          setState(() {
                            _isShowSuggestions = false;
                          });
                        }
                      },
                      onFieldSubmitted: (value) {},
                      onSaved: (value) {},
                      validator: (value) {
                        return null;
                      },
                      onTabFilter: () {})),
              if (_isShowSuggestions)
                SearchSuggestions(
                    products: productsonSearch,
                    press: (int value) {
                      if (mounted) {
                        FocusScope.of(context).unfocus();
                      }
                    }),
              SizedBox(
                height: deviceSize.height * 0.76,
                child: Scrollbar(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.productsModel.products.length,
                    itemBuilder: (context, index) {
                      List<Product> products = widget.productsModel.products;
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          child: ProductCard(
                              productDetail: products[index], press: () {}));
                    },
                  ),
                ),
              ),
            ]));
      },
    ));
  }
}
