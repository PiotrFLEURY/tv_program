// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tvService)
final tvServiceProvider = TvServiceProvider._();

final class TvServiceProvider
    extends $FunctionalProvider<TvService, TvService, TvService>
    with $Provider<TvService> {
  TvServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tvServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tvServiceHash();

  @$internal
  @override
  $ProviderElement<TvService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TvService create(Ref ref) {
    return tvService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TvService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TvService>(value),
    );
  }
}

String _$tvServiceHash() => r'6d5ba0f1da0c19f76f3d1d6e6d1c5d79785080dc';
