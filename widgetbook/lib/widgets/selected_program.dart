import 'package:flutter/material.dart';
import 'package:tv_program/views/pages/v2/widgets/selected_program_selector.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SelectedProgramSelector)
Widget buildProgramItemUseCase(BuildContext context) {
  return Scaffold(body: Center(child: SelectedProgramSelector()));
}
