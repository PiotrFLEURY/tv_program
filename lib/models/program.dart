import 'package:intl/intl.dart';
import 'package:tv_program/models/credit.dart';
import 'package:tv_program/models/rating.dart';

final hourDisplayFormat = DateFormat('HH:mm', 'fr_FR');

class Program {
  final String? channelId;
  final DateTime? start;
  final DateTime? stop;
  final String? title;
  final String? description;
  final List<String> categories;
  final String? icon;
  final Rating? rating;
  final List<Credit>? credits;
  final String? episodeNum;

  Program({
    required this.channelId,
    required this.start,
    required this.stop,
    required this.title,
    required this.description,
    required this.categories,
    required this.icon,
    required this.rating,
    required this.credits,
    required this.episodeNum,
  });

  String get startTime => hourDisplayFormat.format(start!.toLocal());

  String get endTime => hourDisplayFormat.format(stop!.toLocal());

  String get header => '$startTime - $endTime: $title';

  Duration get duration =>
      stop != null && start != null ? stop!.difference(start!) : Duration.zero;

  String? get shortDescription =>
      description != null && description!.length > 100
          ? '${description!.substring(0, 100)}...'
          : description;
}
