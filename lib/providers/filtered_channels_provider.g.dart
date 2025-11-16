// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_channels_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredChannels)
const filteredChannelsProvider = FilteredChannelsProvider._();

final class FilteredChannelsProvider extends $FunctionalProvider<
        AsyncValue<List<Channel>>, List<Channel>, FutureOr<List<Channel>>>
    with $FutureModifier<List<Channel>>, $FutureProvider<List<Channel>> {
  const FilteredChannelsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'filteredChannelsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$filteredChannelsHash();

  @$internal
  @override
  $FutureProviderElement<List<Channel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Channel>> create(Ref ref) {
    return filteredChannels(ref);
  }
}

String _$filteredChannelsHash() => r'4acb4f1abcaa4dd47a8c974462dfcc6e00f60097';
