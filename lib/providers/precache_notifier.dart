import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/providers/service_provider.dart';
import 'package:tv_program/services/service.dart';

part 'precache_notifier.g.dart';

@riverpod
class Precache extends _$Precache {
  @override
  int build() {
    precache();
    return 0;
  }

  Future<void> precache() async {
    final service = ref.watch(tvServiceProvider);
    final rootIsolateToken = RootIsolateToken.instance!;

    await Isolate.run<XmlTv>(
      () {
        BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
        return service.getProgram(TvService.tvTnt);
      },
    );
    state++;

    await Isolate.run<XmlTv>(
      () {
        BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
        return service.getProgram(TvService.tvFrance);
      },
    );
    state++;

    await Isolate.run<XmlTv>(
      () {
        BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
        return service.getProgram(TvService.allChannels);
      },
    );
    state++;
  }
}
