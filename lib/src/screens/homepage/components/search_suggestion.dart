import 'package:flutter/material.dart';

import '../../../../app.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({
    super.key,
    required this.products,
    required this.press,
  });
  final List<Product> products;
  final ValueChanged<int> press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        products.length,
        (index) => SearchSuggestionText(
          text: products[index].title,
          press: () => press(index),
        ),
      ),
    );
  }
}

class SearchSuggestionText extends StatelessWidget {
  const SearchSuggestionText({
    super.key,
    required this.text,
    this.press,
    this.onTapClose,
    this.isRecentSearch = false,
  });

  final String text;
  final VoidCallback? press, onTapClose;
  final bool isRecentSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          minLeadingWidth: 24,
          horizontalTitleGap: defaultPadding / 2,
          title: Text(text, style: Theme.of(context).textTheme.bodySmall!),
          trailing: IconButton(
            iconSize: 16,
            icon: Icon(Icons.close,
                size: 16,
                color: Theme.of(context).iconTheme.color!.withOpacity(0.5)),
            onPressed: onTapClose,
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
