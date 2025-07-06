import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/providers/selected_program.dart';
import 'package:tv_program/providers/service_provider.dart';

part 'selected_program_content.g.dart';

@riverpod
Future<XmlTv> selectedProgramContent(Ref ref) {
  final selectedProgram = ref.watch(selectedProgramProvider);
  final service = ref.watch(tvServiceProvider);

  return service.getProgram(selectedProgram);
}
