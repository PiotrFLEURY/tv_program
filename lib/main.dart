import 'package:flutter/material.dart';
import 'package:tv_program/views/tv_program.dart';
import 'package:tv_program/services/service.dart';
import 'package:tv_program/services/xml_tv_parser.dart';

void main() {
  final parser = XmlTvParser();
  final service = TvService(parser);
  runApp(TvProgram(service: service));
}
