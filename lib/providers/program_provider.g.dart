// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$programHash() => r'919fba2ab693b04d69f0a9193d40bd5fc43d7040';

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

/// See also [program].
@ProviderFor(program)
const programProvider = ProgramFamily();

/// See also [program].
class ProgramFamily extends Family<AsyncValue<XmlTv>> {
  /// See also [program].
  const ProgramFamily();

  /// See also [program].
  ProgramProvider call(
    String selectedProgram,
  ) {
    return ProgramProvider(
      selectedProgram,
    );
  }

  @override
  ProgramProvider getProviderOverride(
    covariant ProgramProvider provider,
  ) {
    return call(
      provider.selectedProgram,
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
  String? get name => r'programProvider';
}

/// See also [program].
class ProgramProvider extends AutoDisposeFutureProvider<XmlTv> {
  /// See also [program].
  ProgramProvider(
    String selectedProgram,
  ) : this._internal(
          (ref) => program(
            ref as ProgramRef,
            selectedProgram,
          ),
          from: programProvider,
          name: r'programProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$programHash,
          dependencies: ProgramFamily._dependencies,
          allTransitiveDependencies: ProgramFamily._allTransitiveDependencies,
          selectedProgram: selectedProgram,
        );

  ProgramProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.selectedProgram,
  }) : super.internal();

  final String selectedProgram;

  @override
  Override overrideWith(
    FutureOr<XmlTv> Function(ProgramRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProgramProvider._internal(
        (ref) => create(ref as ProgramRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        selectedProgram: selectedProgram,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<XmlTv> createElement() {
    return _ProgramProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProgramProvider && other.selectedProgram == selectedProgram;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, selectedProgram.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProgramRef on AutoDisposeFutureProviderRef<XmlTv> {
  /// The parameter `selectedProgram` of this provider.
  String get selectedProgram;
}

class _ProgramProviderElement extends AutoDisposeFutureProviderElement<XmlTv>
    with ProgramRef {
  _ProgramProviderElement(super.provider);

  @override
  String get selectedProgram => (origin as ProgramProvider).selectedProgram;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
