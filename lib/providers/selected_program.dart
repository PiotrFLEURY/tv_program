import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/services/service.dart';

part 'selected_program.g.dart';

@riverpod
class SelectedProgram extends _$SelectedProgram {
  @override
  String build() {
    return TvService.tvTnt;
  }

  void select(String program) {
    state = program;
  }
}
