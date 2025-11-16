import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/models/program.dart';
import 'package:tv_program/providers/service_provider.dart';

part 'current_program_provider.g.dart';

@riverpod
Future<Program> currentProgram(Ref ref, String channelId) {
  final service = ref.watch(tvServiceProvider);
  return service.getCurrentProgram(channelId);
}
