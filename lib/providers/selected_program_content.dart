import 'dart:async';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/providers/selected_program.dart';
import 'package:tv_program/providers/service_provider.dart';

part 'selected_program_content.g.dart';

@riverpod
Future<XmlTv> selectedProgramContent(SelectedProgramContentRef ref) {
  final selectedProgram = ref.watch(selectedProgramProvider);
  final service = ref.watch(tvServiceProvider);

  final rootIsolateToken = RootIsolateToken.instance!;

  // Required to run the service in a background isolate
  // too many data are loaded, need to paginate it
  return Isolate.run<XmlTv>(
    () {
      BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
      return service.getProgram(selectedProgram);
    },
  );
}
