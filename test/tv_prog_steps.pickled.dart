// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: TestCodeBuilder
// **************************************************************************

import 'package:flutter_test/flutter_test.dart';

import 'tv_prog_steps.dart';

runFeatures() {
  final steps = TvProgSteps();
  group('Open Tv Prog', () {
    testWidgets('Open the App', (WidgetTester widgetTester) async {
      await steps.iOpenTvProg(widgetTester);
      await steps.iWaitForXSecond(widgetTester, 5);
      await steps.iShouldSeeTntPrograms(widgetTester);
    });
  });
  group('Open old interface', () {
    testWidgets('Old interface', (WidgetTester widgetTester) async {
      await steps.iOpenTvProg(widgetTester);
      await steps.iShowTheOldInterface(widgetTester);
      await steps.iShouldSeeTntPrograms(widgetTester);
    });
  });
}
