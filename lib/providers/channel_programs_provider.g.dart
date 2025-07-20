// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_programs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelProgramsHash() => r'e72a8a61a1b3f43b48575ff58ba8be9bd5ff05eb';

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

/// See also [channelPrograms].
@ProviderFor(channelPrograms)
const channelProgramsProvider = ChannelProgramsFamily();

/// See also [channelPrograms].
class ChannelProgramsFamily extends Family<AsyncValue<List<Program>>> {
  /// See also [channelPrograms].
  const ChannelProgramsFamily();

  /// See also [channelPrograms].
  ChannelProgramsProvider call(
    String channelId,
  ) {
    return ChannelProgramsProvider(
      channelId,
    );
  }

  @override
  ChannelProgramsProvider getProviderOverride(
    covariant ChannelProgramsProvider provider,
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
  String? get name => r'channelProgramsProvider';
}

/// See also [channelPrograms].
class ChannelProgramsProvider extends AutoDisposeFutureProvider<List<Program>> {
  /// See also [channelPrograms].
  ChannelProgramsProvider(
    String channelId,
  ) : this._internal(
          (ref) => channelPrograms(
            ref as ChannelProgramsRef,
            channelId,
          ),
          from: channelProgramsProvider,
          name: r'channelProgramsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelProgramsHash,
          dependencies: ChannelProgramsFamily._dependencies,
          allTransitiveDependencies:
              ChannelProgramsFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  ChannelProgramsProvider._internal(
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
    FutureOr<List<Program>> Function(ChannelProgramsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChannelProgramsProvider._internal(
        (ref) => create(ref as ChannelProgramsRef),
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
  AutoDisposeFutureProviderElement<List<Program>> createElement() {
    return _ChannelProgramsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelProgramsProvider && other.channelId == channelId;
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
mixin ChannelProgramsRef on AutoDisposeFutureProviderRef<List<Program>> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _ChannelProgramsProviderElement
    extends AutoDisposeFutureProviderElement<List<Program>>
    with ChannelProgramsRef {
  _ChannelProgramsProviderElement(super.provider);

  @override
  String get channelId => (origin as ChannelProgramsProvider).channelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
