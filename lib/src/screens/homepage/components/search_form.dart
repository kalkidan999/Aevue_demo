import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/utils.dart';

class SearchForm extends StatelessWidget {
  const SearchForm(
      {super.key,
      this.formKey,
      this.isEnabled = true,
      this.onSaved,
      this.validator,
      this.onChanged,
      this.onTabFilter,
      this.onFieldSubmitted,
      this.focusNode,
      this.autofocus = false,
      this.showsuffixIcon = false});

  final GlobalKey<FormState>? formKey;
  final bool isEnabled;
  final ValueChanged<String?>? onSaved, onChanged, onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTabFilter;
  final FocusNode? focusNode;
  final bool autofocus, showsuffixIcon;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        autofocus: autofocus,
        focusNode: focusNode,
        enabled: isEnabled,
        onChanged: onChanged,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Search",
          filled: false,
          border: secondaryOutlineInputBorder(context),
          enabledBorder: secondaryOutlineInputBorder(context),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              "assets/icons/Search.svg",
              height: 24,
              color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }
}
