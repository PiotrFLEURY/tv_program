import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/database/database.dart';

part 'database_provider.g.dart';

@riverpod
AppDatabase database(DatabaseRef ref) {
  return AppDatabase();
}
