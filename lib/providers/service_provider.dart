import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/providers/tv_prog_api_provider.dart';
import 'package:tv_program/services/service.dart';

part 'service_provider.g.dart';

@riverpod
TvService tvService(Ref ref) {
  final api = ref.watch(tvProgApiProvider);
  return TvService(api, TvProgCache());
}
