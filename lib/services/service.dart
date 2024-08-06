import 'dart:convert';

import 'dart:typed_data';
import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:tv_program/database/database.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/services/xml_tv_parser.dart';

class TvService {
  static const cacheFileName = '_tv_program_cache.xml';

  // Base URL
  final String baseUrl = 'https://xmltvfr.fr/xmltv';

  // All channels
  static const String allChannels = 'xmltv';

  // TNT channels
  static const String tvTnt = 'xmltv_tnt';

  // France channels
  static const String tvFrance = 'xmltv_fr';

  final String xzFormat = 'xz';
  final String zipFormat = 'zip';

  const TvService(this.parser, this.database);

  final XmlTvParser parser;
  final AppDatabase database;

  Future<Uint8List> downloadProgram(String path) async {
    final url = '$baseUrl/$path.$zipFormat';
    debugPrint('Downloading $url');
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      debugPrint('Failed to download $url: ${response.statusCode}');
      throw Exception('Failed to download $url: ${response.statusCode}');
    }
    return response.bodyBytes;
  }

  Future<XmlTv> getProgram(String selectedProgram) async {
    debugPrint('Getting France TV program');

    // Try to get the XML from the cache
    final containsTodayData = await database.containsTodayData(selectedProgram);

    if (!containsTodayData) {
      // Read the XZ file into a Uint8List
      final xzBytes = await downloadProgram(selectedProgram);

      // Decompress the XZ file
      final archive = decompress(xzBytes);

      // Extract the contents of the archive
      final xml = extractArchive(archive);

      final parsedData = parser.parse(xml);

      // Save the data to the database
      await database.saveTodayData(selectedProgram, parsedData);
    }

    return database.getTodayData(selectedProgram);
  }

  Archive decompress(Uint8List input) {
    debugPrint('Decompressing XZ');
    // Create a XZDecoder and decode the input
    final decoder = ZipDecoder();
    return decoder.decodeBytes(input);
  }

  String extractArchive(Archive archive) {
    debugPrint('Extracting archive');

    return utf8.decode(archive.files.first.content as List<int>);
  }
}
