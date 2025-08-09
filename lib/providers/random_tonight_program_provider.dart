import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/models/program.dart';
import 'package:tv_program/providers/channels_provider.dart';
import 'package:tv_program/providers/service_provider.dart';

part 'random_tonight_program_provider.g.dart';

@riverpod
class RandomTonightProgram extends _$RandomTonightProgram {
  @override
  Future<Program?> build() async {
    return _getRandomTonightProgram();
  }

  Future<Program?> _getRandomTonightProgram() async {
    final tvService = ref.watch(tvServiceProvider);
    final channels = await ref.watch(channelsProvider.future);
    final randomChannel = channels[Random().nextInt(channels.length)];
    final tonightProgram = await tvService.getTonightProgram(randomChannel.id!);
    return tonightProgram;
  }

  void randomize() {
    state = const AsyncValue.loading();
    _getRandomTonightProgram().then((program) {
      state = AsyncValue.data(program);
    }).catchError((error) {
      state = AsyncValue.error(error, StackTrace.current);
    });
  }
}
