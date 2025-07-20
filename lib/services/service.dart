import 'package:flutter/material.dart';
import 'package:tv_program/api/tv_prog_api.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/models/program.dart';

class TvProgCache {
  final List<Channel> _channelsCache = [];
  final Map<String, List<Program>> _programsCache = {};
  final Map<String, Program?> _currentProgramCache = {};
  final Map<String, Program?> _tonightProgramCache = {};

  List<Channel> get channels => _channelsCache;
  List<Program>? getPrograms(String channelId) => _programsCache[channelId];
  Program? getCurrentProgram(String channelId) =>
      _currentProgramCache[channelId];
  Program? getTonightProgram(String channelId) =>
      _tonightProgramCache[channelId];

  void addChannels(List<Channel> channels) => _channelsCache.addAll(channels);
  void addPrograms(String channelId, List<Program> programs) {
    _programsCache[channelId] = programs;
  }

  void addCurrentProgram(String channelId, Program? program) {
    _currentProgramCache[channelId] = program;
  }

  void addTonightProgram(String channelId, Program? program) {
    _tonightProgramCache[channelId] = program;
  }
}

class TvService {
  const TvService(this.api, this.cache);

  final TvProgApi api;
  final TvProgCache cache;

  Future<List<Channel>> getChannels(String selectedProgram) async {
    debugPrint('Getting TV channels $selectedProgram');

    if (cache.channels.isNotEmpty) {
      debugPrint('Returning cached channels');
      return cache.channels;
    }

    var channels = await api.fetchChannels(selectedProgram);
    cache.addChannels(channels);
    return channels;
  }

  Future<List<Program>> getPrograms(String channelId) async {
    debugPrint('Getting programs for channel $channelId');

    if (cache.getPrograms(channelId) != null) {
      debugPrint('Returning cached programs for channel $channelId');
      return cache.getPrograms(channelId)!;
    }

    var programs = await api.fetchPrograms(channelId);
    cache.addPrograms(channelId, programs);
    return programs;
  }

  Future<Program> getCurrentProgram(String channelId) async {
    debugPrint('Getting current program for channel $channelId');

    if (cache.getCurrentProgram(channelId) != null) {
      debugPrint('Returning cached current program for channel $channelId');
      return cache.getCurrentProgram(channelId)!;
    }
    var currentProgram = await api.fetchCurrentProgram(channelId);
    cache.addCurrentProgram(channelId, currentProgram);
    return currentProgram;
  }

  Future<Program?> getTonightProgram(String channelId) async {
    debugPrint('Getting tonight program for channel $channelId');

    if (cache.getTonightProgram(channelId) != null) {
      debugPrint('Returning cached tonight program for channel $channelId');
      return cache.getTonightProgram(channelId)!;
    }

    var tonightProgram = await api.fetchTonightProgram(channelId);
    cache.addTonightProgram(channelId, tonightProgram);
    return tonightProgram;
  }
}
