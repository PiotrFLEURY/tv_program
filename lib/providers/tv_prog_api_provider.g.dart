// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_prog_api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tvProgApi)
final tvProgApiProvider = TvProgApiProvider._();

final class TvProgApiProvider
    extends $FunctionalProvider<TvProgApi, TvProgApi, TvProgApi>
    with $Provider<TvProgApi> {
  TvProgApiProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tvProgApiProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tvProgApiHash();

  @$internal
  @override
  $ProviderElement<TvProgApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TvProgApi create(Ref ref) {
    return tvProgApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TvProgApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TvProgApi>(value),
    );
  }
}

String _$tvProgApiHash() => r'dfd71296e4bd66b618af3ea6ce1234b939d2abbe';
