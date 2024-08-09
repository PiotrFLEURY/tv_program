class XmlTv {
  final List<Channel> channels;
  final List<Program> programs;

  XmlTv({required this.channels, required this.programs});

  Program? currentlyOn(Channel channel) {
    final now = DateTime.now();
    return programs.where(
      (program) {
        final start = program.start!;
        final stop = program.stop!;
        return program.channelId == channel.id &&
            start.isBefore(now) &&
            stop.isAfter(now);
      },
    ).firstOrNull;
  }

  Program? tonightOn(Channel channel) {
    final now = DateTime.now();
    final tonight = DateTime(now.year, now.month, now.day, 21, 00);
    return programs.where(
      (program) {
        // return program starts around 9pm
        final start = program.start!;
        final stop = program.stop!;
        return program.channelId == channel.id &&
            program.duration > const Duration(minutes: 30) &&
            (start.hour == tonight.hour ||
                start.hour == tonight.hour - 1 && stop.isAfter(tonight));
      },
    ).firstOrNull;
  }

  List<Program> todaysOn(Channel channel) {
    return programs
        .where((program) => program.channelId == channel.id)
        .where((program) => program.start!.day == DateTime.now().day)
        .where((program) => program.stop!.isAfter(DateTime.now()))
        .toList();
  }
}

class Channel {
  final String? id;
  final String? name;
  final String? icon;

  Channel({required this.id, required this.name, required this.icon});
}

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

  get duration =>
      stop != null && start != null ? stop!.difference(start!) : Duration.zero;
}

class Rating {
  final String? system;
  final String? value;

  Rating({required this.system, required this.value});
}

class Credit {
  final List<String>? guests;
  final List<String>? directors;
  final List<String>? actors;
  final List<String>? adapters;
  final List<String>? producers;
  final List<String>? composers;
  final List<String>? editors;

  Credit({
    required this.guests,
    required this.directors,
    required this.actors,
    required this.adapters,
    required this.producers,
    required this.composers,
    required this.editors,
  });
}
