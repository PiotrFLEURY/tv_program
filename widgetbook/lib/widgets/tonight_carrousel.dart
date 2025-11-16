import 'package:flutter/material.dart';
import 'package:tv_program/views/pages/v2/widgets/tonight_carrousel.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: TonightCarrousel)
Widget buildTonightCarrouselUseCase(BuildContext context) {
  return Scaffold(body: Center(child: TonightCarrousel()));
}
