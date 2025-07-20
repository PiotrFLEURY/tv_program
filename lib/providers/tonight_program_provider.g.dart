// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tonight_program_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tonightProgramHash() => r'a33f8e6b5653fb02671e33b59ac3fc2a7d852c35';

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

/// See also [tonightProgram].
@ProviderFor(tonightProgram)
const tonightProgramProvider = TonightProgramFamily();

/// See also [tonightProgram].
class TonightProgramFamily extends Family<AsyncValue<Program?>> {
  /// See also [tonightProgram].
  const TonightProgramFamily();

  /// See also [tonightProgram].
  TonightProgramProvider call(
    String channelId,
  ) {
    return TonightProgramProvider(
      channelId,
    );
  }

  @override
  TonightProgramProvider getProviderOverride(
    covariant TonightProgramProvider provider,
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
  String? get name => r'tonightProgramProvider';
}

/// See also [tonightProgram].
class TonightProgramProvider extends AutoDisposeFutureProvider<Program?> {
  /// See also [tonightProgram].
  TonightProgramProvider(
    String channelId,
  ) : this._internal(
          (ref) => tonightProgram(
            ref as TonightProgramRef,
            channelId,
          ),
          from: tonightProgramProvider,
          name: r'tonightProgramProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tonightProgramHash,
          dependencies: TonightProgramFamily._dependencies,
          allTransitiveDependencies:
              TonightProgramFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  TonightProgramProvider._internal(
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
    FutureOr<Program?> Function(TonightProgramRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TonightProgramProvider._internal(
        (ref) => create(ref as TonightProgramRef),
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
  AutoDisposeFutureProviderElement<Program?> createElement() {
    return _TonightProgramProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TonightProgramProvider && other.channelId == channelId;
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
mixin TonightProgramRef on AutoDisposeFutureProviderRef<Program?> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _TonightProgramProviderElement
    extends AutoDisposeFutureProviderElement<Program?> with TonightProgramRef {
  _TonightProgramProviderElement(super.provider);

  @override
  String get channelId => (origin as TonightProgramProvider).channelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
