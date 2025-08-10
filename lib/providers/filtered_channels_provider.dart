import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/providers/channels_provider.dart';
import 'package:tv_program/providers/filter_provider.dart';

part 'filtered_channels_provider.g.dart';

@riverpod
Future<List<Channel>> filteredChannels(Ref ref) async {
  final filter = ref.watch(filterProvider);
  final channels = await ref.watch(channelsProvider.future);
  return channels.where((channel) {
    return channel.name?.toLowerCase().contains(filter.toLowerCase()) ?? false;
  }).toList();
}
