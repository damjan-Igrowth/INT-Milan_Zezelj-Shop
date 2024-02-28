// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productHash() => r'164d27a127027c0b4b5dac634a6a6d394bd3e146';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Product
    extends BuildlessAutoDisposeAsyncNotifier<TBProductModel> {
  late final int id;

  FutureOr<TBProductModel> build(
    int id,
  );
}

/// See also [Product].
@ProviderFor(Product)
const productProvider = ProductFamily();

/// See also [Product].
class ProductFamily extends Family<AsyncValue<TBProductModel>> {
  /// See also [Product].
  const ProductFamily();

  /// See also [Product].
  ProductProvider call(
    int id,
  ) {
    return ProductProvider(
      id,
    );
  }

  @override
  ProductProvider getProviderOverride(
    covariant ProductProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productProvider';
}

/// See also [Product].
class ProductProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Product, TBProductModel> {
  /// See also [Product].
  ProductProvider(
    int id,
  ) : this._internal(
          () => Product()..id = id,
          from: productProvider,
          name: r'productProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productHash,
          dependencies: ProductFamily._dependencies,
          allTransitiveDependencies: ProductFamily._allTransitiveDependencies,
          id: id,
        );

  ProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<TBProductModel> runNotifierBuild(
    covariant Product notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(Product Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Product, TBProductModel>
      createElement() {
    return _ProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductRef on AutoDisposeAsyncNotifierProviderRef<TBProductModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProductProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Product, TBProductModel>
    with ProductRef {
  _ProductProviderElement(super.provider);

  @override
  int get id => (origin as ProductProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
