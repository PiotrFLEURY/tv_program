// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_tonight_program_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RandomTonightProgram)
const randomTonightProgramProvider = RandomTonightProgramProvider._();

final class RandomTonightProgramProvider
    extends $AsyncNotifierProvider<RandomTonightProgram, Program?> {
  const RandomTonightProgramProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'randomTonightProgramProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$randomTonightProgramHash();

  @$internal
  @override
  RandomTonightProgram create() => RandomTonightProgram();
}

String _$randomTonightProgramHash() =>
    r'1363dfeae7baa2e65fdff88e2eea54f3d2b67b83';

abstract class _$RandomTonightProgram extends $AsyncNotifier<Program?> {
  FutureOr<Program?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Program?>, Program?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<Program?>, Program?>,
        AsyncValue<Program?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
