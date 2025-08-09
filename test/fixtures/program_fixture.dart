import 'package:tv_program/models/program.dart';
import 'package:tv_program/models/rating.dart';

Program aProgram(String channelId) => Program(
      channelId: channelId,
      title: 'Program 1',
      description: 'Description 1',
      categories: ['Category 1'],
      icon: '',
      rating: Rating(system: 'TV', value: '5'),
      credits: [],
      episodeNum: '1',
      start: DateTime.now(),
      stop: DateTime.now().add(Duration(hours: 1)),
    );
