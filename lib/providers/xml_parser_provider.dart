import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tv_program/services/xml_tv_parser.dart';

part 'xml_parser_provider.g.dart';

@riverpod
XmlTvParser xmlTvParser(Ref ref) => XmlTvParser();
