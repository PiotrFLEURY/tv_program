// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tonight_program_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tonightProgram)
const tonightProgramProvider = TonightProgramFamily._();

final class TonightProgramProvider extends $FunctionalProvider<
        AsyncValue<Program?>, Program?, FutureOr<Program?>>
    with $FutureModifier<Program?>, $FutureProvider<Program?> {
  const TonightProgramProvider._(
      {required TonightProgramFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'tonightProgramProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tonightProgramHash();

  @override
  String toString() {
    return r'tonightProgramProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Program?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Program?> create(Ref ref) {
    final argument = this.argument as String;
    return tonightProgram(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TonightProgramProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tonightProgramHash() => r'a33f8e6b5653fb02671e33b59ac3fc2a7d852c35';

final class TonightProgramFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Program?>, String> {
  const TonightProgramFamily._()
      : super(
          retry: null,
          name: r'tonightProgramProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TonightProgramProvider call(
    String channelId,
  ) =>
      TonightProgramProvider._(argument: channelId, from: this);

  @override
  String toString() => r'tonightProgramProvider';
}
