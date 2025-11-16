import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/models/program.dart';
import 'package:tv_program/providers/service_provider.dart';

part 'channel_programs_provider.g.dart';

@riverpod
Future<List<Program>> channelPrograms(Ref ref, String channelId) {
  final service = ref.watch(tvServiceProvider);
  return service.getPrograms(channelId);
}
