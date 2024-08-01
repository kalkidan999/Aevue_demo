// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoritesTotalHash() => r'58e95f3d93ea2325291955991685c9e9d7eb1c9f';

/// See also [favoritesTotal].
@ProviderFor(favoritesTotal)
final favoritesTotalProvider = AutoDisposeProvider<double>.internal(
  favoritesTotal,
  name: r'favoritesTotalProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoritesTotalRef = AutoDisposeProviderRef<double>;
String _$favoritesNotifierHash() => r'8a4295237704854a3994f45184438f88161ac2ba';

/// See also [FavoritesNotifier].
@ProviderFor(FavoritesNotifier)
final favoritesNotifierProvider =
    AutoDisposeNotifierProvider<FavoritesNotifier, List<Product>>.internal(
  FavoritesNotifier.new,
  name: r'favoritesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoritesNotifier = AutoDisposeNotifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
