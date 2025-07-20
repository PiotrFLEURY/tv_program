import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/api/tv_prog_api.dart';

part 'tv_prog_api_provider.g.dart';

@riverpod
TvProgApi tvProgApi(Ref ref) {
  return TvProgApi();
}
