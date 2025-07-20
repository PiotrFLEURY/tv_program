import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/providers/selected_program.dart';
import 'package:tv_program/providers/service_provider.dart';

part 'channels_provider.g.dart';

Map<String, int> acromTNTChannelOrdering = {
  'TF1.fr': 1,
  'France2.fr': 2,
  'France3.fr': 3,
  'France4.fr': 4,
  'France5.fr': 5,
  'M6.fr': 6,
  'Arte.fr': 7,
  'LaChaineParlementaire.fr': 8,
  'W9.fr': 9,
  'TMC.fr': 10,
  'NT1.fr': 11, // Note: NT1 is now TFX
  'Gulli.fr': 12,
  'BFMTV.fr': 13,
  'CNews.fr': 14,
  'LCI.fr': 15,
  'FranceInfo.fr': 16,
  'CStar.fr': 17,
  'T18.fr': 18,
  // NOVO19 (à compter du 1er septembre)
  'TF1SeriesFilms.fr': 20,
  'LEquipe21.fr': 21,
  '6ter.fr': 22,
  'Numero23.fr': 23, // Note: Numero 23 is now called RMC Story
  'RMCDecouverte.fr': 24,
  'Cherie25.fr': 25,
  'ParisPremiere.fr': 26,
};

@riverpod
Future<List<Channel>> channels(Ref ref) async {
  final selectedProgram = ref.watch(selectedProgramProvider);
  final tvService = ref.watch(tvServiceProvider);
  final unorderedChannels = await tvService.getChannels(selectedProgram.name);
  final orderedChannels = unorderedChannels
      .where((channel) => acromTNTChannelOrdering.containsKey(channel.id))
      .toList()
    ..sort((a, b) {
      return acromTNTChannelOrdering[a.id]!
          .compareTo(acromTNTChannelOrdering[b.id]!);
    })
    ..addAll(
      unorderedChannels.where(
        (channel) => !acromTNTChannelOrdering.containsKey(channel.id),
      ),
    );
  return Future.value(orderedChannels);
}
