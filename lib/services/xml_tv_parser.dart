import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/services/date_utils.dart';
import 'package:xml/xml.dart';

class XmlTvParser {
  final htmlUnescape = HtmlUnescape();

  // Format was 20240804065600 +0200
  // now is 2024-08-04 06:56:00 +0200
  final format = DateFormat('yyyy-MM-dd HH:mm:ss Z');

  String cleanup(String xmlSource) {
    return xmlSource.replaceAll('<p>', '').replaceAll('</p>', '');
  }

  XmlTv parse(String xmlSource) {
    debugPrint('Parsing XML');
    final document = XmlDocument.parse(cleanup(xmlSource));

    debugPrint('Parsing channels...');
    final channels = document.findAllElements('channel').map((element) {
      return parseChannel(element);
    }).toList();

    final now = DateTime.now();
    final year = now.year;
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    final today = '$year$month$day';

    debugPrint('Parsing programs...');
    final programs = document
        .findAllElements('programme')
        .where((element) {
          final start = element.getAttribute('start');
          return start?.startsWith(today) ?? false;
        })
        .map((element) {
          return parseProgram(element);
        })
        .where((element) => element != null)
        .map((e) => e!)
        .toList();

    return XmlTv(channels: channels, programs: programs);
  }

  String? unescape(String? source) {
    if (source == null) {
      return null;
    }
    return htmlUnescape.convert(source);
  }

  Channel parseChannel(XmlElement element) {
    debugPrint('Parsing channel...');
    final id = element.getAttribute('id');
    final displayName =
        element.findElements('display-name').firstOrNull?.innerText;
    final icon = element.findElements('icon').firstOrNull?.getAttribute('src');
    return Channel(id: id, name: displayName, icon: unescape(icon));
  }

  Program? parseProgram(XmlElement element) {
    debugPrint('Parsing program...');

    final start = element.getAttribute('start');
    final stop = element.getAttribute('stop');
    final channelId = element.getAttribute('channel');
    final title = element.findElements('title').first.innerText;
    final description = element.findElements('desc').first.innerText;
    final categories =
        element.findElements('category').map((e) => e.innerText).toList();
    final credits = element.findElements('credits').map((e) {
      return parseCredits(e);
    }).toList();
    final icon = element.findElements('icon').firstOrNull?.getAttribute('src');
    final episodeNum =
        element.findElements('episode-num').firstOrNull?.innerText;
    final rating = parseRating(element.findElements('rating').firstOrNull);

    final startTime =
        start != null ? format.parse(reworkDateString(start)) : null;
    final stopTime = stop != null ? format.parse(reworkDateString(stop)) : null;
    final now = DateTime.now();
    if (startTime != null &&
            startTime.isBefore(now) &&
            stopTime != null &&
            stopTime.isBefore(now) ||
        startTime?.day != now.day) {
      return null;
    }

    return Program(
      channelId: channelId,
      start: startTime,
      stop: stopTime,
      title: title,
      description: description,
      categories: categories,
      icon: unescape(icon),
      credits: credits,
      episodeNum: episodeNum,
      rating: rating,
    );
  }

  Rating? parseRating(XmlElement? element) {
    if (element == null) {
      return null;
    }
    final system = element.getAttribute('system');
    final value = element.findElements('value').first.innerText;
    return Rating(system: system, value: value);
  }

  Credit parseCredits(XmlElement element) {
    final guests =
        element.findElements('guest').map((e) => e.innerText).toList();
    final directors =
        element.findElements('director').map((e) => e.innerText).toList();
    final actors =
        element.findElements('actor').map((e) => e.innerText).toList();
    final adapters =
        element.findElements('adapter').map((e) => e.innerText).toList();
    final producers =
        element.findElements('producer').map((e) => e.innerText).toList();
    final composers =
        element.findElements('composer').map((e) => e.innerText).toList();
    final editors =
        element.findElements('editor').map((e) => e.innerText).toList();
    return Credit(
      guests: guests,
      directors: directors,
      actors: actors,
      adapters: adapters,
      producers: producers,
      composers: composers,
      editors: editors,
    );
  }
}
