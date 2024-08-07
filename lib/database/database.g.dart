// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ChannelTableTable extends ChannelTable
    with TableInfo<$ChannelTableTable, ChannelTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChannelTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 512),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _selectedProgramMeta =
      const VerificationMeta('selectedProgram');
  @override
  late final GeneratedColumn<String> selectedProgram = GeneratedColumn<String>(
      'selected_program', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, icon, selectedProgram];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'channel_table';
  @override
  VerificationContext validateIntegrity(Insertable<ChannelTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('selected_program')) {
      context.handle(
          _selectedProgramMeta,
          selectedProgram.isAcceptableOrUnknown(
              data['selected_program']!, _selectedProgramMeta));
    } else if (isInserting) {
      context.missing(_selectedProgramMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ChannelTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChannelTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      selectedProgram: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}selected_program'])!,
    );
  }

  @override
  $ChannelTableTable createAlias(String alias) {
    return $ChannelTableTable(attachedDatabase, alias);
  }
}

class ChannelTableData extends DataClass
    implements Insertable<ChannelTableData> {
  final String id;
  final String name;
  final String icon;
  final String selectedProgram;
  const ChannelTableData(
      {required this.id,
      required this.name,
      required this.icon,
      required this.selectedProgram});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<String>(icon);
    map['selected_program'] = Variable<String>(selectedProgram);
    return map;
  }

  ChannelTableCompanion toCompanion(bool nullToAbsent) {
    return ChannelTableCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      selectedProgram: Value(selectedProgram),
    );
  }

  factory ChannelTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChannelTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String>(json['icon']),
      selectedProgram: serializer.fromJson<String>(json['selectedProgram']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<String>(icon),
      'selectedProgram': serializer.toJson<String>(selectedProgram),
    };
  }

  ChannelTableData copyWith(
          {String? id, String? name, String? icon, String? selectedProgram}) =>
      ChannelTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        selectedProgram: selectedProgram ?? this.selectedProgram,
      );
  ChannelTableData copyWithCompanion(ChannelTableCompanion data) {
    return ChannelTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      selectedProgram: data.selectedProgram.present
          ? data.selectedProgram.value
          : this.selectedProgram,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChannelTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('selectedProgram: $selectedProgram')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, icon, selectedProgram);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChannelTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.selectedProgram == this.selectedProgram);
}

class ChannelTableCompanion extends UpdateCompanion<ChannelTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> icon;
  final Value<String> selectedProgram;
  final Value<int> rowid;
  const ChannelTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.selectedProgram = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChannelTableCompanion.insert({
    required String id,
    required String name,
    required String icon,
    required String selectedProgram,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        icon = Value(icon),
        selectedProgram = Value(selectedProgram);
  static Insertable<ChannelTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<String>? selectedProgram,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (selectedProgram != null) 'selected_program': selectedProgram,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChannelTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? icon,
      Value<String>? selectedProgram,
      Value<int>? rowid}) {
    return ChannelTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      selectedProgram: selectedProgram ?? this.selectedProgram,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (selectedProgram.present) {
      map['selected_program'] = Variable<String>(selectedProgram.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChannelTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('selectedProgram: $selectedProgram, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgramTableTable extends ProgramTable
    with TableInfo<$ProgramTableTable, ProgramTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgramTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _channelMeta =
      const VerificationMeta('channel');
  @override
  late final GeneratedColumn<String> channel = GeneratedColumn<String>(
      'channel', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES channel_table (id)'));
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _stopMeta = const VerificationMeta('stop');
  @override
  late final GeneratedColumn<DateTime> stop = GeneratedColumn<DateTime>(
      'stop', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 512),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 4096),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoriesMeta =
      const VerificationMeta('categories');
  @override
  late final GeneratedColumn<String> categories = GeneratedColumn<String>(
      'categories', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 512),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ratingSystemMeta =
      const VerificationMeta('ratingSystem');
  @override
  late final GeneratedColumn<String> ratingSystem = GeneratedColumn<String>(
      'rating_system', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ratingValueMeta =
      const VerificationMeta('ratingValue');
  @override
  late final GeneratedColumn<String> ratingValue = GeneratedColumn<String>(
      'rating_value', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _episodeNumMeta =
      const VerificationMeta('episodeNum');
  @override
  late final GeneratedColumn<String> episodeNum = GeneratedColumn<String>(
      'episode_num', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _selectedProgramMeta =
      const VerificationMeta('selectedProgram');
  @override
  late final GeneratedColumn<String> selectedProgram = GeneratedColumn<String>(
      'selected_program', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        channel,
        start,
        stop,
        title,
        description,
        categories,
        icon,
        ratingSystem,
        ratingValue,
        episodeNum,
        selectedProgram
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'program_table';
  @override
  VerificationContext validateIntegrity(Insertable<ProgramTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('channel')) {
      context.handle(_channelMeta,
          channel.isAcceptableOrUnknown(data['channel']!, _channelMeta));
    } else if (isInserting) {
      context.missing(_channelMeta);
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('stop')) {
      context.handle(
          _stopMeta, stop.isAcceptableOrUnknown(data['stop']!, _stopMeta));
    } else if (isInserting) {
      context.missing(_stopMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('categories')) {
      context.handle(
          _categoriesMeta,
          categories.isAcceptableOrUnknown(
              data['categories']!, _categoriesMeta));
    } else if (isInserting) {
      context.missing(_categoriesMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('rating_system')) {
      context.handle(
          _ratingSystemMeta,
          ratingSystem.isAcceptableOrUnknown(
              data['rating_system']!, _ratingSystemMeta));
    } else if (isInserting) {
      context.missing(_ratingSystemMeta);
    }
    if (data.containsKey('rating_value')) {
      context.handle(
          _ratingValueMeta,
          ratingValue.isAcceptableOrUnknown(
              data['rating_value']!, _ratingValueMeta));
    } else if (isInserting) {
      context.missing(_ratingValueMeta);
    }
    if (data.containsKey('episode_num')) {
      context.handle(
          _episodeNumMeta,
          episodeNum.isAcceptableOrUnknown(
              data['episode_num']!, _episodeNumMeta));
    } else if (isInserting) {
      context.missing(_episodeNumMeta);
    }
    if (data.containsKey('selected_program')) {
      context.handle(
          _selectedProgramMeta,
          selectedProgram.isAcceptableOrUnknown(
              data['selected_program']!, _selectedProgramMeta));
    } else if (isInserting) {
      context.missing(_selectedProgramMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgramTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgramTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      channel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}channel'])!,
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start'])!,
      stop: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}stop'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      categories: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categories'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      ratingSystem: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rating_system'])!,
      ratingValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rating_value'])!,
      episodeNum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}episode_num'])!,
      selectedProgram: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}selected_program'])!,
    );
  }

  @override
  $ProgramTableTable createAlias(String alias) {
    return $ProgramTableTable(attachedDatabase, alias);
  }
}

class ProgramTableData extends DataClass
    implements Insertable<ProgramTableData> {
  final int id;
  final String channel;
  final DateTime start;
  final DateTime stop;
  final String title;
  final String description;
  final String categories;
  final String icon;
  final String ratingSystem;
  final String ratingValue;
  final String episodeNum;
  final String selectedProgram;
  const ProgramTableData(
      {required this.id,
      required this.channel,
      required this.start,
      required this.stop,
      required this.title,
      required this.description,
      required this.categories,
      required this.icon,
      required this.ratingSystem,
      required this.ratingValue,
      required this.episodeNum,
      required this.selectedProgram});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['channel'] = Variable<String>(channel);
    map['start'] = Variable<DateTime>(start);
    map['stop'] = Variable<DateTime>(stop);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['categories'] = Variable<String>(categories);
    map['icon'] = Variable<String>(icon);
    map['rating_system'] = Variable<String>(ratingSystem);
    map['rating_value'] = Variable<String>(ratingValue);
    map['episode_num'] = Variable<String>(episodeNum);
    map['selected_program'] = Variable<String>(selectedProgram);
    return map;
  }

  ProgramTableCompanion toCompanion(bool nullToAbsent) {
    return ProgramTableCompanion(
      id: Value(id),
      channel: Value(channel),
      start: Value(start),
      stop: Value(stop),
      title: Value(title),
      description: Value(description),
      categories: Value(categories),
      icon: Value(icon),
      ratingSystem: Value(ratingSystem),
      ratingValue: Value(ratingValue),
      episodeNum: Value(episodeNum),
      selectedProgram: Value(selectedProgram),
    );
  }

  factory ProgramTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgramTableData(
      id: serializer.fromJson<int>(json['id']),
      channel: serializer.fromJson<String>(json['channel']),
      start: serializer.fromJson<DateTime>(json['start']),
      stop: serializer.fromJson<DateTime>(json['stop']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      categories: serializer.fromJson<String>(json['categories']),
      icon: serializer.fromJson<String>(json['icon']),
      ratingSystem: serializer.fromJson<String>(json['ratingSystem']),
      ratingValue: serializer.fromJson<String>(json['ratingValue']),
      episodeNum: serializer.fromJson<String>(json['episodeNum']),
      selectedProgram: serializer.fromJson<String>(json['selectedProgram']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'channel': serializer.toJson<String>(channel),
      'start': serializer.toJson<DateTime>(start),
      'stop': serializer.toJson<DateTime>(stop),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'categories': serializer.toJson<String>(categories),
      'icon': serializer.toJson<String>(icon),
      'ratingSystem': serializer.toJson<String>(ratingSystem),
      'ratingValue': serializer.toJson<String>(ratingValue),
      'episodeNum': serializer.toJson<String>(episodeNum),
      'selectedProgram': serializer.toJson<String>(selectedProgram),
    };
  }

  ProgramTableData copyWith(
          {int? id,
          String? channel,
          DateTime? start,
          DateTime? stop,
          String? title,
          String? description,
          String? categories,
          String? icon,
          String? ratingSystem,
          String? ratingValue,
          String? episodeNum,
          String? selectedProgram}) =>
      ProgramTableData(
        id: id ?? this.id,
        channel: channel ?? this.channel,
        start: start ?? this.start,
        stop: stop ?? this.stop,
        title: title ?? this.title,
        description: description ?? this.description,
        categories: categories ?? this.categories,
        icon: icon ?? this.icon,
        ratingSystem: ratingSystem ?? this.ratingSystem,
        ratingValue: ratingValue ?? this.ratingValue,
        episodeNum: episodeNum ?? this.episodeNum,
        selectedProgram: selectedProgram ?? this.selectedProgram,
      );
  ProgramTableData copyWithCompanion(ProgramTableCompanion data) {
    return ProgramTableData(
      id: data.id.present ? data.id.value : this.id,
      channel: data.channel.present ? data.channel.value : this.channel,
      start: data.start.present ? data.start.value : this.start,
      stop: data.stop.present ? data.stop.value : this.stop,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      categories:
          data.categories.present ? data.categories.value : this.categories,
      icon: data.icon.present ? data.icon.value : this.icon,
      ratingSystem: data.ratingSystem.present
          ? data.ratingSystem.value
          : this.ratingSystem,
      ratingValue:
          data.ratingValue.present ? data.ratingValue.value : this.ratingValue,
      episodeNum:
          data.episodeNum.present ? data.episodeNum.value : this.episodeNum,
      selectedProgram: data.selectedProgram.present
          ? data.selectedProgram.value
          : this.selectedProgram,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgramTableData(')
          ..write('id: $id, ')
          ..write('channel: $channel, ')
          ..write('start: $start, ')
          ..write('stop: $stop, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('categories: $categories, ')
          ..write('icon: $icon, ')
          ..write('ratingSystem: $ratingSystem, ')
          ..write('ratingValue: $ratingValue, ')
          ..write('episodeNum: $episodeNum, ')
          ..write('selectedProgram: $selectedProgram')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, channel, start, stop, title, description,
      categories, icon, ratingSystem, ratingValue, episodeNum, selectedProgram);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgramTableData &&
          other.id == this.id &&
          other.channel == this.channel &&
          other.start == this.start &&
          other.stop == this.stop &&
          other.title == this.title &&
          other.description == this.description &&
          other.categories == this.categories &&
          other.icon == this.icon &&
          other.ratingSystem == this.ratingSystem &&
          other.ratingValue == this.ratingValue &&
          other.episodeNum == this.episodeNum &&
          other.selectedProgram == this.selectedProgram);
}

class ProgramTableCompanion extends UpdateCompanion<ProgramTableData> {
  final Value<int> id;
  final Value<String> channel;
  final Value<DateTime> start;
  final Value<DateTime> stop;
  final Value<String> title;
  final Value<String> description;
  final Value<String> categories;
  final Value<String> icon;
  final Value<String> ratingSystem;
  final Value<String> ratingValue;
  final Value<String> episodeNum;
  final Value<String> selectedProgram;
  const ProgramTableCompanion({
    this.id = const Value.absent(),
    this.channel = const Value.absent(),
    this.start = const Value.absent(),
    this.stop = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.categories = const Value.absent(),
    this.icon = const Value.absent(),
    this.ratingSystem = const Value.absent(),
    this.ratingValue = const Value.absent(),
    this.episodeNum = const Value.absent(),
    this.selectedProgram = const Value.absent(),
  });
  ProgramTableCompanion.insert({
    this.id = const Value.absent(),
    required String channel,
    required DateTime start,
    required DateTime stop,
    required String title,
    required String description,
    required String categories,
    required String icon,
    required String ratingSystem,
    required String ratingValue,
    required String episodeNum,
    required String selectedProgram,
  })  : channel = Value(channel),
        start = Value(start),
        stop = Value(stop),
        title = Value(title),
        description = Value(description),
        categories = Value(categories),
        icon = Value(icon),
        ratingSystem = Value(ratingSystem),
        ratingValue = Value(ratingValue),
        episodeNum = Value(episodeNum),
        selectedProgram = Value(selectedProgram);
  static Insertable<ProgramTableData> custom({
    Expression<int>? id,
    Expression<String>? channel,
    Expression<DateTime>? start,
    Expression<DateTime>? stop,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? categories,
    Expression<String>? icon,
    Expression<String>? ratingSystem,
    Expression<String>? ratingValue,
    Expression<String>? episodeNum,
    Expression<String>? selectedProgram,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (channel != null) 'channel': channel,
      if (start != null) 'start': start,
      if (stop != null) 'stop': stop,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (categories != null) 'categories': categories,
      if (icon != null) 'icon': icon,
      if (ratingSystem != null) 'rating_system': ratingSystem,
      if (ratingValue != null) 'rating_value': ratingValue,
      if (episodeNum != null) 'episode_num': episodeNum,
      if (selectedProgram != null) 'selected_program': selectedProgram,
    });
  }

  ProgramTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? channel,
      Value<DateTime>? start,
      Value<DateTime>? stop,
      Value<String>? title,
      Value<String>? description,
      Value<String>? categories,
      Value<String>? icon,
      Value<String>? ratingSystem,
      Value<String>? ratingValue,
      Value<String>? episodeNum,
      Value<String>? selectedProgram}) {
    return ProgramTableCompanion(
      id: id ?? this.id,
      channel: channel ?? this.channel,
      start: start ?? this.start,
      stop: stop ?? this.stop,
      title: title ?? this.title,
      description: description ?? this.description,
      categories: categories ?? this.categories,
      icon: icon ?? this.icon,
      ratingSystem: ratingSystem ?? this.ratingSystem,
      ratingValue: ratingValue ?? this.ratingValue,
      episodeNum: episodeNum ?? this.episodeNum,
      selectedProgram: selectedProgram ?? this.selectedProgram,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (channel.present) {
      map['channel'] = Variable<String>(channel.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (stop.present) {
      map['stop'] = Variable<DateTime>(stop.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(categories.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (ratingSystem.present) {
      map['rating_system'] = Variable<String>(ratingSystem.value);
    }
    if (ratingValue.present) {
      map['rating_value'] = Variable<String>(ratingValue.value);
    }
    if (episodeNum.present) {
      map['episode_num'] = Variable<String>(episodeNum.value);
    }
    if (selectedProgram.present) {
      map['selected_program'] = Variable<String>(selectedProgram.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgramTableCompanion(')
          ..write('id: $id, ')
          ..write('channel: $channel, ')
          ..write('start: $start, ')
          ..write('stop: $stop, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('categories: $categories, ')
          ..write('icon: $icon, ')
          ..write('ratingSystem: $ratingSystem, ')
          ..write('ratingValue: $ratingValue, ')
          ..write('episodeNum: $episodeNum, ')
          ..write('selectedProgram: $selectedProgram')
          ..write(')'))
        .toString();
  }
}

class $CreditTableTable extends CreditTable
    with TableInfo<$CreditTableTable, CreditTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreditTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _programMeta =
      const VerificationMeta('program');
  @override
  late final GeneratedColumn<String> program = GeneratedColumn<String>(
      'program', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES program_table (id)'));
  static const VerificationMeta _guestsMeta = const VerificationMeta('guests');
  @override
  late final GeneratedColumn<String> guests = GeneratedColumn<String>(
      'guests', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _directorsMeta =
      const VerificationMeta('directors');
  @override
  late final GeneratedColumn<String> directors = GeneratedColumn<String>(
      'directors', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _actorsMeta = const VerificationMeta('actors');
  @override
  late final GeneratedColumn<String> actors = GeneratedColumn<String>(
      'actors', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _adaptersMeta =
      const VerificationMeta('adapters');
  @override
  late final GeneratedColumn<String> adapters = GeneratedColumn<String>(
      'adapters', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _producersMeta =
      const VerificationMeta('producers');
  @override
  late final GeneratedColumn<String> producers = GeneratedColumn<String>(
      'producers', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _composersMeta =
      const VerificationMeta('composers');
  @override
  late final GeneratedColumn<String> composers = GeneratedColumn<String>(
      'composers', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _editorsMeta =
      const VerificationMeta('editors');
  @override
  late final GeneratedColumn<String> editors = GeneratedColumn<String>(
      'editors', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _selectedProgramMeta =
      const VerificationMeta('selectedProgram');
  @override
  late final GeneratedColumn<String> selectedProgram = GeneratedColumn<String>(
      'selected_program', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        program,
        guests,
        directors,
        actors,
        adapters,
        producers,
        composers,
        editors,
        selectedProgram
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'credit_table';
  @override
  VerificationContext validateIntegrity(Insertable<CreditTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('program')) {
      context.handle(_programMeta,
          program.isAcceptableOrUnknown(data['program']!, _programMeta));
    } else if (isInserting) {
      context.missing(_programMeta);
    }
    if (data.containsKey('guests')) {
      context.handle(_guestsMeta,
          guests.isAcceptableOrUnknown(data['guests']!, _guestsMeta));
    } else if (isInserting) {
      context.missing(_guestsMeta);
    }
    if (data.containsKey('directors')) {
      context.handle(_directorsMeta,
          directors.isAcceptableOrUnknown(data['directors']!, _directorsMeta));
    } else if (isInserting) {
      context.missing(_directorsMeta);
    }
    if (data.containsKey('actors')) {
      context.handle(_actorsMeta,
          actors.isAcceptableOrUnknown(data['actors']!, _actorsMeta));
    } else if (isInserting) {
      context.missing(_actorsMeta);
    }
    if (data.containsKey('adapters')) {
      context.handle(_adaptersMeta,
          adapters.isAcceptableOrUnknown(data['adapters']!, _adaptersMeta));
    } else if (isInserting) {
      context.missing(_adaptersMeta);
    }
    if (data.containsKey('producers')) {
      context.handle(_producersMeta,
          producers.isAcceptableOrUnknown(data['producers']!, _producersMeta));
    } else if (isInserting) {
      context.missing(_producersMeta);
    }
    if (data.containsKey('composers')) {
      context.handle(_composersMeta,
          composers.isAcceptableOrUnknown(data['composers']!, _composersMeta));
    } else if (isInserting) {
      context.missing(_composersMeta);
    }
    if (data.containsKey('editors')) {
      context.handle(_editorsMeta,
          editors.isAcceptableOrUnknown(data['editors']!, _editorsMeta));
    } else if (isInserting) {
      context.missing(_editorsMeta);
    }
    if (data.containsKey('selected_program')) {
      context.handle(
          _selectedProgramMeta,
          selectedProgram.isAcceptableOrUnknown(
              data['selected_program']!, _selectedProgramMeta));
    } else if (isInserting) {
      context.missing(_selectedProgramMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CreditTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CreditTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      program: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}program'])!,
      guests: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guests'])!,
      directors: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}directors'])!,
      actors: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}actors'])!,
      adapters: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}adapters'])!,
      producers: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}producers'])!,
      composers: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}composers'])!,
      editors: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}editors'])!,
      selectedProgram: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}selected_program'])!,
    );
  }

  @override
  $CreditTableTable createAlias(String alias) {
    return $CreditTableTable(attachedDatabase, alias);
  }
}

class CreditTableData extends DataClass implements Insertable<CreditTableData> {
  final int id;
  final String program;
  final String guests;
  final String directors;
  final String actors;
  final String adapters;
  final String producers;
  final String composers;
  final String editors;
  final String selectedProgram;
  const CreditTableData(
      {required this.id,
      required this.program,
      required this.guests,
      required this.directors,
      required this.actors,
      required this.adapters,
      required this.producers,
      required this.composers,
      required this.editors,
      required this.selectedProgram});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['program'] = Variable<String>(program);
    map['guests'] = Variable<String>(guests);
    map['directors'] = Variable<String>(directors);
    map['actors'] = Variable<String>(actors);
    map['adapters'] = Variable<String>(adapters);
    map['producers'] = Variable<String>(producers);
    map['composers'] = Variable<String>(composers);
    map['editors'] = Variable<String>(editors);
    map['selected_program'] = Variable<String>(selectedProgram);
    return map;
  }

  CreditTableCompanion toCompanion(bool nullToAbsent) {
    return CreditTableCompanion(
      id: Value(id),
      program: Value(program),
      guests: Value(guests),
      directors: Value(directors),
      actors: Value(actors),
      adapters: Value(adapters),
      producers: Value(producers),
      composers: Value(composers),
      editors: Value(editors),
      selectedProgram: Value(selectedProgram),
    );
  }

  factory CreditTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CreditTableData(
      id: serializer.fromJson<int>(json['id']),
      program: serializer.fromJson<String>(json['program']),
      guests: serializer.fromJson<String>(json['guests']),
      directors: serializer.fromJson<String>(json['directors']),
      actors: serializer.fromJson<String>(json['actors']),
      adapters: serializer.fromJson<String>(json['adapters']),
      producers: serializer.fromJson<String>(json['producers']),
      composers: serializer.fromJson<String>(json['composers']),
      editors: serializer.fromJson<String>(json['editors']),
      selectedProgram: serializer.fromJson<String>(json['selectedProgram']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'program': serializer.toJson<String>(program),
      'guests': serializer.toJson<String>(guests),
      'directors': serializer.toJson<String>(directors),
      'actors': serializer.toJson<String>(actors),
      'adapters': serializer.toJson<String>(adapters),
      'producers': serializer.toJson<String>(producers),
      'composers': serializer.toJson<String>(composers),
      'editors': serializer.toJson<String>(editors),
      'selectedProgram': serializer.toJson<String>(selectedProgram),
    };
  }

  CreditTableData copyWith(
          {int? id,
          String? program,
          String? guests,
          String? directors,
          String? actors,
          String? adapters,
          String? producers,
          String? composers,
          String? editors,
          String? selectedProgram}) =>
      CreditTableData(
        id: id ?? this.id,
        program: program ?? this.program,
        guests: guests ?? this.guests,
        directors: directors ?? this.directors,
        actors: actors ?? this.actors,
        adapters: adapters ?? this.adapters,
        producers: producers ?? this.producers,
        composers: composers ?? this.composers,
        editors: editors ?? this.editors,
        selectedProgram: selectedProgram ?? this.selectedProgram,
      );
  CreditTableData copyWithCompanion(CreditTableCompanion data) {
    return CreditTableData(
      id: data.id.present ? data.id.value : this.id,
      program: data.program.present ? data.program.value : this.program,
      guests: data.guests.present ? data.guests.value : this.guests,
      directors: data.directors.present ? data.directors.value : this.directors,
      actors: data.actors.present ? data.actors.value : this.actors,
      adapters: data.adapters.present ? data.adapters.value : this.adapters,
      producers: data.producers.present ? data.producers.value : this.producers,
      composers: data.composers.present ? data.composers.value : this.composers,
      editors: data.editors.present ? data.editors.value : this.editors,
      selectedProgram: data.selectedProgram.present
          ? data.selectedProgram.value
          : this.selectedProgram,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CreditTableData(')
          ..write('id: $id, ')
          ..write('program: $program, ')
          ..write('guests: $guests, ')
          ..write('directors: $directors, ')
          ..write('actors: $actors, ')
          ..write('adapters: $adapters, ')
          ..write('producers: $producers, ')
          ..write('composers: $composers, ')
          ..write('editors: $editors, ')
          ..write('selectedProgram: $selectedProgram')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, program, guests, directors, actors,
      adapters, producers, composers, editors, selectedProgram);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreditTableData &&
          other.id == this.id &&
          other.program == this.program &&
          other.guests == this.guests &&
          other.directors == this.directors &&
          other.actors == this.actors &&
          other.adapters == this.adapters &&
          other.producers == this.producers &&
          other.composers == this.composers &&
          other.editors == this.editors &&
          other.selectedProgram == this.selectedProgram);
}

class CreditTableCompanion extends UpdateCompanion<CreditTableData> {
  final Value<int> id;
  final Value<String> program;
  final Value<String> guests;
  final Value<String> directors;
  final Value<String> actors;
  final Value<String> adapters;
  final Value<String> producers;
  final Value<String> composers;
  final Value<String> editors;
  final Value<String> selectedProgram;
  const CreditTableCompanion({
    this.id = const Value.absent(),
    this.program = const Value.absent(),
    this.guests = const Value.absent(),
    this.directors = const Value.absent(),
    this.actors = const Value.absent(),
    this.adapters = const Value.absent(),
    this.producers = const Value.absent(),
    this.composers = const Value.absent(),
    this.editors = const Value.absent(),
    this.selectedProgram = const Value.absent(),
  });
  CreditTableCompanion.insert({
    this.id = const Value.absent(),
    required String program,
    required String guests,
    required String directors,
    required String actors,
    required String adapters,
    required String producers,
    required String composers,
    required String editors,
    required String selectedProgram,
  })  : program = Value(program),
        guests = Value(guests),
        directors = Value(directors),
        actors = Value(actors),
        adapters = Value(adapters),
        producers = Value(producers),
        composers = Value(composers),
        editors = Value(editors),
        selectedProgram = Value(selectedProgram);
  static Insertable<CreditTableData> custom({
    Expression<int>? id,
    Expression<String>? program,
    Expression<String>? guests,
    Expression<String>? directors,
    Expression<String>? actors,
    Expression<String>? adapters,
    Expression<String>? producers,
    Expression<String>? composers,
    Expression<String>? editors,
    Expression<String>? selectedProgram,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (program != null) 'program': program,
      if (guests != null) 'guests': guests,
      if (directors != null) 'directors': directors,
      if (actors != null) 'actors': actors,
      if (adapters != null) 'adapters': adapters,
      if (producers != null) 'producers': producers,
      if (composers != null) 'composers': composers,
      if (editors != null) 'editors': editors,
      if (selectedProgram != null) 'selected_program': selectedProgram,
    });
  }

  CreditTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? program,
      Value<String>? guests,
      Value<String>? directors,
      Value<String>? actors,
      Value<String>? adapters,
      Value<String>? producers,
      Value<String>? composers,
      Value<String>? editors,
      Value<String>? selectedProgram}) {
    return CreditTableCompanion(
      id: id ?? this.id,
      program: program ?? this.program,
      guests: guests ?? this.guests,
      directors: directors ?? this.directors,
      actors: actors ?? this.actors,
      adapters: adapters ?? this.adapters,
      producers: producers ?? this.producers,
      composers: composers ?? this.composers,
      editors: editors ?? this.editors,
      selectedProgram: selectedProgram ?? this.selectedProgram,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (program.present) {
      map['program'] = Variable<String>(program.value);
    }
    if (guests.present) {
      map['guests'] = Variable<String>(guests.value);
    }
    if (directors.present) {
      map['directors'] = Variable<String>(directors.value);
    }
    if (actors.present) {
      map['actors'] = Variable<String>(actors.value);
    }
    if (adapters.present) {
      map['adapters'] = Variable<String>(adapters.value);
    }
    if (producers.present) {
      map['producers'] = Variable<String>(producers.value);
    }
    if (composers.present) {
      map['composers'] = Variable<String>(composers.value);
    }
    if (editors.present) {
      map['editors'] = Variable<String>(editors.value);
    }
    if (selectedProgram.present) {
      map['selected_program'] = Variable<String>(selectedProgram.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreditTableCompanion(')
          ..write('id: $id, ')
          ..write('program: $program, ')
          ..write('guests: $guests, ')
          ..write('directors: $directors, ')
          ..write('actors: $actors, ')
          ..write('adapters: $adapters, ')
          ..write('producers: $producers, ')
          ..write('composers: $composers, ')
          ..write('editors: $editors, ')
          ..write('selectedProgram: $selectedProgram')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ChannelTableTable channelTable = $ChannelTableTable(this);
  late final $ProgramTableTable programTable = $ProgramTableTable(this);
  late final $CreditTableTable creditTable = $CreditTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [channelTable, programTable, creditTable];
}

typedef $$ChannelTableTableCreateCompanionBuilder = ChannelTableCompanion
    Function({
  required String id,
  required String name,
  required String icon,
  required String selectedProgram,
  Value<int> rowid,
});
typedef $$ChannelTableTableUpdateCompanionBuilder = ChannelTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> icon,
  Value<String> selectedProgram,
  Value<int> rowid,
});

class $$ChannelTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChannelTableTable,
    ChannelTableData,
    $$ChannelTableTableFilterComposer,
    $$ChannelTableTableOrderingComposer,
    $$ChannelTableTableCreateCompanionBuilder,
    $$ChannelTableTableUpdateCompanionBuilder> {
  $$ChannelTableTableTableManager(_$AppDatabase db, $ChannelTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChannelTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChannelTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> icon = const Value.absent(),
            Value<String> selectedProgram = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChannelTableCompanion(
            id: id,
            name: name,
            icon: icon,
            selectedProgram: selectedProgram,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String icon,
            required String selectedProgram,
            Value<int> rowid = const Value.absent(),
          }) =>
              ChannelTableCompanion.insert(
            id: id,
            name: name,
            icon: icon,
            selectedProgram: selectedProgram,
            rowid: rowid,
          ),
        ));
}

class $$ChannelTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChannelTableTable> {
  $$ChannelTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get selectedProgram => $state.composableBuilder(
      column: $state.table.selectedProgram,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter programTableRefs(
      ComposableFilter Function($$ProgramTableTableFilterComposer f) f) {
    final $$ProgramTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.programTable,
        getReferencedColumn: (t) => t.channel,
        builder: (joinBuilder, parentComposers) =>
            $$ProgramTableTableFilterComposer(ComposerState($state.db,
                $state.db.programTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ChannelTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChannelTableTable> {
  $$ChannelTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get selectedProgram => $state.composableBuilder(
      column: $state.table.selectedProgram,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ProgramTableTableCreateCompanionBuilder = ProgramTableCompanion
    Function({
  Value<int> id,
  required String channel,
  required DateTime start,
  required DateTime stop,
  required String title,
  required String description,
  required String categories,
  required String icon,
  required String ratingSystem,
  required String ratingValue,
  required String episodeNum,
  required String selectedProgram,
});
typedef $$ProgramTableTableUpdateCompanionBuilder = ProgramTableCompanion
    Function({
  Value<int> id,
  Value<String> channel,
  Value<DateTime> start,
  Value<DateTime> stop,
  Value<String> title,
  Value<String> description,
  Value<String> categories,
  Value<String> icon,
  Value<String> ratingSystem,
  Value<String> ratingValue,
  Value<String> episodeNum,
  Value<String> selectedProgram,
});

class $$ProgramTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProgramTableTable,
    ProgramTableData,
    $$ProgramTableTableFilterComposer,
    $$ProgramTableTableOrderingComposer,
    $$ProgramTableTableCreateCompanionBuilder,
    $$ProgramTableTableUpdateCompanionBuilder> {
  $$ProgramTableTableTableManager(_$AppDatabase db, $ProgramTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProgramTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProgramTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> channel = const Value.absent(),
            Value<DateTime> start = const Value.absent(),
            Value<DateTime> stop = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> categories = const Value.absent(),
            Value<String> icon = const Value.absent(),
            Value<String> ratingSystem = const Value.absent(),
            Value<String> ratingValue = const Value.absent(),
            Value<String> episodeNum = const Value.absent(),
            Value<String> selectedProgram = const Value.absent(),
          }) =>
              ProgramTableCompanion(
            id: id,
            channel: channel,
            start: start,
            stop: stop,
            title: title,
            description: description,
            categories: categories,
            icon: icon,
            ratingSystem: ratingSystem,
            ratingValue: ratingValue,
            episodeNum: episodeNum,
            selectedProgram: selectedProgram,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String channel,
            required DateTime start,
            required DateTime stop,
            required String title,
            required String description,
            required String categories,
            required String icon,
            required String ratingSystem,
            required String ratingValue,
            required String episodeNum,
            required String selectedProgram,
          }) =>
              ProgramTableCompanion.insert(
            id: id,
            channel: channel,
            start: start,
            stop: stop,
            title: title,
            description: description,
            categories: categories,
            icon: icon,
            ratingSystem: ratingSystem,
            ratingValue: ratingValue,
            episodeNum: episodeNum,
            selectedProgram: selectedProgram,
          ),
        ));
}

class $$ProgramTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProgramTableTable> {
  $$ProgramTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get stop => $state.composableBuilder(
      column: $state.table.stop,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get categories => $state.composableBuilder(
      column: $state.table.categories,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ratingSystem => $state.composableBuilder(
      column: $state.table.ratingSystem,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ratingValue => $state.composableBuilder(
      column: $state.table.ratingValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get episodeNum => $state.composableBuilder(
      column: $state.table.episodeNum,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get selectedProgram => $state.composableBuilder(
      column: $state.table.selectedProgram,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ChannelTableTableFilterComposer get channel {
    final $$ChannelTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.channel,
        referencedTable: $state.db.channelTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChannelTableTableFilterComposer(ComposerState($state.db,
                $state.db.channelTable, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter creditTableRefs(
      ComposableFilter Function($$CreditTableTableFilterComposer f) f) {
    final $$CreditTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.creditTable,
        getReferencedColumn: (t) => t.program,
        builder: (joinBuilder, parentComposers) =>
            $$CreditTableTableFilterComposer(ComposerState($state.db,
                $state.db.creditTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ProgramTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProgramTableTable> {
  $$ProgramTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get stop => $state.composableBuilder(
      column: $state.table.stop,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get categories => $state.composableBuilder(
      column: $state.table.categories,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ratingSystem => $state.composableBuilder(
      column: $state.table.ratingSystem,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ratingValue => $state.composableBuilder(
      column: $state.table.ratingValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get episodeNum => $state.composableBuilder(
      column: $state.table.episodeNum,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get selectedProgram => $state.composableBuilder(
      column: $state.table.selectedProgram,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ChannelTableTableOrderingComposer get channel {
    final $$ChannelTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.channel,
        referencedTable: $state.db.channelTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChannelTableTableOrderingComposer(ComposerState($state.db,
                $state.db.channelTable, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$CreditTableTableCreateCompanionBuilder = CreditTableCompanion
    Function({
  Value<int> id,
  required String program,
  required String guests,
  required String directors,
  required String actors,
  required String adapters,
  required String producers,
  required String composers,
  required String editors,
  required String selectedProgram,
});
typedef $$CreditTableTableUpdateCompanionBuilder = CreditTableCompanion
    Function({
  Value<int> id,
  Value<String> program,
  Value<String> guests,
  Value<String> directors,
  Value<String> actors,
  Value<String> adapters,
  Value<String> producers,
  Value<String> composers,
  Value<String> editors,
  Value<String> selectedProgram,
});

class $$CreditTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CreditTableTable,
    CreditTableData,
    $$CreditTableTableFilterComposer,
    $$CreditTableTableOrderingComposer,
    $$CreditTableTableCreateCompanionBuilder,
    $$CreditTableTableUpdateCompanionBuilder> {
  $$CreditTableTableTableManager(_$AppDatabase db, $CreditTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CreditTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CreditTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> program = const Value.absent(),
            Value<String> guests = const Value.absent(),
            Value<String> directors = const Value.absent(),
            Value<String> actors = const Value.absent(),
            Value<String> adapters = const Value.absent(),
            Value<String> producers = const Value.absent(),
            Value<String> composers = const Value.absent(),
            Value<String> editors = const Value.absent(),
            Value<String> selectedProgram = const Value.absent(),
          }) =>
              CreditTableCompanion(
            id: id,
            program: program,
            guests: guests,
            directors: directors,
            actors: actors,
            adapters: adapters,
            producers: producers,
            composers: composers,
            editors: editors,
            selectedProgram: selectedProgram,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String program,
            required String guests,
            required String directors,
            required String actors,
            required String adapters,
            required String producers,
            required String composers,
            required String editors,
            required String selectedProgram,
          }) =>
              CreditTableCompanion.insert(
            id: id,
            program: program,
            guests: guests,
            directors: directors,
            actors: actors,
            adapters: adapters,
            producers: producers,
            composers: composers,
            editors: editors,
            selectedProgram: selectedProgram,
          ),
        ));
}

class $$CreditTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CreditTableTable> {
  $$CreditTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get guests => $state.composableBuilder(
      column: $state.table.guests,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get directors => $state.composableBuilder(
      column: $state.table.directors,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get actors => $state.composableBuilder(
      column: $state.table.actors,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get adapters => $state.composableBuilder(
      column: $state.table.adapters,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get producers => $state.composableBuilder(
      column: $state.table.producers,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get composers => $state.composableBuilder(
      column: $state.table.composers,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get editors => $state.composableBuilder(
      column: $state.table.editors,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get selectedProgram => $state.composableBuilder(
      column: $state.table.selectedProgram,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProgramTableTableFilterComposer get program {
    final $$ProgramTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.program,
        referencedTable: $state.db.programTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProgramTableTableFilterComposer(ComposerState($state.db,
                $state.db.programTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$CreditTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CreditTableTable> {
  $$CreditTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get guests => $state.composableBuilder(
      column: $state.table.guests,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get directors => $state.composableBuilder(
      column: $state.table.directors,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get actors => $state.composableBuilder(
      column: $state.table.actors,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get adapters => $state.composableBuilder(
      column: $state.table.adapters,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get producers => $state.composableBuilder(
      column: $state.table.producers,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get composers => $state.composableBuilder(
      column: $state.table.composers,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get editors => $state.composableBuilder(
      column: $state.table.editors,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get selectedProgram => $state.composableBuilder(
      column: $state.table.selectedProgram,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProgramTableTableOrderingComposer get program {
    final $$ProgramTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.program,
        referencedTable: $state.db.programTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProgramTableTableOrderingComposer(ComposerState($state.db,
                $state.db.programTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ChannelTableTableTableManager get channelTable =>
      $$ChannelTableTableTableManager(_db, _db.channelTable);
  $$ProgramTableTableTableManager get programTable =>
      $$ProgramTableTableTableManager(_db, _db.programTable);
  $$CreditTableTableTableManager get creditTable =>
      $$CreditTableTableTableManager(_db, _db.creditTable);
}
