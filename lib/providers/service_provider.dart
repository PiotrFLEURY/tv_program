import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/providers/database_provider.dart';
import 'package:tv_program/providers/xml_parser_provider.dart';
import 'package:tv_program/services/service.dart';

part 'service_provider.g.dart';

@riverpod
TvService tvService(TvServiceRef ref) {
  final parser = ref.watch(xmlTvParserProvider);
  final database = ref.watch(databaseProvider);
  return TvService(parser, database);
}
