import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flutter/material.dart';
import 'package:tv_program/views/pages/v2/widgets/search_bar.dart';

@widgetbook.UseCase(name: 'Default', type: TvProgSearchBar)
Widget buildSearchBarUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: TvProgSearchBar(
        hint: context.knobs.string(
          label: 'Hint Text',
          initialValue: 'Search...',
        ),
      ),
    ),
  );
}
