// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_program_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentProgramHash() => r'f7edefa6554958ee189355fbc937f21cb9ea0d01';

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

/// See also [currentProgram].
@ProviderFor(currentProgram)
const currentProgramProvider = CurrentProgramFamily();

/// See also [currentProgram].
class CurrentProgramFamily extends Family<AsyncValue<Program>> {
  /// See also [currentProgram].
  const CurrentProgramFamily();

  /// See also [currentProgram].
  CurrentProgramProvider call(
    String channelId,
  ) {
    return CurrentProgramProvider(
      channelId,
    );
  }

  @override
  CurrentProgramProvider getProviderOverride(
    covariant CurrentProgramProvider provider,
  ) {
    return call(
      provider.channelId,
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
  String? get name => r'currentProgramProvider';
}

/// See also [currentProgram].
class CurrentProgramProvider extends AutoDisposeFutureProvider<Program> {
  /// See also [currentProgram].
  CurrentProgramProvider(
    String channelId,
  ) : this._internal(
          (ref) => currentProgram(
            ref as CurrentProgramRef,
            channelId,
          ),
          from: currentProgramProvider,
          name: r'currentProgramProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentProgramHash,
          dependencies: CurrentProgramFamily._dependencies,
          allTransitiveDependencies:
              CurrentProgramFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  CurrentProgramProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channelId,
  }) : super.internal();

  final String channelId;

  @override
  Override overrideWith(
    FutureOr<Program> Function(CurrentProgramRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrentProgramProvider._internal(
        (ref) => create(ref as CurrentProgramRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        channelId: channelId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Program> createElement() {
    return _CurrentProgramProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentProgramProvider && other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrentProgramRef on AutoDisposeFutureProviderRef<Program> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _CurrentProgramProviderElement
    extends AutoDisposeFutureProviderElement<Program> with CurrentProgramRef {
  _CurrentProgramProviderElement(super.provider);

  @override
  String get channelId => (origin as CurrentProgramProvider).channelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
