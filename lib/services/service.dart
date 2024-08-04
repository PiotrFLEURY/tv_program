import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
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

  const TvService(this.parser);

  final XmlTvParser parser;

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

  Future<String?> getFromCache(String selectedProgram) async {
    final tempDir = await getTemporaryDirectory();
    final cacheFilePath = '${tempDir.path}/$selectedProgram$cacheFileName';

    final file = File(cacheFilePath);
    if (await file.exists()) {
      final outdated =
          DateTime.now().difference(await file.lastModified()).inHours > 12;
      return outdated ? null : file.readAsString();
    }
    return null;
  }

  Future<void> putInCache(String xml, String selectedProgram) async {
    final tempDir = await getTemporaryDirectory();
    final cacheFilePath = '${tempDir.path}/$selectedProgram$cacheFileName';

    // Try to find existing cache file
    final file = File(cacheFilePath);
    if (await file.exists()) {
      debugPrint('Deleting existing cache file');
      await file.delete();
    }
    // Save to cache
    debugPrint('Saving to cache');
    await file.writeAsString(xml);
  }

  Future<XmlTv> getProgram(String selectedProgram) async {
    debugPrint('Getting France TV program');

    // Try to get the XML from the cache
    var xml = await getFromCache(selectedProgram);

    if (xml == null) {
      // Read the XZ file into a Uint8List
      final xzBytes = await downloadProgram(selectedProgram);

      // Decompress the XZ file
      final archive = decompress(xzBytes);

      // Extract the contents of the archive
      xml = extractArchive(archive);

      // Save the XML to the cache
      await putInCache(xml, selectedProgram);
    }

    return parser.parse(xml);
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
