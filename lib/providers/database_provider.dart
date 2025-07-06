import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/database/database.dart';

part 'database_provider.g.dart';

@riverpod
AppDatabase database(Ref ref) {
  return AppDatabase();
}
