// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stops_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stopsNotifierHash() => r'b7a05e873394e6157ef2b0c1771bd1fec3a75b34';

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

abstract class _$StopsNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Stops>> {
  late final BuildContext context;

  FutureOr<List<Stops>> build(
    BuildContext context,
  );
}

/// See also [StopsNotifier].
@ProviderFor(StopsNotifier)
const stopsNotifierProvider = StopsNotifierFamily();

/// See also [StopsNotifier].
class StopsNotifierFamily extends Family<AsyncValue<List<Stops>>> {
  /// See also [StopsNotifier].
  const StopsNotifierFamily();

  /// See also [StopsNotifier].
  StopsNotifierProvider call(
    BuildContext context,
  ) {
    return StopsNotifierProvider(
      context,
    );
  }

  @override
  StopsNotifierProvider getProviderOverride(
    covariant StopsNotifierProvider provider,
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
  String? get name => r'stopsNotifierProvider';
}

/// See also [StopsNotifier].
class StopsNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<StopsNotifier, List<Stops>> {
  /// See also [StopsNotifier].
  StopsNotifierProvider(
    this.context,
  ) : super.internal(
          () => StopsNotifier()..context = context,
          from: stopsNotifierProvider,
          name: r'stopsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stopsNotifierHash,
          dependencies: StopsNotifierFamily._dependencies,
          allTransitiveDependencies:
              StopsNotifierFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is StopsNotifierProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<Stops>> runNotifierBuild(
    covariant StopsNotifier notifier,
  ) {
    return notifier.build(
      context,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
