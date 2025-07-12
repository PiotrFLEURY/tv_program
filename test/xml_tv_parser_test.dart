import 'dart:io';

import 'package:test/test.dart';
import 'package:tv_program/services/xml_tv_parser.dart';

void main() {
  test('should parse', () {
    final xml = File('test/xml_tv.xml').readAsStringSync();

    final parser = XmlTvParser();

    // Same date as in the XML file
    // 20240803
    final from = DateTime(2024, 8, 3);

    final xmlTv = parser.parse(xml, from: from);
    expect(xmlTv.channels, isNotEmpty);
    expect(xmlTv.programs, isNotEmpty);
  });
}
