import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_program/api/tv_prog_api.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/models/program.dart';
import 'package:tv_program/services/service.dart';

import '../fixtures/channel_fixture.dart';
import '../fixtures/program_fixture.dart';
import 'service_test.mocks.dart';

@GenerateMocks([TvProgApi])
void main() {
  final TvProgApi api = MockTvProgApi();
  final TvProgCache cache = TvProgCache();
  final TvService service = TvService(api, cache);

  setUp(() {
    // Reset mocks before each test
    resetMockitoState();
    // Reset the cache before each test
    cache.clearCache();
  });

  group('Get channels', () {
    test('should call API when no cache', () async {
      // Given
      final package = 'TNT';
      final channels = [
        aChannel(),
      ];
      when(api.fetchChannels(package)).thenAnswer((_) async => channels);

      // When
      final result = await service.getChannels(package);

      // Then
      expect(result, isA<List<Channel>>());
      expect(result, channels);
      verify(api.fetchChannels(package)).called(1);
      verifyNoMoreInteractions(api);
    });
    test('should return cached channels', () async {
      // Given
      final package = 'TNT';
      final channels = [
        aChannel(),
      ];
      cache.addChannels(package, channels);

      // When
      final result = await service.getChannels(package);

      // Then
      expect(result, isA<List<Channel>>());
      expect(result, channels);
      verifyNoMoreInteractions(api);
    });
  });
  group('Get programs', () {
    test('should call API when no cache', () async {
      // Given
      final channelId = '1';
      final programs = [
        aProgram(channelId),
      ];
      when(api.fetchPrograms(channelId)).thenAnswer((_) async => programs);

      // When
      final result = await service.getPrograms(channelId);

      // Then
      expect(result, isA<List<Program>>());
      expect(result, programs);
      verify(api.fetchPrograms(channelId)).called(1);
      verifyNoMoreInteractions(api);
    });

    test('should return cached programs', () async {
      // Given
      final channelId = '1';
      final programs = [
        aProgram(channelId),
      ];
      cache.addPrograms(channelId, programs);

      // When
      final result = await service.getPrograms(channelId);

      // Then
      expect(result, isA<List<Program>>());
      expect(result, programs);
      verifyNoMoreInteractions(api);
    });
  });
  group('Get current program', () {
    test('should call API when no cache', () async {
      // Given
      final channelId = '1';
      final currentProgram = aProgram(channelId);
      when(api.fetchCurrentProgram(channelId))
          .thenAnswer((_) async => currentProgram);

      // When
      final result = await service.getCurrentProgram(channelId);

      // Then
      expect(result, isA<Program>());
      expect(result, currentProgram);
      verify(api.fetchCurrentProgram(channelId)).called(1);
      verifyNoMoreInteractions(api);
    });

    test('should return cached current program', () async {
      // Given
      final channelId = '1';
      final currentProgram = aProgram(channelId);
      cache.addCurrentProgram(channelId, currentProgram);

      // When
      final result = await service.getCurrentProgram(channelId);

      // Then
      expect(result, isA<Program>());
      expect(result, currentProgram);
      verifyNoMoreInteractions(api);
    });
  });
  group('Get tonight program', () {
    test('should call API when no cache', () async {
      // Given
      final channelId = '1';
      final tonightProgram = aProgram(channelId);
      when(api.fetchTonightProgram(channelId))
          .thenAnswer((_) async => tonightProgram);

      // When
      final result = await service.getTonightProgram(channelId);

      // Then
      expect(result, isA<Program>());
      expect(result, tonightProgram);
      verify(api.fetchTonightProgram(channelId)).called(1);
      verifyNoMoreInteractions(api);
    });

    test('should return cached tonight program', () async {
      // Given
      final channelId = '1';
      final tonightProgram = aProgram(channelId);
      cache.addTonightProgram(channelId, tonightProgram);

      // When
      final result = await service.getTonightProgram(channelId);

      // Then
      expect(result, isA<Program>());
      expect(result, tonightProgram);
      verifyNoMoreInteractions(api);
    });
  });
}
