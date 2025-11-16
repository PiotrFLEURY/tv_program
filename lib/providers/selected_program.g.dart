// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_program.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedProgram)
const selectedProgramProvider = SelectedProgramProvider._();

final class SelectedProgramProvider
    extends $NotifierProvider<SelectedProgram, SelectedProgramEnum> {
  const SelectedProgramProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedProgramProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedProgramHash();

  @$internal
  @override
  SelectedProgram create() => SelectedProgram();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SelectedProgramEnum value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SelectedProgramEnum>(value),
    );
  }
}

String _$selectedProgramHash() => r'934449da222dcea49b11208a3f7482b3395675e2';

abstract class _$SelectedProgram extends $Notifier<SelectedProgramEnum> {
  SelectedProgramEnum build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SelectedProgramEnum, SelectedProgramEnum>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<SelectedProgramEnum, SelectedProgramEnum>,
        SelectedProgramEnum,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
