// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polyline_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$polylineProviderHash() => r'187862d13954fba7b9d8fb4e201c231f98a3ccce';

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

abstract class _$PolylineProvider
    extends BuildlessAutoDisposeAsyncNotifier<Set<Polyline>> {
  late final BuildContext context;

  FutureOr<Set<Polyline>> build(
    BuildContext context,
  );
}

/// See also [PolylineProvider].
@ProviderFor(PolylineProvider)
const polylineProviderProvider = PolylineProviderFamily();

/// See also [PolylineProvider].
class PolylineProviderFamily extends Family<AsyncValue<Set<Polyline>>> {
  /// See also [PolylineProvider].
  const PolylineProviderFamily();

  /// See also [PolylineProvider].
  PolylineProviderProvider call(
    BuildContext context,
  ) {
    return PolylineProviderProvider(
      context,
    );
  }

  @override
  PolylineProviderProvider getProviderOverride(
    covariant PolylineProviderProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'polylineProviderProvider';
}

/// See also [PolylineProvider].
class PolylineProviderProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PolylineProvider, Set<Polyline>> {
  /// See also [PolylineProvider].
  PolylineProviderProvider(
    this.context,
  ) : super.internal(
          () => PolylineProvider()..context = context,
          from: polylineProviderProvider,
          name: r'polylineProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$polylineProviderHash,
          dependencies: PolylineProviderFamily._dependencies,
          allTransitiveDependencies:
              PolylineProviderFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is PolylineProviderProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Set<Polyline>> runNotifierBuild(
    covariant PolylineProvider notifier,
  ) {
    return notifier.build(
      context,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
