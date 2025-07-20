import 'package:tv_program/models/credit.dart';
import 'package:tv_program/models/rating.dart';

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

  String get startTime =>
      '${start!.hour.toString().padLeft(2, '0')}:${start!.minute.toString().padLeft(2, '0')}';

  String get endTime =>
      '${stop!.hour.toString().padLeft(2, '0')}:${stop!.minute.toString().padLeft(2, '0')}';

  String get header => '$startTime - $endTime: $title';

  Duration get duration =>
      stop != null && start != null ? stop!.difference(start!) : Duration.zero;

  String? get shortDescription =>
      description != null && description!.length > 100
          ? '${description!.substring(0, 100)}...'
          : description;
}
