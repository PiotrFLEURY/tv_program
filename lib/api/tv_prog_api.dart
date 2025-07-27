import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/models/program.dart';
import 'package:http/http.dart' as http;
import 'package:tv_program/models/rating.dart';

class TvProgApi {
  final format = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
  static const String _baseUrl = 'http://vps-19747bee.vps.ovh.net:8989';

  Future<List<Channel>> fetchChannels(String program) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/channels/${program.toUpperCase()}'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data as List)
          .map((channel) => _channelFromJson(channel))
          .toList();
    } else {
      throw Exception('Failed to load channels');
    }
  }

  Channel _channelFromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['channelId'] as String?,
      name: json['name'] as String?,
      icon: json['iconUrl'] as String?,
    );
  }

  Future<List<Program>> fetchPrograms(String channelId) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/programs?channelId=$channelId&size=100'));

    if ([200, 202].contains(response.statusCode)) {
      final data = jsonDecode(response.body);
      return (data['content'] as List)
          .map((program) => _programFromJson(program))
          .toList();
    } else {
      throw Exception('Failed to load programs');
    }
  }

  Future<Program> fetchCurrentProgram(String channelId) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/programs/current?channelId=$channelId'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return _programFromJson(data);
    } else {
      throw Exception('Failed to load programs');
    }
  }

  Future<Program?> fetchTonightProgram(String channelId) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/programs/tonight?channelId=$channelId'));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      final data = jsonDecode(response.body);
      return _programFromJson(data);
    }
    return null; // Return null if no program is found
  }

  Program _programFromJson(Map<String, dynamic> program) {
    return Program(
      channelId: program['channelId'] as String?,
      start: DateTime.parse(program['startTime'] as String).toUtc(),
      stop: DateTime.parse(program['endTime'] as String).toUtc(),
      title: program['title'] as String?,
      description: program['description'] as String?,
      icon: program['iconUrl'] as String?,
      categories: (program['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      rating: _ratingFromJson(program['rating']),
      credits: [],
      episodeNum: program['episodeNum'] as String?,
    );
  }

  Rating? _ratingFromJson(Map<String, dynamic>? rating) {
    if (rating == null) return null;

    return Rating(
      system: rating['system'] as String?,
      value: rating['value'] as String?,
    );
  }
}
