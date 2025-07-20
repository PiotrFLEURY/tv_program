import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/models/selected_program.dart';

part 'selected_program.g.dart';

@riverpod
class SelectedProgram extends _$SelectedProgram {
  @override
  SelectedProgramEnum build() {
    return SelectedProgramEnum.tnt;
  }

  void select(SelectedProgramEnum program) {
    state = program;
  }
}
