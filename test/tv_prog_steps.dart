import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pickled_cucumber/src/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_program/providers/tv_prog_api_provider.dart';
import 'package:tv_program/views/tv_program.dart';

import 'fixtures/channel_fixture.dart';
import 'fixtures/program_fixture.dart';
import 'tv_prog_app_test.mocks.dart';

@StepDefinition()
class TvProgSteps {
  final mockedApi = MockTvProgApi();

  void setUp() {
    // Initialize any necessary dependencies or state before each test

    when(mockedApi.fetchChannels(any)).thenAnswer((_) async => [aChannel()]);
    when(mockedApi.fetchPrograms(any)).thenAnswer(
      (invocation) async => [
        aProgram(
          invocation.positionalArguments[0],
        ),
      ],
    );
    when(mockedApi.fetchCurrentProgram(any)).thenAnswer(
      (invocation) async => aProgram(
        invocation.positionalArguments[0],
      ),
    );
    when(mockedApi.fetchTonightProgram(any)).thenAnswer(
      (invocation) async => aProgram(
        invocation.positionalArguments[0],
      ),
    );
  }

  @Given('I open Tv Prog')
  Future<void> iOpenTvProg(WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    setUp();
    await initializeDateFormatting('fr_FR', null);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [tvProgApiProvider.overrideWith((ref) => mockedApi)],
        child: TvProgram(
          packageInfo: PackageInfo(
            appName: 'TV Prog',
            packageName: 'fr.piotrfleury.tv_program',
            version: '1.0.0',
            buildNumber: '1',
          ),
        ),
      ),
    );
  }

  @When('I wait for {int} second')
  Future<void> iWaitForXSecond(WidgetTester tester, int seconds) async {
    await tester.pumpAndSettle(Duration(seconds: seconds));
  }

  @When('I show the old interface')
  Future<void> iShowTheOldInterface(WidgetTester tester) async {
    // Implement the logic to show the old interface
    await tester.pumpAndSettle();
    // Open the drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    // Click on "Ancienne interface"
    await tester.tap(find.text('Ancienne interface'));
    await tester.pumpAndSettle();
  }

  @Then('I should see TNT programs')
  Future<void> iShouldSeeTntPrograms(WidgetTester tester) async {
    await tester.pumpAndSettle();
    expect(find.text('TNT'), findsOneWidget);
  }
}
