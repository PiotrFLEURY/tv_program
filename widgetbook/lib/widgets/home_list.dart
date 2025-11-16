import 'package:tv_program/models/channel.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flutter/material.dart';
import 'package:tv_program/views/pages/v2/widgets/home_list.dart';

@widgetbook.UseCase(name: 'Default', type: HomeList)
Widget buildHomeListUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: HomeList(
        channels: List.generate(
          15,
          (index) => Channel(
            id: '$index',
            name: 'Channel $index',
            icon: 'https://picsum.photos/50?random=$index',
          ),
        ),
      ),
    ),
  );
}
