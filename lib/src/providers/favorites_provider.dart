import 'package:aevue_demo/app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_provider.g.dart';

// Generated notifier providers

@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  @override
  List<Product> build() {
    return [];
  }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = [...state, product];
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toList();
    }
  }
}

// Dependent provider

@riverpod
double favoritesTotal(ref) {
  final favoritesProducts = ref.watch(favoritesNotifierProvider);

  double total = 0;

  for (Product product in favoritesProducts) {
    total += product.price;
  }

  return total;
}
