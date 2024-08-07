import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:tv_program/models/xml_tv.dart';

part 'database.g.dart';

class ChannelTable extends Table {
  TextColumn get id => text().withLength(min: 0, max: 128)();
  TextColumn get name => text().withLength(min: 0, max: 128)();
  TextColumn get icon => text().withLength(min: 0, max: 512)();
  TextColumn get selectedProgram => text().withLength(min: 0, max: 32)();
}

class ProgramTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get channel => text().references(ChannelTable, #id)();
  DateTimeColumn get start => dateTime()();
  DateTimeColumn get stop => dateTime()();
  TextColumn get title => text().withLength(min: 0, max: 512)();
  TextColumn get description => text().withLength(min: 0, max: 4096)();
  TextColumn get categories => text().withLength(min: 0, max: 255)();
  TextColumn get icon => text().withLength(min: 0, max: 512)();
  TextColumn get ratingSystem => text().withLength(min: 0, max: 32)();
  TextColumn get ratingValue => text().withLength(min: 0, max: 32)();
  final List<Credit>? credits = [];
  TextColumn get episodeNum => text().withLength(min: 0, max: 32)();
  TextColumn get selectedProgram => text().withLength(min: 0, max: 32)();
}

class CreditTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get program => text().references(ProgramTable, #id)();
  TextColumn get guests => text().withLength(min: 0, max: 255)();
  TextColumn get directors => text().withLength(min: 0, max: 255)();
  TextColumn get actors => text().withLength(min: 0, max: 255)();
  TextColumn get adapters => text().withLength(min: 0, max: 255)();
  TextColumn get producers => text().withLength(min: 0, max: 255)();
  TextColumn get composers => text().withLength(min: 0, max: 255)();
  TextColumn get editors => text().withLength(min: 0, max: 255)();
  TextColumn get selectedProgram => text().withLength(min: 0, max: 32)();
}

@DriftDatabase(tables: [ChannelTable, ProgramTable, CreditTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: 'tv_program');
  }

  // Insert multiple channels
  Future<void> insertChannels(
    String selectedProgram,
    List<Channel> channels,
  ) async {
    await batch((batch) {
      batch.insertAll(
        channelTable,
        channels.map(
          (e) => ChannelTableCompanion.insert(
            id: e.id!,
            name: e.name!,
            icon: e.icon ?? '',
            selectedProgram: selectedProgram,
          ),
        ),
      );
    });
  }

  // Insert multiple programs
  Future<void> insertPrograms(
    String selectedProgram,
    List<Program> programs,
  ) async {
    await batch((batch) {
      batch.insertAll(
        programTable,
        programs.map(
          (e) {
            return ProgramTableCompanion.insert(
              channel: e.channelId!,
              start: e.start!,
              stop: e.stop!,
              title: e.title ?? '',
              description: e.description ?? '',
              categories: e.categories.join(', '),
              icon: e.icon ?? '',
              ratingSystem: e.rating?.system ?? '',
              ratingValue: e.rating?.value ?? '',
              episodeNum: e.episodeNum ?? '',
              selectedProgram: selectedProgram,
            );
          },
        ),
      );
    });
  }

  Future<List<ChannelTableData>> getAllChannels(String selectedProgram) =>
      (select(channelTable)
            ..where((tbl) => tbl.selectedProgram.equals(selectedProgram)))
          .get();

  Future<List<ProgramTableData>> getProgramsForChannel(String channelId) {
    return (select(programTable)..where((tbl) => tbl.channel.equals(channelId)))
        .get();
  }

  Future<bool> containsTodayData(String selectedProgram) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final count = await (select(programTable)
          ..where((tbl) => tbl.start.isBiggerOrEqualValue(today))
          ..where((tbl) => tbl.selectedProgram.equals(selectedProgram)))
        .get()
        .then((value) => value.length);
    return count > 0;
  }

  saveTodayData(String selectedProgram, XmlTv parsedData) {
    // cleanup old data
    (delete(programTable)
          ..where((tbl) => tbl.selectedProgram.equals(selectedProgram)))
        .go();
    (delete(channelTable)
      ..where((tbl) => tbl.selectedProgram.equals(selectedProgram)));

    // insert new data
    insertChannels(selectedProgram, parsedData.channels);
    insertPrograms(selectedProgram, parsedData.programs);
  }

  Future<XmlTv> getTodayData(String selectedProgram) async {
    // Get all channels
    final channels = await getAllChannels(selectedProgram);

    // Get today programs
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final programs = await (select(programTable)
          ..where((tbl) => tbl.start.isBiggerOrEqualValue(today))
          ..where((tbl) => tbl.selectedProgram.equals(selectedProgram)))
        .get();

    return XmlTv(
      channels: channels
          .map(
            (e) => Channel(
              id: e.id,
              name: e.name,
              icon: e.icon,
            ),
          )
          .toList(),
      programs: programs
          .map(
            (e) => Program(
              channelId: e.channel,
              start: e.start,
              stop: e.stop,
              title: e.title,
              description: e.description,
              categories: e.categories.split(', '),
              icon: e.icon,
              rating: Rating(
                system: e.ratingSystem,
                value: e.ratingValue,
              ),
              credits: [],
              episodeNum: e.episodeNum,
            ),
          )
          .toList(),
    );
  }
}
