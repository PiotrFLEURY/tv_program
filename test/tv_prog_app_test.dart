import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tv_program/api/tv_prog_api.dart';
import 'package:tv_program/providers/tv_prog_api_provider.dart';
import 'package:tv_program/views/pages/v2/widgets/program_item.dart';
import 'package:tv_program/views/tv_program.dart';

import 'fixtures/channel_fixture.dart';
import 'fixtures/program_fixture.dart';
import 'services/service_test.mocks.dart';

@GenerateMocks([TvProgApi])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR', null);
  final mockedApi = MockTvProgApi();
  setUp(() {
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
  });
  testWidgets('TV Program App', (WidgetTester tester) async {
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
    expect(find.text('TV Prog'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(ProgramItem), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('TNT'), findsOneWidget);
  });
}
