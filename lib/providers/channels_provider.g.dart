// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channels_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(channels)
const channelsProvider = ChannelsProvider._();

final class ChannelsProvider extends $FunctionalProvider<
        AsyncValue<List<Channel>>, List<Channel>, FutureOr<List<Channel>>>
    with $FutureModifier<List<Channel>>, $FutureProvider<List<Channel>> {
  const ChannelsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'channelsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$channelsHash();

  @$internal
  @override
  $FutureProviderElement<List<Channel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Channel>> create(Ref ref) {
    return channels(ref);
  }
}

String _$channelsHash() => r'6c07811f570874a8da62948f3f45977143f71403';
