// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_program_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentProgram)
const currentProgramProvider = CurrentProgramFamily._();

final class CurrentProgramProvider
    extends $FunctionalProvider<AsyncValue<Program>, Program, FutureOr<Program>>
    with $FutureModifier<Program>, $FutureProvider<Program> {
  const CurrentProgramProvider._(
      {required CurrentProgramFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'currentProgramProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentProgramHash();

  @override
  String toString() {
    return r'currentProgramProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Program> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Program> create(Ref ref) {
    final argument = this.argument as String;
    return currentProgram(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentProgramProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$currentProgramHash() => r'f7edefa6554958ee189355fbc937f21cb9ea0d01';

final class CurrentProgramFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Program>, String> {
  const CurrentProgramFamily._()
      : super(
          retry: null,
          name: r'currentProgramProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CurrentProgramProvider call(
    String channelId,
  ) =>
      CurrentProgramProvider._(argument: channelId, from: this);

  @override
  String toString() => r'currentProgramProvider';
}
