import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/providers/service_provider.dart';

part 'program_provider.g.dart';

@riverpod
Future<XmlTv> program(Ref ref, String selectedProgram) {
  final service = ref.watch(tvServiceProvider);

  return service.getProgram(selectedProgram);
}
