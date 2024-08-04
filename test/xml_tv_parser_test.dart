import 'dart:io';

import 'package:test/test.dart';
import 'package:tv_program/services/xml_tv_parser.dart';

main() {
  test('should parse', () {
    final xml = File('test/xml_tv.xml').readAsStringSync();

    final parser = XmlTvParser();

    final xmlTv = parser.parse(xml);
    expect(xmlTv.channels, isNotEmpty);
    expect(xmlTv.programs, isNotEmpty);
  });
}
