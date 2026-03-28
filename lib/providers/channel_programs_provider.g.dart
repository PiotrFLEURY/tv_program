// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_programs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(channelPrograms)
final channelProgramsProvider = ChannelProgramsFamily._();

final class ChannelProgramsProvider extends $FunctionalProvider<
        AsyncValue<List<Program>>, List<Program>, FutureOr<List<Program>>>
    with $FutureModifier<List<Program>>, $FutureProvider<List<Program>> {
  ChannelProgramsProvider._(
      {required ChannelProgramsFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'channelProgramsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$channelProgramsHash();

  @override
  String toString() {
    return r'channelProgramsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Program>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Program>> create(Ref ref) {
    final argument = this.argument as String;
    return channelPrograms(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelProgramsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$channelProgramsHash() => r'e72a8a61a1b3f43b48575ff58ba8be9bd5ff05eb';

final class ChannelProgramsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Program>>, String> {
  ChannelProgramsFamily._()
      : super(
          retry: null,
          name: r'channelProgramsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ChannelProgramsProvider call(
    String channelId,
  ) =>
      ChannelProgramsProvider._(argument: channelId, from: this);

  @override
  String toString() => r'channelProgramsProvider';
}
