import 'package:flutter/foundation.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

const appName = "Aevue Demo";
const poweredBy = "Powered by Aevue";
const double defaultPadding = 16.0;
const Duration defaultDuration = Duration(milliseconds: 300);

printDebug(dynamic message) {
  //if (DEBUG) log(message.toString());
  try {
    if (!kReleaseMode) log(message.toString());
  } catch (_) {}
}

const bgLight = Color.fromARGB(255, 237, 250, 238);

const Color error = Color(0xBBE64A19);
const Color warning = Color(0xBBE39219);
const Color success = Color(0xBB689F38);

const Color accentColor = Color(0XFF0A6EB4);
const Color primaryColor = Color(0XFF085387);

OutlineInputBorder secondaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius)),
    borderSide: BorderSide(
      color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.15),
    ),
  );
}

const double defaultBorderRadius = 12.0;

double discountCalculator(double originalPrice, double discountedPercentage) {
  double discountedPrice = (discountedPercentage / 100) * originalPrice;
  return originalPrice - discountedPrice;
}

String capitalize(String string) {
  return string.isEmpty
      ? ""
      : "${string[0].toUpperCase()}${string.substring(1).toLowerCase()}";
}

SizedBox sizedHeight(double height) => SizedBox(height: height);

SizedBox sizedWidth(double width) => SizedBox(width: width);

class ImagesAsset {
  static String aevue = 'assets/images/aevue.jpeg';
  static String search = "assets/icons/Search.svg";

  CachedNetworkImageProvider cachedNetworkImageProvider(String img) {
    return CachedNetworkImageProvider(img);
  }

  CachedNetworkImage cachedNetworkImage(String image) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.contain,
            colorFilter: const ColorFilter.mode(
              Colors.transparent,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
      placeholder: (context, url) =>
          const CircularProgressIndicator(strokeWidth: 2.0),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
